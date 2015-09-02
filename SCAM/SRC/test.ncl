;IOP variables for CAM, from Ikuan's input iop file 
;CAM Input: SAM Output
;ps: Ps:long_name = "Surface Pressure" ;
;Ptend: dPs/dt ; "Surface Pressure Tendency"
;lev: p:long_name = "pressure" ; THIS IS PROBABLY JUST THE HYDROSTATIC PRESSURE
;lat: 0
;lon: 0
;time: 0
;u: U:long_name = "x wind component" ;
;v: V:long_name = "y wind component" ;
;usfc: u(1)
;vsfc: v(1)
;t: TABS:long_name = "Absolute temperature" (K);
;q(kg/kg):  QV:long_name = "Water vapor" (g/kg);
;phis: set to zero
;divT (K/day): THTEND:long_name = "Large-Scale Horizontal Advection Temperature Tendency" (K/s);
;divq (kg/kb/s): QHTEND:long_name = "Large-Scale Horizontal Advection Moisture Tendency" (g/kg/day);
;omega (Pa/s): W (m/s);
;dTdt (K/s)
;dqdt
;dsdt



;;;;;;;!!!!!!!!!!!!!!!!!!!! how to obtain omega
;!!!!!!!!!!!!! NEED dTdt for heating
;*************************************************
; NCL tutorial script: vert_3.ncl
; this script demonstrates how to use int2p to 
; interpolate from one set of pressure levels to 
; another. Since we only have model data that is
; on hybrid levels, we will conduct that interpolation
; first.
;
; As of V5.2.0 and later, you can use int2p_n for
; faster interpolation (no reordering required).
;************************************************
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl"
;************************************************
begin
;************************************************
; file handling
;************************************************
; fn_SAM_3D = "sam_output/gino/OUT_RCE.795162/OUT_3D/RCE_64x64x64_ctl_64_0000000120.nc"
  fn_SAM_3D = "sam_output/gino/OUT_RCE.795162/OUT_3D/RCE_64x64x64_ctl_64_0000000120.nc"
  in_SAM_3D = addfile(fn_SAM_3D,"r")                         ; open netcdf file
; fn_SAM_2D = "sam_output/gino/OUT_RCE.795162/OUT_2D/RCE_64x64x64_ctl_64.2Dcom_1.nc"
  fn_SAM_2D = "sam_output/gino/OUT_RCE.795162/OUT_2D/RCE_64x64x64_ctl_64.2Dcom_1.nc"
  in_SAM_2D = addfile(fn_SAM_2D,"r")  
  fn_CAM = "cam_output/ccsm4_0_cfsrr_Fcst.E1.cam2.h1.1993-05-03-00000.nc"
  in_CAM = addfile(fn_CAM,"r")
  ; **************************************************
  ;  get list of all files and open as "one big file"
  ; **************************************************
  ;  all_files = systemfunc("ls sam_output/gino/OUT_RCE.795162/OUT_3D/*.nc")
  ;  fall      = addfiles(all_files, "r")   ; note the "s" of addfile
  ; **************************************************
  ;  choose how files are combined and read in variable across files
  ; **************************************************
  ; ListSetType(fall, "cat")   ;  concatenate or "merge" (default)
  ; T = fall[:]->T
;************************************************
; Int2p Param
;************************************************
; CAM hybrid coeff
  phis = 0                     
  p0mb = 1000.
  hyam = in_CAM->hyam                               ; get a coefficiants
  hybm = in_CAM->hybm                               ; get b coefficiants

; type of interpolation: 1 = linear, 2 = log, -1 = linear interp and extrap 
  interp = -1 
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

; Dry Static Energy parameters
  cp    = 1004                                     ; dry air heat capacity J kg-1 K-1
  g     = 9.80665                        
  R     = 287.                                     ; Dry air const J kg-1 K-1

;************************************************
; input variables
;************************************************

; Capitalized SAM Variables

; Coordinates (time, z, y, x) with only one time sample
  ilat    = (/ 0, 1, 2 /)
  ilon    = (/ 0, 1, 2 /)
  it      = 0

; Save 3D variables to calculate divergence
  T_3D    = in_SAM_3D->TABS(it,:,:,:)              ; variable to interp 
  T       = dim_avg_n(T_3D(:,ilat,ilon),(/1,2/))   ; average over ilat ilon domain
  DTdt_3D = in_SAM_3D->dTdt(it,:,:,:)              ; T tendency without large scale and radiative heating (dTdt = Q1C_3D)     
  DTdt    = dim_avg_n(DTdt_3D(:,ilat,ilon),(/1,2/))                    
  DSdt_3D = cp*DTdt_3D                             ; Dry static energy (dse) tendency
  DSdt    = dim_avg_n(DSdt_3D(:,ilat,ilon),(/1,2/))
  DQdt_3D = in_SAM_3D->dQdt(it,:,:,:)
  DQdt    = dim_avg_n(DQdt_3D(:,ilat,ilon),(/1,2/)); water vapor tendency
  PP_3D   = in_SAM_3D->PP(it,:,:,:)                ; pressure perturbation
  PP      = dim_avg_n(PP_3D(:,ilat,ilon),(/1,2/))
  Pz      = in_SAM_3D->p(:)                        ; hydrostatic pressure
  P       = Pz + PP
  U_3D    = in_SAM_3D->U(it,:,:,:)
  U       = dim_avg_n(U_3D(:,ilat,ilon),(/1,2/))
  V_3D    = in_SAM_3D->V(it,:,:,:)
  V       = dim_avg_n(V_3D(:,ilat,ilon),(/1,2/))
  W_3D    = in_SAM_3D->W(it,:,:,:)
  W       = dim_avg_n(W_3D(:,ilat,ilon),(/1,2/))
  Q_3D    = in_SAM_3D->QV(it,:,:,:)                ; water vapor mixing ratio
  Q       = dim_avg_n(Q_3D(:,ilat,ilon),(/1,2/))
  Z       = in_SAM_3D->z(:)                        ; height 
  S_3D = new((/dimsizes(DSdt_3D)/),double)
  ; print(dimsizes(S_3D))
  ; sleep(10)
  iz=0
  do while(iz.le.dimsizes(Z)-1)
    S_3D(iz,:,:) = T_3D(iz,:,:) + g*Z(iz)/cp       ; Dry Static energy per unit c_p, S = T + gz/c_p
    iz = iz + 1 ;
  end do


; Coordinates (time, y, x) with a time-series
  ps_2D       = in_SAM_2D->PSFC(it,:,:)
  ps          = dim_avg(dim_avg(ps_2D(ilat,ilon)))
  usrf_2D     = in_SAM_2D->USFC(it,:,:)
  usrf        = dim_avg(dim_avg(usrf_2D(ilat,ilon)))
  vsrf_2D     = in_SAM_2D->VSFC(it,:,:)
  vsrf        = dim_avg(dim_avg(vsrf_2D(ilat,ilon)))
  shflx_2D    = in_SAM_2D->SHF(it,:,:)
  shflx       = dim_avg(dim_avg(shflx_2D(ilat,ilon)))
  lhflx_2D    = in_SAM_2D->LHF(it,:,:)
  lhflx       = dim_avg(dim_avg(lhflx_2D(ilat,ilon)))
  TOA_LWup_2D = in_SAM_2D->LWNT(it,:,:)      ; "Net LW at TOA"
  TOA_LWup    = dim_avg(dim_avg(TOA_LWup_2D(ilat,ilon)))
  TOA_SWdn_2D = in_SAM_2D->SWNT(it,:,:)      ; "Net SW at TOA"
  TOA_SWdn    = dim_avg(dim_avg(TOA_SWdn_2D(ilat,ilon))) 
  TOA_SWins_2D= in_SAM_2D->SOLIN(it,:,:)     ; "Solar Insolation TOA"
  TOA_SWins   = dim_avg(dim_avg(TOA_SWins_2D(ilat,ilon)))
  NDRsrf_2D   = in_SAM_2D->SWNS(it,:,:)      ; "Net SW at the surface" ;
  NDRsrf      = dim_avg(dim_avg(NDRsrf_2D(ilat,ilon)))


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
      ;S_3D(iz,:,:) = T_3D(iz,:,:) + g*Z(iz)/cp      ; Dry Static energy per unit c_p, S = T + gz/c_p 
      iz = iz + 1 ; 
    end do
    dp(0) = ps - p(0)
    dp(1:25) = p(0:24) - p(1:25)                    ; thickness in each hybrid level
;*************************************************
; calculate divergence: Use Wrap to include meta data
;*************************************************
  DIVT_3D = uv2dvG_Wrap(U_3D*T_3D,V_3D*T_3D)        ; u,v ==> divergence
  DIVQ_3D = uv2dvG_Wrap(U_3D*Q_3D,V_3D*Q_3D)
  DIVU_3D = uv2dvG_Wrap(U_3D,V_3D)
  DIVS_3D = uv2dvG_Wrap(U_3D*S_3D,V_3D*S_3D)
  DIVT    = dim_avg_n(DIVT_3D(:,ilat,ilon),(/1,2/))
  DIVQ    = dim_avg_n(DIVQ_3D(:,ilat,ilon),(/1,2/))
  DIVU    = dim_avg_n(DIVU_3D(:,ilat,ilon),(/1,2/))
  DIVS    = dim_avg_n(DIVS_3D(:,ilat,ilon),(/1,2/))
;************************************************
; calculate variables on CAM hybrid levels
;************************************************
  t    = int2p(P,T,p,interp)
  q    = int2p(P,Q,p,interp)
  divT = int2p(P,DIVT,p,interp)
  divq = int2p(P,DIVQ,p,interp)
  divU = int2p(P,DIVU,p,interp)
  divs = int2p(P,DIVS,p,interp)
  dTdt = int2p(P,DTdt,p,interp)
  dsdt = int2p(P,DSdt,p,interp)
  dqdt = int2p(P,DQdt,p,interp)
  u = int2p(P,U,p,interp)
  v = int2p(P,V,p,interp)
  w = int2p(P,W,p,interp)
  omega = -w*p/t/R*g                 ; vertical pressure velocity
  pstend = -divU#dp                   ; Ptend = -int_TOA^s(divUV)dp surface pressure tendency, integrating the horizontal div from TOA to surface pressure, (#) is dot product
  phis = 0
;   OMEGA = -W*P/T/R*g                 ; R = 287.058 (m2/(s2 K)), g = 9.80665 (m/s^2), rho = p/(R*t) (kg/m^3), omega = -w*rho*g (Pa/s)
;   omega2 = int2p(P,OMEGA,p,interp)
;   it =x it + 1;
; end do
  p@units = "mb"
; t@lev = p ; 
  t!0 = "lev" ;
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


  lev  = in_CAM->lev  
  lat  = 0 ; in_CAM->lat
  lon  = 0 ; in_CAM->lon
  time = 0
  
;function outputVar(lev,lat,lon,time)
;begin
    ;===================================================================  
    ; Assume variables T, PS and ORO exist and that they have 
    ; associated meta data: (a) coordinate variables time, lev, lat, lon       
    ; and (b) attributes
    ;===================================================================  
        ntim  = dimsizes(time)                 ; get dimension sizes  
	nlev  = dimsizes(lev)                                               
	nlat  = dimsizes(lat)  
	nlon  = dimsizes(lon)      
        
        diro = "./"                     ; Output directory
        filo = "example.nc"             ; Output file
	system("/bin/rm -f " + diro + filo)    ; remove if exists
	fout  = addfile (diro + filo, "c")  ; open output file

    ;===================================================================
    ; explicitly declare file definition mode. Improve efficiency.
    ;===================================================================
        setfileoption(fout,"DefineMode",True)

    ;===================================================================
    ; create global attributes of the file
    ;===================================================================
        fAtt               = True            ; assign file attributes
	fAtt@title         = "NCL Efficient Approach to netCDF Creation"  
	fAtt@source_file   =  "original-file.nc"
	fAtt@Conventions   = "None"   
	fAtt@creation_date = systemfunc ("date")        
	fileattdef( fout, fAtt )            ; copy file attributes    

    ;===================================================================
    ; predefine the coordinate variables and their dimensionality
    ; Note: to get an UNLIMITED record dimension, we set the dimensionality
    ; to -1 (or the actual size) and set the dimension name to True.
    ;===================================================================
        dimNames = (/"time", "lat", "lon", "lev"/)  
	dimSizes = (/ -1   ,  nlat,  nlon, nlev /) 
	dimUnlim = (/ True , False, False, False/)   
	filedimdef(fout,dimNames,dimSizes,dimUnlim)

    ;===================================================================
    ; predefine the the dimensionality of the variables to be written out
    ;===================================================================
    ; Here we are using NCL functions to facilitate defining 
    ; each variable's dimension name(s) and type. 
    ; The following could be replaced with explicit, user defined dimension 
    ; names different from those associated with the variable in memory. 
    ; Say, PS(time,lat,lon) in the NCL script. They could be redefined for the file via: 
    ; filevardef(fout, "PS"   ,typeof(PS) ,(/"TIME","latitude","longitude"/)) 
    ;===================================================================
;       filevardef(fout, "time" ,typeof(time),getvardims(time)) 
;       filevardef(fout, "lev"  ,typeof(lev),getvardims(lev) )                           
;       filevardef(fout, "lat"  ,typeof(lat),getvardims(lat))                          
;       filevardef(fout, "lon"  ,typeof(lon),getvardims(lon))                          
;       filevardef(fout, "t"    ,typeof(t)  ,getvardims(t))    
;       filevardef(fout, "PS"   ,typeof(PS) ,getvardims(PS))          
;       filevardef(fout, "TOPOG",typeof(ORO),getvardims(ORO))  ; variable name on the file                
                                                              ; different from name on script
    ;===================================================================
    ; Copy attributes associated with each variable to the file
    ; All attributes associated with each variable will be copied.
    ;====================================================================
;       filevarattdef(fout,"t",t)                           ; copy T attributes
;       filevarattdef(fout,"time" ,time)                    ; copy time attributes
;       filevarattdef(fout,"lev"  ,lev)                     ; copy lev attributes
;       filevarattdef(fout,"lat"  ,lat)                     ; copy lat attributes
;       filevarattdef(fout,"lon"  ,lon)                     ; copy lon attributes
;       filevarattdef(fout,"PS"   ,PS)                      ; copy PS attributes
;       filevarattdef(fout,"TOPOG",ORO)                     ; copy TOPOG attributes

    ;===================================================================
    ; explicitly exit file definition mode. **NOT REQUIRED**
    ;===================================================================
        setfileoption(fout,"DefineMode",False)

    ;===================================================================
    ; output only the data values since the dimensionality and such have
    ; been predefined. The "(/", "/)" syntax tells NCL to only output the
    ; data values to the predefined locations on the file.
    ;====================================================================
       fout->time   = (/time/)     
       fout->lev    = (/lev/)
       fout->lat    = (/lat/)
       fout->lon    = (/lon/) 
       fout->t      = (/t/)
       fout->q      = (/q/)
       fout->divT      = (/divT/)
       fout->divq      = (/divq/)
       fout->divU      = (/divU/)
       fout->divs      = (/divs/)
       fout->dTdt      = (/dTdt/)
       fout->dsdt      = (/dsdt/)
       fout->dqdt      = (/dqdt/)
       fout->u      = (/u/)
       fout->v      = (/v/)
       fout->w      = (/w/)
       fout->omega  = (/omega/)
       fout->pstend = (/pstend/)
       fout->phis   = (/phis/)
       fout->p      = (/p/)
       fout->ps     = (/ps/)
       fout->usrf   = (/usrf/)
       fout->vsrf   = (/vsrf/)
       fout->shflx  = (/shflx/)
       fout->lhflx  = (/lhflx/)
       fout->TOA_LWup=(/TOA_LWup/)
       fout->TOA_SWdn=(/TOA_SWdn/)
       fout->TOA_SWins=(/TOA_SWins/)
       fout->NDRsrf = (/NDRsrf/)
       fout->tsair = (/tsair/)
    

;       fout->Z      = (/PS/)
;       fout->TOPOG  = (/ORO/)
end
