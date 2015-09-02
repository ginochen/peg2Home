;------------------------------------------------------------------------------
; Purpose : 
; Applies coarse-grained and vert-intrp for SAM outputs
; The processed data are substituted with Single Column CAM initial conditions (ocean only)
; PS, T, TS, Q, CWAT, U, V
; PSFC, TABS, SST, QV/1000, QN/1000, U, V (SAM corresponding)
;------------------------------------------------------------------------------

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl"
;************************************************
begin
;************************************************
; file handling
;************************************************
  fn_SAM_3D = "sam_output/gino/OUT_RCE.795162/OUT_3D/RCE_64x64x64_ctl_64_0000000120.nc"
  fn_SAM_2D = "sam_output/gino/OUT_RCE.795162/OUT_2D/RCE_64x64x64_ctl_64.2Dcom_1.nc"
  fn_CAMiop = "/nethome/gchen/SCAM/inputdata/scam/iop/TOGAII_4scam.nc" ; need only the lat lon 
  fn_CAM    = "/nethome/bkirtman/ccsm_inputdata/inputdata/atm/cam/inic/gaus/cami_0000-09-01_48x96_L26_c040420.nc"

  in_SAM_3D = addfile(fn_SAM_3D,"r")                         ; open netcdf file
  in_SAM_2D = addfile(fn_SAM_2D,"r")  
  in_CAMiop = addfile(fn_CAMiop,"r") 
  in_CAM    = addfile(fn_CAM,"r")

;********************
; SCAM dimension
;********************
  lev     = in_CAM->lev  
  lat     = in_CAM->lat
  lon     = in_CAM->lon
  latiop  = in_CAMiop->lat   ; the lat lon has to be fixed to the IOP case for SCAM
  loniop  = in_CAMiop->lon
  time = 0
;************************************************
; Int2p Param
;************************************************
; CAM hybrid coeff
  phis = 0                     
  p0mb = 1000.
  hyam = in_CAM->hyam                               ; get a coefficiants
  hybm = in_CAM->hybm                               ; get b coefficiants

  interp = -1 
; type of interpolation: 1 = linear, 2 = log, -1 = linear interp/extrap 

; dsizes = dimsizes(T)
; nt = dsizes(0) - 1 
; ny = dsizes(2) - 1
; nx = dsizes(3) - 1
  nz = dimsizes(hyam) - 1
  p = new((/dimsizes(hyam)/),double)
  dp = new((/dimsizes(hyam)/),double)
  t = new((/dimsizes(hyam)/),double)
  p@units = "mb"
  tg = 300                                         ; "Ground Temperature", find sst in 64_RCE_dynOcnRad.524184.out
  tsair = tg                                       ; "Surface Air Temperature"

;******************************
; Dry Static Energy parameters
;******************************
  cp    = 1004                                     ; dry air heat capacity J kg-1 K-1
  g     = 9.80665                        
  R     = 287.                                     ; Dry air const J kg-1 K-1

;************************************************
; Input variables
;************************************************

; SAM Variables (Capitalized)

; Specify Coordinate Indices (Coarse-grained)
  ilat    = (/ 0, 1, 2 /)
  ilon    = (/ 0, 1, 2 /)
  it      = 0

; Save 3D variables to calculate divergence
  U_3D    = in_SAM_3D-> U(it,:,ilat,ilon)
  V_3D    = in_SAM_3D-> V(it,:,ilat,ilon)
  T_3D    = in_SAM_3D->TABS(it,:,ilat,ilon)              ; variable to interp 
  PP_3D   = in_SAM_3D->PP(it,:,ilat,ilon)                ; pressure perturbation
  Q_3D    = in_SAM_3D->QV(it,:,ilat,ilon)                ; water vapor mixing ratio
  CWAT_3D = in_SAM_3D->QN(it,:,ilat,ilon)
  Z       = in_SAM_3D->z(:)                        ; height 
  Pz      = in_SAM_3D->p(:)                        ; hydrostatic pressure
  PP      = dim_avg_n(PP_3D,(/1,2/))
  P       = Pz + PP
  T       = dim_avg_n(T_3D,(/1,2/))   ; average over ilat ilon domain
  U       = dim_avg_n(U_3D,(/1,2/))
  V       = dim_avg_n(V_3D,(/1,2/))
  Q       = dim_avg_n(Q_3D,(/1,2/))/1000
  CWAT    = dim_avg_n(CWAT_3D,(/1,2/))/1000

; Coordinates (time, y, x) with a time-series
  ps_2D   = in_SAM_2D->PSFC(it,:,:)
  ps      = dim_avg(dim_avg(ps_2D(ilat,ilon)))
  ts_2D   = in_SAM_2D->TS(it,:,:)
  ts      = dim_avg(dim_avg(ts_2D(ilat,ilon)))

;*************************************************************
; interpolate variables from SAM to CAM in pressure coordinate
;*************************************************************
; it = 0
; do while(it.le.nt)
    iz = 0
;   *****************************************************************************
;    calculate p on CAM associated to Ps from SAM if Ps changes in space and time
;   *****************************************************************************
    do while(iz.le.nz)
      p(nz-iz) = hyam(iz)*p0mb + hybm(iz)*ps        ; SCAM hybrid level associated pressure 
;      S_3D(iz,:,:) = T_3D(iz,:,:) + g*Z(iz)/cp      ; Dry Static energy per unit c_p, S = T + gz/c_p 
      iz = iz + 1 ; 
    end do
    dp(0) = ps - p(0)
    dp(1:25) = p(0:24) - p(1:25)                    ; thickness in each hybrid level
;************************************************
; Intrp 3D Var to CAM hybrid levels
;************************************************
  t    = int2p(P,T,p,interp)
  q    = int2p(P,Q,p,interp)
  cwat = int2p(P,CWAT,p,interp) 
  u    = int2p(P,U,p,interp)
  v    = int2p(P,V,p,interp)
  phis = 0
;************************************************
; plot parameters that do not change
;************************************************
;  wks  = gsn_open_wks("x11","vert")               ; Opens a .ps file
;  gsn_define_colormap(wks,"wh-bl-gr-ye-re")       ; choose colormap

;  res                 = True                      ; plot mods desired
;  res@tiMainString    = "Pressure to Pressure Interpolation" 
;  res@tmYRMode        = "Automatic"               ; turn off height labels
;  plot = gsn_csm_xy(wks,w,p,res)
; plot = gsn_csm_xy(wks,omega,p,res)


  
;function outputVar(lev,lat,lon,time)
  ntim  = dimsizes(time)                 ; get dimension sizes  
  nlev  = dimsizes(lev)                                               
  nlat  = dimsizes(lat)  
  nlon  = dimsizes(lon)      
    ;===================================================================
    ; Substitute the Column into a zero valued 3D grid (at the lat-lon of IOP)
    ; output only the data values since the dimensionality and such have
    ; been predefined. The "(/", "/)" syntax tells NCL to only output the
    ; data values to the predefined locations on the file.
    ;====================================================================
  latlon = new((/dimsizes(lat),dimsizes(lon)/),double)
  ; generate lat2d lon2d
  PS_CAM   = in_CAM-> PS
  T_CAM    = in_CAM-> T
  TS_CAM   = in_CAM-> TS
  Q_CAM    = in_CAM-> Q
  CWAT_CAM = in_CAM-> CWAT
  U_CAM    = in_CAM-> U
  V_CAM    = in_CAM-> V
  
       in_CAM->t      = (/t/)
       in_CAM->q      = (/q/)
       in_CAM->u      = (/u/)
       in_CAM->v      = (/v/)
       in_CAM->phis   = (/phis/)
       in_CAM->p      = (/p/)
       in_CAM->ps     = (/ps/)
       in_CAM->ts     = (/ts/)
       in_CAM->cwat   = (/cwat/)
       in_CAM->ts     = (/ts/)
    

end
