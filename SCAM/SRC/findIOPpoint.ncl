
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl"

begin


  fn_CAMiop = "/nethome/gchen/SCAM/inputdata/atm/cam/scam/iop/TOGAII_4scam.nc" ; need only the lat lon 
  fn_CAM    = "/nethome/gchen/SCAM/cami_0000-01-01_64x128_L30_c090102.nc"

  in_CAMiop = addfile(fn_CAMiop,"r") 
  in_CAM    = addfile(fn_CAM,"w")


  lat     = in_CAM->lat
  lon     = in_CAM->lon
  latiop  = in_CAMiop->lat   ; the lat lon has to be fixed to the IOP case for SCAM
  loniop  = in_CAMiop->lon

; ----------------------
; Find the index for IOP
; ----------------------
  ilatiop = minind(abs(latiop - lat)) ; get the lat index for iop in cami.nc
  iloniop = minind(abs(loniop - lon))

  print("ilon, ilat")
  print((/iloniop,ilatiop/))
  
end
