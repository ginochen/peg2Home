
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl"
begin
;---------------------------------
; Open the ncfile
;---------------------------------
 fn_3D = "sam_output/gino/OUT_RCE.795162/OUT_3D/RCE_64x64x64_ctl_64_0000000120.nc"
 in_3D = addfile(fn_3D,"r") 
 fn_2D = "sam_output/gino/OUT_RCE.795162/OUT_2D/RCE_64x64x64_ctl_64.2Dcom_1.nc"
 in_2D = addfile(fn_2D,"r") 

;-----------------------------------------------------------------
; Read in the variables that are needed for coarse-grain (cami.nc)
; PS; T; TS; Q; CWAT; U; V;
;-----------------------------------------------------------------
 T = in_3D->TABS(it,:,:,:) 

;--------------
; Coarse-grain
;--------------


;--------------
; Output
;--------------

  
