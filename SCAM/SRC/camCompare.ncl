
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl"

begin


; Open two CAM files 
  fn_CAM_3D = "nethome/gchen/SCAM/inputdata/atm/cam/inic/gaus/cami_0000-09-01_64x128_L30_c031210.nc" ; CAM initial field
  fn_CAM_1D = "nethome/gchen/SCAM/scratch/scam5_cam_togaII_1timestep14_togaII_L30_T60/camrun.cam.r.1992-12-18-64860.nc" ; CAM 1 step column

; Find the TOGAII lat lon point for SCAM
    

; Subtract the two files QoI

; Save the QoI

; NCVIEW if the profiles are zero (or near)



end
