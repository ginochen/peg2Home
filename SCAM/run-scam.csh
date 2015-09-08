#!/bin/csh -f

# Script to make a community-available SCAM run library for ARM standard IOP cases

# Lin Su and John Truesdale (please contact Lin Su (linsu@ucar.edu) for SCAM diagnostic package)).

set VERSION=12072012
echo "***** Version - $VERSION *****"

#########################################################################
### Set vars needed for this script code dir, case, data dir, mods, wrkdir
#########################################################################

set CAM_ROOT  = /nethome/gchen/CESM/cesm#/models/atm/cam/bld/namelist_files/use_cases/ #/glade/p/work/ihu/CESM/cesm1_3_beta07   #/glade/p/work/ginochen/spcam2_0-cesm1_1_1/
set CSMDATA   = /nethome/gchen/SCAM/inputdata#/nethome/bkirtman/ccsm_inputdata/inputdata
set USR_SRC =  # Test mods dir.

###set IOP_CASES_TO_RUN = 'arm95 arm97 gateIII mpace sparticus togaII twp06'
set IOP_CASES_TO_RUN = 'twp06' ## 'gateIII' ## 'twp06' ## 'togaII' ## 'arm97'

###set CAM_TIMESTEPS_TO_RUN = '60 300 600 900 1200'
set CAM_TIMESTEPS_TO_RUN = '60'

### set CAM_LEVELS  # options are 26,27,30,60,90,120,150,180,210,240
                    # you must have initial condition files for number of levels
set CAM_LEVELS_TO_RUN = 30 

#set CASE = scam5_cam_togaII_1timestep15 ## scam5_gateIII_001 ## scam5_twp06_005 ## scam5_togaII_001 ## scam5_arm97_004
set CASE = scam5_cam_twp06_1timestep16 ## scam5_gateIII_001 ## scam5_twp06_005 ## scam5_togaII_001 ## scam5_arm97_004

set WRKDIR = /nethome/gchen/SCAM && if (! -e  $WRKDIR) mkdir -p $WRKDIR

#########################################################################
### Select compiler+libraries env vars and set paths depending on machine.
#########################################################################

set FC_DIR=/share/opt/intel/composer_xe_2013.2.146/compiler/
set USER_FC=ifort
set NCHOME=/share/apps/netcdf/4.2.1.1/intel/13.0.2.146/
set DBUG = "-debug"

#########################################################################
### Shouldn't have to modify below here
#########################################################################

setenv INC_NETCDF ${NCHOME}/include
setenv LIB_NETCDF ${NCHOME}/lib
setenv NCARG_ROOT /share/apps/ncl/6.1.2
setenv PATH ${NCHOME}/bin:${FC_DIR}/bin:${NCARG_ROOT}/bin:${PATH}
setenv LD_LIBRARY_PATH ${FC_DIR}/lib:${LIB_NETCDF}:${LD_LIBRARY_PATH}

alias MATH 'set \!:1 = `echo "\!:3-$" | bc -l`'  # do not modify this

set runtypes="test"

#########################################################################
# NOTE: Below, set iopname, levarr, tarray.  can be more than one values, if so will loop 
#########################################################################

foreach iopname ($IOP_CASES_TO_RUN) # change this, see above (depending on case you want to simulate)
foreach tarray ($CAM_TIMESTEPS_TO_RUN)   # change this, the host model timestep 
foreach levarr ($CAM_LEVELS_TO_RUN)      # change this, number of levels to run

set EXPNAME={$CASE}_{$iopname}_L{$levarr}_T{$tarray}

#########################################################################
### Set some case specific parameters here
### Here the boundary layer cases use prescribed aerosols while the deep convection
### and mixed phase cases use prognostic aerosols.  This is because the boundary layer
### cases are so short that the aerosols do not have time to spin up.

if ($iopname == 'arm95' ||$iopname == 'arm97' ||$iopname == 'mpace' ||$iopname == 'twp06' ||$iopname == 'sparticus' ||$iopname == 'togaII' ||$iopname == 'gateIII' ||$iopname == 'IOPCASE') then
#  set aero_mode = 'trop_mam3'
  set aero_mode = 'none'
else
  set aero_mode = 'none'
endif

set SCAM_MODS = $WRKDIR/$CASE/mods    && if (! -e  $SCAM_MODS) mkdir -p $SCAM_MODS 
rm -rf $SCAM_MODS/*
/bin/cp -f $USR_SRC/* $SCAM_MODS

set BLDDIR    = $WRKDIR/$CASE/{$CASE}_bld_L${levarr}_${aero_mode}  && if (! -e  $BLDDIR) mkdir -p $BLDDIR
cd $BLDDIR

set IOPDESC = `grep IOP\: $CAM_ROOT/models/atm/cam/bld/namelist_files/use_cases/scam_${iopname}.xml`
 
echo ""
echo "***** $IOPDESC *****"
echo ""

##------------------------------------------------
## Configure for building
##------------------------------------------------
   
#$CAM_ROOT/models/atm/cam/bld/configure -s -chem $aero_mode -nlev $levarr -dyn eul -res 64x128 -nospmd -nosmp -cppdefs -DDISABLE_TIMERS -scam -usr_src $SCAM_MODS -fc $USER_FC $DBUG -ldflags "-llapack -lblas -Mnobounds" #-comp_intf mct -ice none -ocn docn# -cice_nx 1 -cice_ny 1 -microphys mg1.5

##$CAM_ROOT/models/atm/cam/bld/configure -s -chem $aero_mode -nlev $levarr -dyn eul -res 64x128 -nospmd -nosmp -cppdefs -DDISABLE_TIMERS -scam -usr_src $SCAM_MODS -fc $USER_FC $DBUG -ldflags "-llapack -lblas -Mnobounds" # -cice_nx 1 -cice_ny 1 -microphys mg1.5
##$CAM_ROOT/models/atm/cam/bld/configure -s -ccsm_seq -ice none -ocn docn -comp_intf mct -scam -nosmp -nospmd -dyn eul -res 64x128 -phys cam5 -dyn eul -scam

#$CAM_ROOT/models/atm/cam/bld/configure -s -chem $aero_mode -nlev $levarr -dyn eul -res 64x128 -nospmd -nosmp -scam -ocn dom -comp_intf mct -phys cam5 -fc $USER_FC -usr_src $SCAM_MODS

$CAM_ROOT/models/atm/cam/bld/configure -s -chem $aero_mode -nlev $levarr -dyn eul -res 64x128 -nospmd -nosmp -scam -ocn dom -comp_intf mct -phys cam5 -fc $USER_FC 
##--------------------------
## compile
##--------------------------

echo ""
echo " -- Compile"
echo ""
gmake -j >&! MAKE.out || echo "ERROR: Compile failed for' bld_${levarr}_${aero_mode} - exiting run_scam" && exit 1
#gmake -j > MAKE.out || echo "ERROR: Compile failed for' bld_${levarr}_${aero_mode} - exiting run_scam" && exit 1

#--------------------------
## Build the namelist with extra fields needed for scam diagnostics
##--------------------------

cat <<EOF >! tmp_namelistfile
&camexp 
    history_budget       = .false.,
    dtime                = $tarray,
    ndens                = 1,
    fincl1               = 'CAPE','CIN','CLDICEADJ','CLDICELIM','CLDLIQADJ','CLDLIQLIM','CLDVAPADJ','CMFDICE','CMFDLIQ','CMFDQ',
                           'CMFDQR','CMFDT','CMFMCDZM','CONCLD&IC','DCQ','DPDLFT','DQP','DTCOND','DTCORE','EVAPQCM','EVAPQZM','EVAPTCM','EVAPTZM',
                           'EVSNTCM','EVSNTZM','QC','RELHUM','FZSNTCM','FZSNTZM','HKEIHEAT','HPROGCLD','HR',
                           'LPSTEN','MACPDICE','MACPDLIQ','MACPDQ','MACPDT','MELTSDT',
                           'MPDI2P','MPDI2V','MPDI2W','MPDICE','MPDLIQ','MPDQ','MPDT','MPDW2I','MPDW2P','MPDW2V',
                           'PTECLDICE','PTECLDLIQ','PTEQ','PTTEND',
                           'QC','QCSEDTEN','QISEDTEN','QRL','QRS','SHDLFT','TTEND','TTGWORO',
                           'UTEND','UTGWORO','VAT','VTEND','VTGWORO','ZMDICE','ZMDLF','ZMDLIQ','ZMDQ','ZMDT','ZMEIHEAT','ZMFLXPRC','ZMFLXSNW',
                           'ZMICUD','ZMICUU','ZMICVD','ZMICVU','ZMMD','ZMMTT','ZMMTU','ZMMTV','ZMMU','ZMNTPRPD','ZMNTSNPD','ZMUPGD','ZMUPGU',
                           'ZMVPGD','ZMVPGU'
/
&cam_inparm
    iopfile = '/nethome/gchen/SCAM/inputdata/atm/cam/scam/iop/TWP06_4scam.nc',
    ncdata = '/nethome/gchen/SCAM/inputdata/atm/cam/inic/gaus/cami_0000-01-01_64x128_L30_c090102.nc'   
/
&seq_timemgr_inparm
    stop_option          = 'nsteps'
    stop_n               = 1,
/
EOF
#&cam_inparm
#    iopfile = '/nethome/gchen/SCAM/inputdata/scam/iop/TOGAII_4scam.nc'
#    ncdata  = '/nethome/gchen/SCAM/Ocn1Atm10.cam2.9.r.0126-01-01-00000.nc'
#/
#&cam_inparm
#    iopfile = '/nethome/gchen/SCAM/inputdata/scam/iop/TOGAII_4scam.nc'
#    ncdata = '/nethome/gchen/SCAM/inputdata/inic/gaus/cami_0000-01-01_64x128_L30_c090102.nc'   
#/
    #iopfile              = '/glade/scratch/ginochen/SCAM/rce_iop_twp06_mean_ctrl.nc'
### NOT FOUND 'CNVCLD','DQSED','HCME','HEVPA','HFREEZ','HREPART','HSED','PTTEND_RESID','REPARTICE','REPARTLIQ',
### cat <<EOF >! tmp_namelistfile
### &camexp 
###     history_budget       = .true.,
###     dtime                = $tarray,
###     ndens                = 1,
###     fincl1               = 'CLDST','ZMDLF','ZMDT','ZMDQ',
###                          'ICWMR','ICIMR','FREQL','FREQI','LANDFRAC','CDNUMC','FICE','WSUB','CCN3','ICLDIWP',
###                          'CDNUMC', 'AQSNOW',  'WSUB', 'CCN3', 'FREQI', 'FREQL', 'FREQR', 'FREQS', 'CLDLIQ', 'CLDICE',
###                          'FSDS', 'FLDS','AREL','AREI','NSNOW','QSNOW','DSNOW','AWNC','AWNI',
###                          'FLNT','FLNTC','FSNT','FSNTC','FSNS','FSNSC','FLNT','FLNTC','QRS','QRSC','QRL','QRLC',
###                          'LWCF','SWCF', 'NCAI', 'NCAL', 'NIHF','NIDEP','NIIMM','NIMEY', 'ICLDIWP','ICLDTWP', 'CONCLD',
###                          'QCSEVAP', 'QISEVAP', 'QVRES', 'CMELIQ', 'CMEIOUT', 'EVAPPREC', 'EVAPSNOW', 'TAQ',
###                          'ICLMRCU', 'ICIMRCU' ,'ICWMRSH' ,'ICWMRDP', 'ICLMRTOT' , 'ICIMRTOT' , 'SH_CLD' ,  'DP_CLD',
###                          'LIQCLDF','ICECLDF', 'ICWMRST', 'ICIMRST', 'EFFLIQ', 'EFFICE','ADRAIN','ADSNOW'
### /
### EOF
### &cam_inparm
###    scm_iop_srf_prop     = .true.,
### /
### &seq_timemgr_inparm
###    stop_n               = 2160,
###    stop_option          = 'nsteps'
### /

$CAM_ROOT/models/atm/cam/bld/build-namelist -s -runtype startup -infile tmp_namelistfile -use_case scam_${iopname} -csmdata $CSMDATA \
    || echo "build-namelist failed" && exit 1

set RUNDIR    = $WRKDIR/$CASE/$EXPNAME                  && if (! -e  $RUNDIR) mkdir -p $RUNDIR
cd $RUNDIR

 ### RUN

cp -f $BLDDIR/docn.stream.txt $RUNDIR
cp -f $BLDDIR/*_in            $RUNDIR
cp -f $BLDDIR/cam             $RUNDIR

echo ""
echo " -- Running SCAM in $RUNDIR"
echo ""
###./cam >&! scam_output.txt
./cam > scam_output.txt

end           #foreach iopname
end           #foreach tarray
end           #foreach levarr

exit 0
