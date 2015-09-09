cd ..
ls
cd -
ls
cd ..
ls
cd ..
ls
cd ..
ls
cd ..
ls
cd ..
ls
vim run-scam.csh
ncdump -h cami_0000-01-01_64x128_L30_c090102.nc
ls
/nethome/gchen/SCAM/inputdata/atm/cam/chem/trop_mam/aero
ls /nethome/gchen/SCAM/inputdata/atm/cam/chem/trop_mam/aero
ls /nethome/gchen/SCAM/inputdata/atm/cam/topo/USGS-gtopo30_64x128_c050520.nc
ls /nethome/gchen/SCAM/inputdata/inic/gaus/cami_0000-01-01_64x128_L30_c090102.nc
ls /nethome/gchen/SCAM/inputdata/atm/cam/physprops/water_refindex_rrtmg_c080910.nc
ls -lt /nethome/gchen/SCAM/inputdata/atm/cam/physprops/water_refindex_rrtmg_c080910.nc
ls /nethome/gchen/SCAM/inputdata/atm/cam/chem/trop_mam/aero
ls /nethome/gchen/SCAM/inputdata/atm/cam/ozone
ls /nethome/gchen/SCAM/inputdata/atm/cam/ozone/ozone_1.9x2.5_L26_2000clim_c091112.nc 
ls /nethome/gchen/SCAM/inputdata/atm/cam/physprops/iceoptics_c080917.nc
ls /nethome/gchen/SCAM/inputdata/atm/cam/physprops/F_nwvl200_mu20_lam50_res64_t298_c080428.nc
ls /nethome/gchen/SCAM/inputdata/atm/cam/physprops/mam3_mode1_rrtmg_c110318.nc'
ls /nethome/gchen/SCAM/inputdata/atm/cam/physprops/mam3_mode1_rrtmg_c110318.nc
ls /nethome/gchen/SCAM/inputdata/atm/cam/solar/solar_ave_sc19-sc23.c090810.nc
ls /nethome/gchen/SCAM/inputdata/atm/cam/chem/trop_mozart/ub/clim_p_trop.nc
ls
ls ~/CESM/cesm/models/atm/cam/bld/namelist_files/use_cases/scam_togaII.xml 
vim ~/CESM/cesm/models/atm/cam/bld/namelist_files/use_cases/scam_togaII.xml 
ln -sf ~/CESM/cesm/models/atm/cam/bld/namelist_files/use_cases/scam_togaII.xml
ls
vim scam_togaII.xml 
ls /nethome/gchen/SCAM/inputdata/inic/gaus/cami_0000-01-01_64x128_L30_c090102.nc
vim scam_togaII.xml 
cd inputdata/
ls
cd atm
ls

ls
cd ..
ls
cd ..
sl
ls
mv inic atm/cam/
mv scam atm/cam/
ls atm/cam
ls
cd atm/cam
ls
mkdir sst 
cd sst
rsync -av ginochen@yellowstone.ucar.edu:/glade/p/cesmdata/cseg/inputdata/atm/cam/sst/sst_HadOIBl_bc_64x128_clim_c050526.nc .
cd ..
ls
mkdir ocnfrac
cd ocnfrac
rsync -av ginochen@yellowstone.ucar.edu:/glade/p/cesmdata/cseg/inputdata/atm/cam/ocnfrac/ocnfrac/domain.camocn.64x128_USGS_070807.nc .
rsync -av ginochen@yellowstone.ucar.edu:/glade/p/cesmdata/cseg/inputdata/atm/cam/ocnfrac/domain.camocn.64x128_USGS_070807.nc .
cd ..
ls
cd ..
ls
cd ..
ls
ls inputdata/
mkdir share
ls
cd share/
mkdir domain
cd domain/
cd ..
mv domain/ domains
cd domains/
mkdir domain.clm
cd domain.clm/
rsync -av ginochen@yellowstone.ucar.edu:/glade/p/cesmdata/cseg/inputdata/share/domains/domain.clm/domain.lnd.T42_USGS.111004.nc .
cd ../..
ls
cd ..
ls
cd ..
ls
vim makepath.sh
bash makepath.sh 
ls
cd inputdata
mkdir -p static void _mkdir(const char *dir) {
        char tmp[256];
        char *p = NULL;
        size_t len;
        snprintf(tmp, sizeof(tmp),"%s",dir);
        len = strlen(tmp);
        if(tmp[len - 1] == '/');                 tmp[len - 1] = 0;         for(p = tmp + 1; *p; p++)
                if(*p == '/') {
                        *p = 0;
                        mkdir(tmp, S_IRWXU);
                        *p = '/';
                }
        mkdir(tmp, S_IRWXU);
}ls
ls
mkdir -p lnd/clm2/pftdata/
ls
cd lnd/clm2/pftdata/
rsync -av ginochen@yellowstone.ucar.edu:/glade/p/cesmdata/cseg/inputdata/lnd/clm2/pftdata/pft-physiology.clm40.c130424.nc .
cd ..
ls
cd ..
ls
cd ..
ls
mkdir -p lnd/clm2/snicardata/
cd lnd/
ls
cd clm2
ls
cd snicardata/
ls
ls ../pftdata/
rsync -av ginochen@yellowstone.ucar.edu:/glade/p/cesmdata/cseg/inputdata/lnd/clm2/snicardata/snicar_drdt_bst_fit_60_c070416.nc .
rsync -av ginochen@yellowstone.ucar.edu:/glade/p/cesmdata/cseg/inputdata/lnd/clm2/snicardata/snicar_optics_5bnd_c090915.nc .
cd ..
mkdir surfdata
cd surfdata/
rsync -av ginochen@yellowstone.ucar.edu:/glade/p/cesmdata/cseg/inputdata/lnd/clm2/surfdata/surfdata_64x128_simyr2000_c090928.nc .
cd ..
ls /nethome/gchen/SCAM/inputdata/atm/cam/ocnfrac/domain.camocn.64x128_USGS_070807.nc
ls /nethome/gchen/SCAM/inputdata/atm/cam/sst/sst_HadOIBl_bc_64x128_clim_c050526.nc
cd ..
ls
vim run-scam.csh
./run-scam.csh
exit
ls
cdcam
ls
grep fsns *
vim radsw.F90
grep delp *
cd ..
ls
cd ..
grep delp *
grep pe *
grep dyn_in%pe *
grep 'do not recal' *
grep 'Do not recal' *
grep 'restart run' *
ls /share/opt/intel/composer_xe_2013.2.146/compiler/
ls /nethome/bkirtman/ccsm_inputdata/inputdata/atm/cam/topo/USGS-gtopo30_64x128_c050520.nc
vim ~/.bashr 
vim ~/.bashrc
exit
ls
cd SCAM
ls
cat var_Ocn1Atm10.cam2.9.r.0126-01-01-00000.txt | head -n10
ncdump -h /projects/scratch/cpp/nperlin/CCSM4/archive/Ocn1Atm10/rest/0126-01-01-00000/Ocn1Atm10.cam2.9.r.0126-01-01-00000.nc | head -n1
cp /projects/scratch/cpp/nperlin/CCSM4/archive/Ocn1Atm10/rest/0126-01-01-00000/Ocn1Atm10.cam2.9.r.0126-01-01-00000.nc .
ls
cd SRC
cp sam2camic.ncl cam2camic.ncl
vim cam2camic.ncl 
pwd
vim cam2camic.ncl 
ls
cd SCAM/
ls
vim run-scam.csh
ls scam5_cam_twp06ctrl_1timestep9/
ls scam5_cam_twp06ctrl_1timestep9/scam5_cam_twp06ctrl_1timestep9_twp06_L30_T60/
find docn scam5_cam_twp06ctrl_1timestep9/
find docn scam5_cam_twp06ctrl_1timestep9/ | grep docn
find scam5_cam_twp06ctrl_1timestep9/ | grep docn
find scam5_cam_twp06ctrl_1timestep9/ | grep lnd
vim run-scam.csh
vim run-scam-pegasus2.csh
./run-scam.csh
vim run-scam.csh 
./run-scam.csh
vim -o run-scam.csh run-scam-pegasus2.csh 
./run-scam.csh
vim -o run-scam.csh run-scam-pegasus2.csh 
./run-scam.csh
vim run-scam.csh 
./run-scam.csh
vim run-scam.csh 
./run-scam.csh
vim run-scam.csh 
./run-scam.csh
mkdirp /nethome/gchen/SCAM/inputdata/atm/cam/chem/trop_mozart_aero/oxid
cd /nethome/gchen/SCAM/inputdata/atm/cam/chem/trop_mozart_aero/oxid
ls
rsync -av ginochen@yellowstone.ucar.edu:/glade/p/cesmdata/cseg/inputdata/atm/cam/chem/trop_mozart_aero/oxid/oxid_1.9x2.5_L26_1850-2005_c091123.nc .
rsync -av ginochen@yellowstone.ucar.edu:/glade/p/cesmdata/cseg/inputdata/atm/cam/chem/trop_mozart_aero/oxid/oxid_1.9x2.5_L26_clim_list.c090805.txt .
cd ../../
ls
cd ..
ls
cd ..
mkdirp waccm/phot/
cd waccm/phot/
rsync -av ginochen@yellowstone.ucar.edu:/glade/p/cesmdata/cseg/inputdata/atm/waccm/phot/temp_prs_GT200nm_jpl06_c080930.nc .
ls /nethome/gchen/SCAM/inputdata/atm/cam/physprops/water_refindex_rrtmg_c080910.nc
ls /nethome/gchen/SCAM/inputdata/atm/cam/ozone/ozone_1.9x2.5_L26_2000clim_c091112.nc
ls /nethome/gchen/SCAM/inputdata/atm/cam/physprops/iceoptics_c080917.nc
ls /nethome/gchen/SCAM/inputdata/atm/cam/physprops/F_nwvl200_mu20_lam50_res64_t298_c080428.nc
ls /nethome/gchen/SCAM/inputdata/atm/cam/solar/solar_ave_sc19-sc23.c090810.nc
ls /nethome/gchen/SCAM/inputdata/atm/cam/chem/trop_mozart/ub/clim_p_trop.nc
ls /nethome/gchen/SCAM/inputdata/atm/cam/ocnfrac/domain.camocn.64x128_USGS_070807.nc
ls
cd ~/SCAM
ls
exit
ls /projects/rsmas/parislab/
ls /projects/.scratch/mapes/
ls /nethome/mapes/
ls
cd SCAM
ls
vim run-scam.csh
ls -lt
vim scam5_cam_togaII_1timestep9/scam5_cam_togaII_1timestep9_togaII_L26_T60/scam_output.txt 
cd 
vim scam5_cam_togaII_1timestep9/scam5_cam_togaII_1timestep9_togaII_L26_T60/ocn_in 

cd scam5_cam_togaII_1timestep9/scam5_cam_togaII_1timestep9_togaII_L26_T60
ls
vim atm_in
ls /nethome/gchen/SCAM/inputdata/atm/cam/dst/dst_64x128_c090203.nc
cd ~/SCAM/inputdata/atm/cam/
mkdir dst
cd dst
pwd
rsync -av ginochen@yellowstone.ucar.edu:/glade/p/cesmdata/cseg/inputdata/atm/cam/dst/dst_64x128_c090203.nc .
vim ~/SCAM/scam5_cam_togaII_1timestep9/scam5_cam_togaII_1timestep9_togaII_L26_T60/atm_in
ls /nethome/gchen/SCAM/inputdata/atm/cam/chem/trop_mozart/dvel/depvel_monthly.nc
cd ../chem/trop_mozart/
mkdir dvel
cd dvel
rsync -av ginochen@yellowstone.ucar.edu:/glade/p/cesmdata/cseg/inputdata/atm/cam/chem/trop_mozart/dvel/depvel_monthly.nc .
vim ~/SCAM/scam5_cam_togaII_1timestep9/scam5_cam_togaII_1timestep9_togaII_L26_T60/atm_in
grep .nc ~/SCAM/scam5_cam_togaII_1timestep9/scam5_cam_togaII_1timestep9_togaII_L26_T60/atm_in
ls /nethome/gchen/SCAM/inputdata/atm/cam/topo/USGS-gtopo30_64x128_c050520.nc
ls /nethome/gchen/SCAM/inputdata/atm/cam/chem/trop_mozart/dvel/depvel_monthly.nc
ls /nethome/gchen/SCAM/inputdata/atm/cam/chem/trop_mozart/dvel/regrid_vegetation.nc
rsync -av ginochen@yellowstone.ucar.edu:/glade/p/cesmdata/cseg/inputdata/atm/cam/chem/trop_mozart/dvel/regrid_vegetation .
rsync -av ginochen@yellowstone.ucar.edu:/glade/p/cesmdata/cseg/inputdata/atm/cam/chem/trop_mozart/dvel/regrid_vegetation.nc .
ls
cd ..
mkdir phot
cd phot
rsync -av ginochen@yellowstone.ucar.edu:/glade/p/cesmdata/cseg/inputdata/atm/cam/chem/trop_mozart/phot/exo_coldens.nc .
ls
cd ..
mkdir emis/
cd emis
rsync -av ginochen@yellowstone.ucar.edu:/glade/p/cesmdata/cseg/inputdata/atm/cam/chem/trop_mozart/emis/ar5_mam3_so2_elev_2000_c090726.nc .
cd ..
rm -r emis/
cd ..
ls
mkdir trop_mozart_aero
cd trop_mozart_aero/
mkdir emis
cd emis
rsync -av ginochen@yellowstone.ucar.edu:/glade/p/cesmdata/cseg/inputdata/atm/cam/chem/trop_mozart/emis/ar5_mam3_so2_elev_2000_c090726.nc .
rsync -av ginochen@yellowstone.ucar.edu:/glade/p/cesmdata/cseg/inputdata/atm/cam/chem/trop_mozart_aero/emis/ar5_mam3_so2_elev_2000_c090726.nc .
rsync -av ginochen@yellowstone.ucar.edu:/glade/p/cesmdata/cseg/inputdata/atm/cam/chem/trop_mozart_aero/emis/ar5_mam3_bc_elev_2000_c090726.nc .
rsync -av ginochen@yellowstone.ucar.edu:/glade/p/cesmdata/cseg/inputdata/atm/cam/chem/trop_mozart_aero/emis/ar5_mam3_num_a1_elev_2000_c090726.nc .
rsync -av ginochen@yellowstone.ucar.edu:/glade/p/cesmdata/cseg/inputdata/atm/cam/chem/trop_mozart_aero/emis/ar5_mam3_num_a2_elev_2000_c090726.nc
rsync -av ginochen@yellowstone.ucar.edu:/glade/p/cesmdata/cseg/inputdata/atm/cam/chem/trop_mozart_aero/emis/ar5_mam3_num_a2_elev_2000_c090726.nc .
rsync -av ginochen@yellowstone.ucar.edu:/glade/p/cesmdata/cseg/inputdata/atm/cam/chem/trop_mozart_aero/emis/ar5_mam3_oc_surf_2000_c090726.nc .
rsync -av ginochen@yellowstone.ucar.edu:/glade/p/cesmdata/cseg/inputdata/atm/cam/chem/trop_mozart_aero/emis/ar5_mam3_so4_a1_surf_2000_c090726.nc .

rsync -av ginochen@yellowstone.ucar.edu:/glade/p/cesmdata/cseg/inputdata/atm/cam/chem/trop_mozart_aero/emis/oxid_1.9x2.5_L26_1850-2005_c091123.nc .
vim ~/SCAM/scam5_cam_togaII_1timestep9/scam5_cam_togaII_1timestep9_togaII_L26_T60/atm_in
vim ~/SCAM/scam5_cam_togaII_1timestep9/scam5_cam_togaII_1timestep9_togaII_L26_T60/ocn_in
cd ~/SCAM
ls
./run-scam.csh
exit
exit
ls
cd SCAM
ls
gitcommit
gitpush
exit
ls
cd SCAM
ls
vim scam5_cam_togaII_1timestep9/scam5_cam_togaII_1timestep9_togaII_L26_T60/ice_in
grep .nc scam5_cam_togaII_1timestep9/scam5_cam_togaII_1timestep9_togaII_L26_T60/ice_in
grep .nc scam5_cam_togaII_1timestep9/scam5_cam_togaII_1timestep9_togaII_L26_T60/lnd_in
ls /nethome/gchen/SCAM/inputdata/share/domains/domain.clm/domain.lnd.T42_USGS.111004.nc
ls /nethome/gchen/SCAM/inputdata/lnd/clm2/pftdata/pft-physiology.clm40.c130424.nc
ls /nethome/gchen/SCAM/inputdata/lnd/clm2/snicardata/snicar_drdt_bst_fit_60_c070416.nc
ls /nethome/gchen/SCAM/inputdata/lnd/clm2/snicardata/snicar_optics_5bnd_c090915.nc
ls /nethome/gchen/SCAM/inputdata/lnd/clm2/surfdata/surfdata_64x128_simyr2000_c090928.nc
grep .nc scam5_cam_togaII_1timestep9/scam5_cam_togaII_1timestep9_togaII_L26_T60/ocn_in
ls /nethome/gchen/SCAM/inputdata/atm/cam/sst/sst_HadOIBl_bc_64x128_clim_c050526.nc
ls /nethome/gchen/SCAM/inputdata/atm/cam/ocnfrac/domain.camocn.64x128_USGS_070807.nc
grep .nc scam5_cam_togaII_1timestep9/scam5_cam_togaII_1timestep9_togaII_L26_T60/rof_in
ls
./run-scam.csh
ls
cd scam5_cam_togaII_1timestep9/scam5_cam_togaII_1timestep9_togaII_L26_T60/
./cam
ls
cd -
vim run-scam.csh
./run-scam.csh
cd scam5_cam_togaII_1timestep9/scam5_cam_togaII_1timestep9_togaII_L26_T60/
ls
cd -
cd scam5_cam_togaII_1timestep11/scam5_cam_togaII_1timestep9_togaII_L26_T60/
cd scam5_cam_togaII_1timestep11/scam5_cam_togaII_1timestep11_togaII_L26_T60/
ls
vim atm_in
grep .nc atm_in
vim atm_in
/nethome/gchen/SCAM/inputdata/atm/cam/chem/trop_mam/aero'
ls /nethome/gchen/SCAM/inputdata/atm/cam/chem/trop_mam/aero/mam3_1.9x2.5_L30_2000clim_c130319.nc 
ls /nethome/gchen/SCAM/inputdata/atm/cam/topo/USGS-gtopo30_64x128_c050520.nc
ls /nethome/gchen/SCAM/inputdata/atm/cam/scam/iop/TOGAII_4scam.nc
ls /nethome/gchen/SCAM/inputdata/atm/cam/inic/gaus/cami_0000-01-01_64x128_L30_c090102.nc
vim atm_in
ls /nethome/gchen/SCAM/inputdata/atm/cam/physprops/water_refindex_rrtmg_c080910.nc
vim atm_in
ls /nethome/gchen/SCAM/inputdata/atm/cam/ozone/ozone_1.9x2.5_L26_2000clim_c091112.nc
ls /nethome/gchen/SCAM/inputdata/atm/cam/physprops/iceoptics_c080917.nc
ls /nethome/gchen/SCAM/inputdata/atm/cam/physprops/F_nwvl200_mu20_lam50_res64_t298_c080428.nc
ls /nethome/gchen/SCAM/inputdata/atm/cam/physprops/
ls /nethome/gchen/SCAM/inputdata/atm/cam/solar/solar_ave_sc19-sc23.c090810.nc'
ls /nethome/gchen/SCAM/inputdata/atm/cam/solar/solar_ave_sc19-sc23.c090810.nc
ls /nethome/gchen/SCAM/inputdata/atm/cam/chem/trop_mozart/ub/clim_p_trop.nc
vim drv_in
vim ice_in
ls /nethome/gchen/SCAM/inputdata/atm/cam/ocnfrac/domain.camocn.64x128_USGS_070807.nc
grep .nc ice_in
ls /nethome/gchen/SCAM/inputdata/atm/cam/ocnfrac/domain.camocn.64x128_USGS_070807.nc
ls /nethome/gchen/SCAM/inputdata/atm/cam/sst/sst_HadOIBl_bc_64x128_clim_c050526.nc
grep .nc lnd_in
grep nc rof_in
vim rof_in
vim drv_flds_in 
grep .txt *
grep .tx *
grep txt *
vim atm_in
vim ocn_in
ls
vim ice_in
vim ocn_in
vim lnd_in
vim atm_in
vim drv_flds_in
ls
vim scam_output.txt 
vim ice_in
cat rof_in
ls /projects/rsmas/kirtman/gchen/WRF
ls -lt /projects/rsmas/kirtman/gchen/WRF
ls -lt /projects/rsmas/kirtman/gchen/
cd
ls
ls TEST
pwd
ls
cd ..
ls
ls -lt
cdscam
ls
vim run-scam.csh
./run-scam.csh
ls
cd *12
ls
cd *T60
ls
vim scam_output.txt 
vim docn.stream.txt 
ls -lt
vim atm_in
vim docn_in
vim docn_ocn_in
ls /nethome/gchen/SCAM/inputdata/atm/cam/ocnfrac/domain.camocn.64x128_USGS_070807.nc
vim docn_ocn_in
vim drv_flds_in
vim drv_in
vim ice_in
ls /nethome/gchen/SCAM/inputdata/atm/cam/ocnfrac/domain.camocn.64x128_USGS_070807.nc
vim ice_in
vim lnd_in
vim rof_in
./cam
ls
vim docn.stream.txt 
pwd
cd ~/SCAM
./run-scam.csh
cd /nethome/gchen/SCAM/scam5_cam_togaII_1timestep12/scam5_cam_togaII_1timestep12_togaII_L26_T60
ls
vim atm_in
vim scam_output.txt 
ls
vim docn.stream.txt 
vim ../../var_TOGAII_4scam.txt 
vim ../../run-scam.csh
ls /nethome/gchen/SCAM/inputdata/atm/cam/rad/abs_ems_factors_fastvx.c030508.nc
ls /nethome/gchen/SCAM/inputdata/atm/cam/chem/trop_mozart_aero/aero/aerosoldep_monthly_1849-2006_1.9x2.5_c090803.nc
ls /nethome/gchen/SCAM/inputdata/atm/cam/chem/trop_mozart_aero/aero
ls /nethome/gchen/SCAM/inputdata/atm/cam/physprops/bcphi_camrt_c080918.nc
ls /nethome/gchen/SCAM/inputdata/atm/cam/ocnfrac/domain.camocn.64x128_USGS_070807.nc
ls /nethome/gchen/SCAM/inputdata/share/domains/domain.clm/domain.lnd.T42_USGS.111004.nc
ls /nethome/gchen/SCAM/inputdata/lnd/clm2/surfdata/surfdata_64x128_simyr2000_c090928.nc
ls
pwd
vim atm_in
ls
./cam
ls
cd ..
ls
cd mods
ls
cd ..
ls
cd scam5_cam_togaII_1timestep12_bld_L26_none/
ls
cd mct
ls
vim config.log
vim Makefile.conf
ls  /nethome/gchen/CESM/cesm/models/utils/mct
vim /nethome/gchen/CESM/cesm/models/utils/mct/README 
ls
vim Makefile.conf
ls /share/apps/ncl/6.1.2/include/ncarg
ls /share/apps/ncl/6.1.2/include/ncarg/bin
echo ${LD_LIBRARY}
echo ${LD_LIBRARY_PATH}
ls /share/opt/intel/composer_xe_2013.2.146/compiler/
ls
cd ~/SCAM
ls
vim run-scam.csh
ls /nethome/gchen/SCAM/inputdata/atm/cam/chem/trop_mam/aero/mam3_1.9x2.5_L30_2000clim_c130319.nc
ls /nethome/gchen/SCAM/inputdata/atm/cam/topo/USGS-gtopo30_64x128_c050520.nc
ls /nethome/gchen/SCAM/inputdata/atm/cam/inic/gaus/cami_0000-01-01_64x128_L30_c090102.nc
ls /nethome/gchen/SCAM/inputdata/atm/cam/physprops/water_refindex_rrtmg_c080910.nc
ls /nethome/gchen/SCAM/inputdata/atm/cam/ozone/ozone_1.9x2.5_L26_2000clim_c091112.nc
ls /nethome/gchen/SCAM/inputdata/atm/cam/solar/solar_ave_sc19-sc23.c090810.nc
ls /nethome/gchen/SCAM/inputdata/atm/cam/chem/trop_mozart/ub/clim_p_trop.nc
ls /nethome/gchen/SCAM/inputdata/atm/cam/ocnfrac/domain.camocn.64x128_USGS_070807.nc
ls /nethome/gchen/SCAM/inputdata/atm/cam/sst/sst_HadOIBl_bc_64x128_clim_c050526.nc
ls /nethome/gchen/SCAM/inputdata/atm/cam/sst/sst_HadOIBl_bc_64x128_clim_c050526.nc'
ls /nethome/gchen/SCAM/inputdata/atm/cam/sst/sst_HadOIBl_bc_64x128_clim_c050526.nc
ls /nethome/gchen/SCAM/inputdata/share/domains/domain.clm/domain.lnd.T42_USGS.111004.nc
vim ~/CESM/cesm//models/atm/cam/bld/configure
ls /share/opt/intel/composer_xe_2013.2.146/compiler/
ls /share/opt/intel/composer_xe_2013.2.146/
ls /share/opt/intel/composer_xe_2013.2.146/bin
ls /share/opt/intel/composer_xe_2013.2.146/bin/intel64
ls
ls -lt scam_togaII.xml 
ln -sf /nethome/gchen/CESM/cesm/models/atm/cam/bld/namelist_files/use_cases/scam_twp06.xml 
vim scam_twp06.xml 
vim -o scam_*xml
ls
cd SCAM
ls
echo 1 2 3 4 | xargs -n 2
echo 1 2 3 4 | xargs
echo 1 2 3 4 | xargs -n 1
echo 1 2 3 4 | xargs -0
find . *.txt
find . *.txt -print0
find . -name "*.txt" -print0
find . -name "*.txt" 
find . "*.txt" 
ls
vim run-scam.csh
ls /nethome/gchen/SCAM/inputdata/atm/cam/ocnfrac/domain.camocn.64x128_USGS_070807.nc
ls /nethome/gchen/SCAM/inputdata/atm/cam/sst/sst_HadOIBl_bc_64x128_clim_c050526.nc
ls /nethome/gchen/SCAM/inputdata/share/domains/domain.clm/domain.lnd.T42_USGS.111004.nc
ls /nethome/gchen/SCAM/inputdata/lnd/clm2/pftdata/pft-physiology.clm40.c130424.nc
ls /nethome/gchen/SCAM/inputdata/lnd/clm2/snicardata/snicar_drdt_bst_fit_60_c070416.nc
ls /nethome/gchen/SCAM/inputdata/lnd/clm2/surfdata/surfdata_64x128_simyr2000_c090928.nc
vim run-scam.csh
./run-scam.csh 
vim run-scam.csh
rsync -av ginochen@yellowstone.ucar.edu:/glade/p/cesmdata/cseg/inputdata/atm/cam/ocnfrac/unknown_gridcpl_file .
cd inputdata/atm/cam/ocnfrac
rsync -av ginochen@yellowstone.ucar.edu:/glade/p/cesmdata/cseg/inputdata/atm/cam/ocnfrac/unknown_gridcpl_file .
cd ~/SCAM/
ls
vim run-scam.csh
vim var_TOGAII_4scam.txt 
vim scam_togaII.xml 
vim run-scam-pegasus2.csh 
./run-scam-pegasus2.csh 
ls /nethome/gchen/SCAM/scratch/scam5_cam_arm97_1timestep1/scam5_cam_arm97_1timestep1_arm97_L26_T60
ls /nethome/gchen/SCAM/scratch/scam5_cam_arm97_1timestep1/
ls
vim run-scam-pegasus2.csh 
ls scratch/
ls scratch/scam5_cam_arm97_1timestep1/
ls -lt scratch/scam5_cam_arm97_1timestep1/scam5_cam_arm97_1timestep1_arm97_L26_T60/
ls
vim run-scam-pegasus2.csh 
ls
cd scratch/scam5_cam_arm97_1timestep1/scam5_cam_arm97_1timestep1_arm97_L26_T60/
ls
vim scam_output.txt 
cd ..
ls
cd ..
sl
cd ..
ls
vim run-scam-pegasus2.csh 
./run-scam-pegasus2.csh 
ls
ls -lt
cd scam5_cam_arm97_1timestep1/
ls
cd *T60
ls
vim scam_output.txt 
cd ..
ls
cd ..
ls
vim run-scam-pegasus2.csh 
./run-scam-pegasus2.csh 
ls -lt /nethome/gchen
cd /nethome
ls -lt gchen
ls -lt g*
ls
ls gespi
ls galaxy/
ls gbianchi/
ls gnovelli/
ls gzha
chomd o+rx gchen
chmod o+rx gchen
chmod g+rx gchen
ls ikamenkovich/
cd -
ls
vim  scam5_cam_arm97_1timestep1/
vim scam5_cam_twp06ctrl_1timestep9/ 
vim  scam5_cam_arm97_1timestep1/
vim scam5_cam_twp06ctrl_1timestep9/ 
vim  scam5_cam_arm97_1timestep1/
vim scam5_cam_twp06ctrl_1timestep9/ 
ls /glade/p/cesmdata/cseg/inputdata/atm/cam/ocnfrac/domain.camocn.64x128_USGS_070807.nc
ls inputdata/atm/cam/ocnfrac/domain.camocn.64x128_USGS_070807.nc
vim run-scam.csh
vim scam5_cam_twp06ctrl_1timestep9/ 

vim scam5_cam_arm97_1timestep1/scam5_cam_arm97_1timestep1_arm97_L26_T60/docn.stream.txt 
ls /nethome/gchen/SCAM/inputdata/atm/cam/sst
vim scam5_cam_arm97_1timestep1/scam5_cam_arm97_1timestep1_arm97_L26_T60/docn.stream.txt 
./run-scam-pegasus2.csh 
ls
cd scam5_cam_arm97_1timestep1/
cd *T60
ls
vim docn.stream.txt 
./cam
ls
vim docn_in
vim docn_ocn_in
./cam
ls
vim ice_in
ls /nethome/bkirtman/ccsm_inputdata/inputdata/atm/cam/sst/sst_HadOIBl_bc_64x128_clim_c050526.nc
ls
cd ~/SCAM
ls
cp scam5_cam_arm97_1timestep1/scam5_cam_arm97_1timestep1_arm97_L26_T60/docn.stream.txt scam5_cam_togaII_1timestep11/scam5_cam_togaII_1timestep11_togaII_L26_T60/
cd scam5_cam_togaII_1timestep11/scam5_cam_togaII_1timestep11_togaII_L26_T60/
ls
vim docn.stream.txt 
./cam
ls
vim ocn_in
ls
./cam
ls
vim atm_in
ls /nethome/gchen/SCAM/inputdata/atm/cam/ozone
vim atm_in
ls /nethome/gchen/SCAM/inputdata/atm/cam/physprops/iceoptics_c080917.nc
vim atm_in
ls /nethome/gchen/SCAM/inputdata/atm/cam/chem/trop_mozart/ub/clim_p_trop.nc
ls
cd ~/SCAM
ls
vim run-scam.csh
ls /nethome/gchen/SCAM/inputdata/atm/cam/chem/trop_mozart_aero/aero/aerosoldep_monthly_1849-2006_1.9x2.5_c090803.nc
cd inputdata/atm/cam/chem/trop_mozart_aero/
mkdir aero
cd aero
rsync -av ginochen@yellowstone.ucar.edu:/glade/p/cesmdata/cseg/inputdata/atm/cam/chem/trop_mozart_aero/aero/aerosoldep_monthly_1849-2006_1.9x2.5_c090803.nc .
ls /nethome/gchen/SCAM/inputdata/atm/cam/rad/abs_ems_factors_fastvx.c030508.nc
cd ..
cd rad
mkdir rad
cd rad
rsync -av ginochen@yellowstone.ucar.edu:/glade/p/cesmdata/cseg/inputdata/atm/cam/rad/abs_ems_factors_fastvx.c030508.nc .
ls /nethome/gchen/SCAM/inputdata/atm/cam/topo/USGS-gtopo30_64x128_c050520.nc
ls /nethome/gchen/SCAM/inputdata/atm/cam/chem/trop_mozart_aero/aero/aero_1.9x2.5_L26_2000clim_c091112.nc
cd /nethome/gchen/SCAM/inputdata/atm/cam/chem/trop_mozart_aero/aero/
rsync -av ginochen@yellowstone.ucar.edu:/glade/p/cesmdata/cseg/inputdata/atm/cam/chem/trop_mozart_aero/aero/aero_1.9x2.5_L26_2000clim_c091112.nc .
ls /nethome/gchen/SCAM/inputdata/atm/cam/chem/trop_mozart/ub/clim_p_trop.nc
ls /nethome/gchen/SCAM/inputdata/atm/cam/chem/trop_mozart/ub/docn.stream.txt
ls /nethome/gchen/SCAM/inputdata/atm/cam/sst/sst_HadOIBl_bc_64x128_clim_c050526.nc
ls /nethome/gchen/SCAM/inputdata/share/domains/domain.clm/domain.lnd.T42_USGS.111004.nc
ls /nethome/gchen/SCAM/inputdata/lnd/clm2/pftdata/pft-physiology.clm40.c130424.nc
ls /nethome/gchen/SCAM/inputdata/lnd/clm2/snicardata/snicar_drdt_bst_fit_60_c070416.nc
ls /nethome/gchen/SCAM/inputdata/lnd/clm2/snicardata/snicar_optics_5bnd_c090915.nc
ls /nethome/gchen/SCAM/inputdata/lnd/clm2/surfdata/surfdata_64x128_simyr2000_c090928.nc
ls /nethome/gchen/SCAM/inputdata/atm/cam/ocnfrac/domain.camocn.64x128_USGS_070807.nc
ls /nethome/gchen/SCAM/inputdata/atm/cam/sst/sst_HadOIBl_bc_64x128_clim_c050526.nc
ls /nethome/gchen/SCAM/inputdata/atm/cam/inic/gaus/cami_0000-01-01_64x128_L30_c090102.nc
ls /nethome/gchen/SCAM/inputdata/atm/cam/chem/trop_mozart_aero/aero
ls /nethome/gchen/SCAM/inputdata/atm/cam/chem/trop_mozart_aero/aero/aerosoldep_monthly_1849-2006_1.9x2.5_c090803.nc
cd ~/SCAM/
vim run-scam.csh
vim var_TOGAII_4scam.txt 
vim scam_togaII.xml 
vim run-scam.csh
./run-scam
./run-scam.csh
ls
vim run-scam.csh
cd *12
cd ..
cd *13
ls
cd T60
cd *T60
ls
vim atm_in
ls
vim docn_in
vim ocn_in
vim docn_ocn_in
vim docn.stream.txt 
vim ice_in
vim lnd_in
vim scam_output.txt 
ls /usr/local/library
ls /usr/local/lib
ls /usr/local/include/
cd /usr/local/include/
ls
pwd
ls
vim i.txt
cd 
cd ~/SCAM
ls
vim run-scam.csh
./run-scam.csh
vim run-scam.csh
./run-scam
./run-scam.csh
ls
vim run-scam.csh
./run-scam.csh
ls
vim run-scam.csh
./run-scam.csh
ls
cd *15
ls
cd *T60
ls
vim atm_in
vim ice_in
vim ocn_in
vim lnd_in
vim scam_output.txt 
cd ..
ls
cd ..
ls
vim run-scam.csh
ls
cd inputdata/atm/cam/chem/
rsync -av ginochen@yellowstone.ucar.edu:/glade/p/cesmdata/cseg/inputdata/atm/cam/chem/trop_mam/* trop_mam/
ls
ls trop_mam
ls
ls trop_mam
ls trop_mam/aero
ls
cd ~/SCAM
ls
vim run-scam.csh
ls *15/
ls scam5_cam_togaII_1timestep15/mods/
vim run-scam.csh
./run-scam.csh
vim run-scam.csh
vim README 
vim run-scam.csh
./run-scam.csh
vim run-scam.csh
./run-scam.csh
ls
cdscam
ls
cd *16
ls
cd *T60
ls
vim scam_output.txt 
cdscam
ls
vim run-scam.csh
ls inputdata/atm/cam/ocnfrac/domain.camocn.64x128_USGS_070807.nc
cd -
vim scam_output.txt 
ls
vim atm_in
ls /nethome/gchen/SCAM/inputdata/atm/cam/solar/solar_ave_sc19-sc23.c090810.nc
vim lnd_in
vim rof_in
cd -
ls -l tinputdata/atm/cam/ocnfrac/domain.camocn.64x128_USGS_070807.nc 
ls -lt inputdata/atm/cam/ocnfrac/domain.camocn.64x128_USGS_070807.nc 
chmod u+x inputdata/atm/cam/ocnfrac/domain.camocn.64x128_USGS_070807.nc 
chmod o+x inputdata/atm/cam/ocnfrac/domain.camocn.64x128_USGS_070807.nc 
chmod g+x inputdata/atm/cam/ocnfrac/domain.camocn.64x128_USGS_070807.nc 
ls -lt inputdata/atm/cam/ocnfrac/domain.camocn.64x128_USGS_070807.nc 
ls
./run-scam.csh
cd -
vim scam_output.txt 
vim  /nethome/gchen/SCAM/scam5_cam_twp06_1timestep16/scam5_cam_twp06_1timestep16_twp06_L30_T60/scam_output.txt 
ls
cd -
ls
chmod o+xrw inputdata/atm/cam/ocnfrac/domain.camocn.64x128_USGS_070807.nc 
chmod g+xrw inputdata/atm/cam/ocnfrac/domain.camocn.64x128_USGS_070807.nc 
chmod u+xrw inputdata/atm/cam/ocnfrac/domain.camocn.64x128_USGS_070807.nc 
ls -lt inputdata/atm/cam/ocnfrac/domain.camocn.64x128_USGS_070807.nc 
chmod 777 inputdata/atm/cam/ocnfrac/domain.camocn.64x128_USGS_070807.nc 
ls -lt inputdata/atm/cam/ocnfrac/domain.camocn.64x128_USGS_070807.nc 
cd -
./run-scam.csh
chmod u-xw inputdata/atm/cam/ocnfrac/domain.camocn.64x128_USGS_070807.nc 
chmod o-xw inputdata/atm/cam/ocnfrac/domain.camocn.64x128_USGS_070807.nc 
chmod g-xw inputdata/atm/cam/ocnfrac/domain.camocn.64x128_USGS_070807.nc 
ls -lt inputdata/atm/cam/ocnfrac/domain.camocn.64x128_USGS_070807.nc 
ls
vim run-scam.csh
ln -sf /nethome/gchen/CESM/cesm/models/atm/cam/bld/configure
vim configure 
ls
cdscam
ls
vim configure 
vim README
pwd
vim README
cd SRC
ls
vim sam2camiop.ncl 
vim sam2camic.ncl
vim cam2camic.ncl 
cdwrf
ls
sftp dnolan@visx.ccs.miami.edu
ls
rm Miami_SSH_obs.png 
ls
cd ..
ls
pwd
ls
cd ..
ls
pwd
cd gchen
ls
pwd
ls
cd ..
ls
ls min
ls ccsm4.0/
ls
ls kirtman
ls kirtman/CESM1
ls
ls lsiqueira/
ls
mkdir -p cesm/inputdata
ls
cd cesm/inputdata/
ls
cd ..
ls
cd ..
rm -pr cesm/inputdata/
rm -rp cesm/inputdata/
ls cesm
rm -r cesm
ls
cdscam
ls
vim var_cami_0000-09-01_48x96_L26_c040420.txt 
vim var_cami.txt 
vim var_scami.txt 
ls
vim SRC/sam2camic.ncl
ls
cdcam
ls
grep PT *
grep 'PT' *
grep addfld('PT' *
grep addfld(\'PT\' *
grep 'addfld('PT'' *
grep 'addfld(PT' *
grep 'addfld('PT' *
grep 'addfld('PT *
cd ..
ls
grep 'addfld('PT *
cd ..
ls
grep PT control/cam_restart.F90 
grep PT control
ls
grep 
grep PT *
grep TEOUT *
ls
cdscam
ls
vim run-scam
vim run-scam.csh
cp run-scam.csh run-scam.csh.bak
vim run-scam.csh
ls
rsync -av Ocn1Atm10.cam2.9.r.0126-01-01-00000.nc ginochen@yellowstone.ucar.edu:/glade/scratch/ginochen/SCAM/
ls
vim ~/.git/config
vim ~/.bashrc
git add SRC/
gitcommit
gitpush
sftp ginochen@yellowstone.ucar.edu
ls
sftp ginochen@yellowstone.ucar.edu
ls
rsync -av gchen@pegasus2.ccs.miami.edu:/glade/scratch/ginochen/SCAM/SRC/ SRC
ls SRC
cd SRC
ls
vim README
vim cam2camic.ncl
ls
vim cam2camic.ncl 
vim sam2cami.ncl
vim sam2camic.ncl
vim ../var_cami_0000-01-01_64x128_L30_c090102.txt 
vim sam2camic.ncl
vim ../var_cami_0000-01-01_64x128_L30_c090102.txt 
ls
cd ..
rsync -av cami_0000-01-01_64x128_L30_c090102.nc ginochen@yellowstone.ucar.edu:/glade/scratch/ginochen/SCAM/
ls
ncview cami_0000-01-01_64x128_L30_c090102.nc 
ncview cami_0000-01-01_128x256_L26_c030918.nc 
ncview cami_0000-09-01_48x96_L26_c040420.nc
ls
cd SRC
ls
vim sam2camic.ncl 
ncl sam2camic.ncl 
vim sam2camic.ncl
ncl sam2camic.ncl
vim sam2camic.ncl
vim ../var_cami_0000-01-01_64x128_L30_c090102.txt 
vim sam2camic.ncl
ncl sam2camic.ncl
vim sam2camic.ncl
ncl sam2camic.ncl
vim sam2camic.ncl
ls
cd ..
ls
vim README 
ls
ls lnd
ls inputdata/lnd
ls inputdata/lnd/clm2
ls
cd SRC
ls
vim cam2camic.ncl 
vim -o ../var_cami_0000-01-01_64x128_L30_c090102.txt ../var_Ocn1Atm10.cam2.9.r.0126-01-01-00000.txt 
ls
cdscam
ls
vim-o var_cami_0000-01-01_64x128_L30_c090102.txt var_Ocn1Atm10.cam2.9.r.0126-01-01-00000.txt 
vim -o var_cami_0000-01-01_64x128_L30_c090102.txt var_Ocn1Atm10.cam2.9.r.0126-01-01-00000.txt 
ls -lt var_cami_0000-01-01_64x128_L30_c090102.txt var_Ocn1Atm10.cam2.9.r.0126-01-01-00000.txt 
ls -lt var_cami_0000-01-01_64x128_L30_c090102.txt var_Ocn1Atm10.cam2.9.r.0126-01-01-00000.txt*
ls -lt *
ls *.swp
ls
vim var -A
ls -A
rm .var*.swp
ls
ls -A
rm .var_*
ls
vim -o var_cami_0000-01-01_64x128_L30_c090102.txt var_Ocn1Atm10.cam2.9.r.0126-01-01-00000.txt 
exit
cdscam
ls
vim -o var_cami_0000-01-01_64x128_L30_c090102.txt var_Ocn1Atm10.cam2.9.r.0126-01-01-00000.txt 
ls
cdscam
ls
vim -o var_cami_*2.txt var_Ocn1Atm10.cam2.9.r.0126-01-01-00000.txt 
ls
vim README 
ls
ncdump -h scratch/scam5_cam_togaII_1timestep14_togaII_L30_T60/camrun.cam.r.1992-12-18-64800.nc 
vim run-scam.csh 
vim ~/.bashrc
source ~/.bashrc
vim .git/config
ls
cdscam
ls
cdcam
grep tcwat *
cdscam
ncview cami_0000-01-01_64x128_L30_c090102.nc 
cdcam
grep qpert *
ncview cami_0000-01-01_64x128_L30_c090102.nc 
cdscam
ncview cami_0000-01-01_64x128_L30_c090102.nc 
ls
ls -lt | head -n10
vim README 
ls
cd scratch/
ls
scp -r ginochen@yellowstone.ucar.edu:/glade/scratch/ginochen/SCAM/scam5_cam_togaII_1timestep14/scam5_cam_togaII_1timestep14_togaII_L30_T60 .
ls
cd scam5_cam_togaII_1timestep14_togaII_L30_T60/
vim README
ls
pwd
cd ..
ls
cd ..
ls
vim SRC/camCompare.ncl
vim SRC/cam2camic.ncl 
vim -o SRC/cam2camic.ncl SRC/findIOPpoint.ncl
ncl SRC/findIOPpoint.ncl 
vim SRC/findIOPpoint.ncl 
ncl SRC/findIOPpoint.ncl 
vim SRC/findIOPpoint.ncl 
ncl SRC/findIOPpoint.ncl 
vim SRC/findIOPpoint.ncl 
ncl SRC/findIOPpoint.ncl 
vim SRC/findIOPpoint.ncl 
ncl SRC/findIOPpoint.ncl 
vim SRC/findIOPpoint.ncl 
ncl SRC/findIOPpoint.ncl 
vim SRC/findIOPpoint.ncl 
ncl SRC/findIOPpoint.ncl 
vim SRC/findIOPpoint.ncl 
