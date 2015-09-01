vim SRC/com3D2nc.f
make
vim SRC/com3D2nc.f
make
vim SRC/com3D2nc.f
make
ls
cdsam
ls
cd *M2005
ls
cd OUT_3D
ls
ls *com3D
./com3D2nc ARM0003_1536x1536x110_80m_80m_80m_1s_LES_512_0000043200.com3D
cdsam
ls
cd *M2005
ls
cd OUT_3D
ls
ls *nc
rm *82800.nc
ls *com3D
./com3D2nc *82800.com3D
ls *com3D
rm *82800.com3D
./com3D2nc *82800.com3D
rm *82800.nc
./com3D_sep2one ARM0003_1536x1536x110_80m_80m_80m_1s_LES_512_0000082800.com3D
ls
ls *com3D
ls -l *com3D
ls -l *nc
ncview *43200.nc
cd ../OUT_2D
ls
cd ../
cd UTIL
ls
vim SRC
vim SRC/com3D2nc
vim SRC/com3D2nc.f
ls
vim Makefile 
make
pwd
ls
cd SRC
ls
vim com3D2nc.f
cd ..
rm com3D2nc_bigdata
ls
rm com3D2nc_bigdata.f 
cd SRC
ls
vim com3D2nc.f
cd ..
ls
cd ..
pwd
ls
cp UTIL ../UTIL_gino
mkdir ../UTIL_gino
cp UTIL/* ../UTIL_gino/
cp -r UTIL/* ../UTIL_gino/
cd ../UTIL_gino/
ls
cd -
ls
cd OUT_3D
ls -lt com*
rm com*
ln -sf ../../UTIL_gino/com3D2nc
ln -sf ../../UTIL_gino/com3D_sep2one 
sam
cd *SAM1MOM
ls
cd SRC
cd ..
cd UTIL
ls
vim SRC/2Dcom_sep2one.f 
make 
pwd
sam
cd SAM*M2005
cd UTIL
ls
make
cd -
cd ..
cd *SAM1MOM
vim UTIL/SRC/2Dcom_sep2one.f 
sam
cd *M2005
cd UTIL
vim SRC/2Dcom_sep2one.f 
make
vim SRC/2Dcom_sep2one.f 
make
vim SRC/2Dcom_sep2one.f 
make
vim SRC/2Dcom_sep2one.f 
make
vim SRC/2Dcom_sep2one.f 
make
vim SRC/2Dcom_sep2one.f 
make
vim SRC/2Dcom_sep2one.f 
make
vim SRC/2Dcom_sep2one.f 
make
vim SRC/2Dcom_sep2one.f 
vim ../domain.f90 
vim SRC/2Dcom_sep2one.f 
make
vim SRC/2Dcom_sep2one.f 
make
vim SRC/2Dcom_sep2one.f 
make
vim SRC/2Dcom_sep2one.f 
make
vim SRC/2Dcom_sep2one.f 
make
vim SRC/2Dcom_sep2one.f 
make
vim SRC/2Dcom_sep2one.f 
make
vim SRC/2Dcom_sep2one.f 
make
vim SRC/2Dcom_sep2one.f 
vim SRC/com3D_sep2one.f 
make
vim SRC/com3D_sep2one.f 
vim SRC/com3D2nc.f
ls
make
vim SRC/com3D2nc.f
make
vim SRC/com3D2nc.f
make
vim SRC/com3D2nc.f
make
vim SRC/com3D2nc.f
make
vim SRC/com3D2nc.f
maek
make
vim SRC/com3D2nc.f
make
vim SRC/com3D2nc.f
make
vim SRC/com3D2nc.f
make
vim SRC/com3D2nc.f
make
vim SRC/com3D2nc.f
vim Makefile 
vim ../UTIL/Makefile 

vim ../UTIL/Makefile 
ls
cd
ls
ls downloads/
ls
cd downloads/
ls
wget ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-4.3.3.1.tar.gz
ls
untar netcdf-4.3.3.1.tar.gz 
ls
cd netcdf-4.3.3.1
ls
vim README.md 
vim INSTALL
make check
vim INSTALL
 ./configure --prefix=~/share/netcdf_4.3.3.1
 ./configure --prefix=/nethome/gchen/share/netcdf_4.3.3.1
vim INSTALL
which hdf
vim INSTALL
echo $HDF
echo $HDF5
which intel
module list
module load hdf5/1.8.10p1/impi 
module load hdf5/1.8.11/impi 
 ./configure --prefix=/nethome/gchen/share/netcdf_4.3.3.1
module list
vim INSTALL
module help
module display hdf
ls /share/apps/hdf/4.2.9/intel/13.0.2.146/
vim INSTALL
echo $CPPFLAGS
echo $CPPFLAG
CPPFLAGS=-I/share/apps/hdf/4.2.9/intel/13.0.2.146/include LDFLAGS=-L/share/apps/hdf/4.2.9/intel/13.0.2.146/lib  ./configure --prefix=/nethome/gchen/share/netcdf_4.3.3.1
module list
module info hdf5/1.8.11/impi
module list hdf5/1.8.11/impi
module help
module display hdf5/1.8.11/impi
CPPFLAGS=-I/share/apps/hdf5/1.8.11/intel/13.0.2.146/impi/include LDFLAGS=-L/share/apps/hdf5/1.8.11/intel/13.0.2.146/impi/lib  ./configure --prefix=/nethome/gchen/share/netcdf_4.3.3.1
vim INSTALL
ls
ls /share/apps/hdf5/1.8.11/intel/13.0.2.146/impi/
ls /share/apps/hdf5/1.8.11/intel/13.0.2.146/impi/include
ls /share/apps/hdf5/1.8.11/intel/13.0.2.146/impi/include | grep hdf5.h
CPPFLAGS=-I/share/apps/hdf5/1.8.11/intel/13.0.2.146/impi/include LDFLAGS=-L/share/apps/hdf5/1.8.11/intel/13.0.2.146/impi/lib  ./configure --prefix=/nethome/gchen/share/netcdf_4.3.3.1
ls/share/apps/hdf5/1.8.11/intel/13.0.2.146/impi/
ls /share/apps/hdf5/1.8.11/intel/13.0.2.146/impi/
vim ~/.bashrc
source ~/.bashrc
vim INSTALL
make check
vim Makefile.am
ls
mkdir /nethome/gchen/share/netcdf_4.3.3.1
cd /nethome/gchen/share/netcdf_4.3.3.1
ls
cd -
CPPFLAGS=-I/share/apps/hdf5/1.8.11/intel/13.0.2.146/impi/include LDFLAGS=-L/share/apps/hdf5/1.8.11/intel/13.0.2.146/impi/lib  ./configure --prefix=/nethome/gchen/share/netcdf_4.3.3.1
vim config.log 
cdsam
ls
cd UTIL_gino/
vim SRC/2Dcom_sep2one.f 
vim ../SAM_LES_80mx80mx80mx1s_M2005/SRC/write_fields2D.f90 
vim ../SAM_LES_80mx80mx80mx1s_M2005/SRC/write_fields2D.f90
cd ../S*M2005/SRC/
vim compress3D.f90 
cd ..
ls
vim Makefile 
vim gobsub.job 
vim OUT_3D/sub.sh
cd ..
ls
pwd
git init SAM_LES_80mx80mx80mx1s_M2005
cd *M2005
vim .git/config 
vim .git/info
cd .git/
git config user.name gchen
git config --global user.email gchen@rsmas.miami.edu
git config --global user.name gchen
pwd
ls
vim description 
vim config 
vim HEAD
cd ..
ls
~/.gitconfig
cd .git
ls
vim config 
pwd
ls
cd ..
ls
git add ARM0003/prm
git add SRC/domain.f90
git add Build
git add gobsub.job
git add README
git add Makefile 
git commit
git commit -a
git status
git log
git remote
git remote -v
exit
ls
cdsam
ls
cd *M2005
ls
vim .git/config 
cd .git/
cd ..
ls
cd *M2005
git push https://github.com/ginochen/gino.git
git status

git push origin master
git init
git branch
git status
git add .
ls
git status
ls
git push -u origin master
git branch
git 
git push origin master
git push -u origin master
git push origin master
git remote add origin https://github.com/ginochen/SAM.git
vim .git/config 
git push -u origin master
git push
vim .git/config 
git push
vim .git/config 
git push
vim .git/config
git push
vim .git/config
git push
vim .git/config
git push
git remote add origin git@github.com:ginochen/SAM.git
git push origin master
vim .git/config
git push origin master
vim .git/config
echo "# SAM" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin git@github.com:ginochen/SAM.git
git push -u origin master
vim .git/config
git remote set-url origin https://github.com/ginochen/SAM.git
git push
git push -u origin master
git remote set-url origin http://github.com/ginochen/SAM.git
git push -u origin master
git remote set-url origin https://github.com/ginochen/SAM.git
git push -u origin master
git remote set-url origin ssh://git@github.com/ginochen/SAM.git
git push -u origin master
sudo git push -u origin master
exit
cdsam
cd *M20205
*M2005
cd *M2005
sudo vim .git/config
exit
ls
cdsam
ls
cd *M2005
ls
cd ..
ls
rm -fr UTIL
ls
cd UTIL_gino/
ls
d ..
ls
cd SRC
ls
cd ..
ls
git add SRC
git add Makefile 
cd ..
ls
gitcommit 
gitpush
ls
cd UTIL_gino
sl
ls
vim SRC/2Dcom_sep2one.f 
make
vim Makefile 
make
vim SRC/2Dcom_sep2one.f 
make 2Dcom_sep2one 
vim SRC/2Dcom_sep2one.f 
cd
cd SAM6.10.8.2
ls
cd SAM6.10.8/
ls
cd UTIL
sl
ls
vim SRC/2Dcom_sep2one.f 
make
vim SRC/2Dcom_sep2one.f 
cdsam
ls
cd UTIL_gino/
vim SRC/2Dcom_sep2one.f 
make
vim SRC/2Dcom_sep2one.f 
make
vim SRC/2Dcom_sep2one.f 
make
vim SRC/2Dcom_sep2one.f 
make
vim SRC/2Dcom_sep2one.f 
make
vim SRC/2Dcom_sep2one.f 
make
vim SRC/2Dcom_sep2one.f 
make
vim SRC/2Dcom_sep2one.f 
make
vim SRC/2Dcom_sep2one.f 
make
vim SRC/2Dcom_sep2one.f 
make
vim SRC/2Dcom_sep2one.f 
make
vim SRC/2Dcom_sep2one.f 
make
vim SRC/2Dcom_sep2one.f 
make
vim SRC/2Dcom_sep2one.f 
make
vim SRC/2Dcom_sep2one.f 
gitcommit
gitpush
ls
cd ..
gitpush
ls
cd *M2005
ls
cd OUT_2D/tmp/tmp
ls *nc
ncdump -h ARM0003_0000072000.2Dcom_1.nc 
ncdump -v PREC ARM0003_0000072000.2Dcom_1.nc 
ncdump -v TB ARM0003_0000072000.2Dcom_1.nc 
cd ..
ls
cd ..
ls
cd ..
pwd
ls
ls
sudo
sudo vim
eval "$(ssh-agent -s)"
ssh-add -l
ssh -T git@github.com
ls -al ~/.ssh
ssh-keygen -t rsa -b 4096 -C "gchen@rsmas.miami.edu"
ssh-add -l
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
pbcopy < ~/.ssh/id_rsa.pub
ssh -T git@github.com
vim ~/.ssh/id_rsa.pub
cd -
cdsam
ls
cd *M2005
ls
git push
git push origin master
ls
cd ..
ls
cd *SAM1MOM
git init
rm .git/
rm -r .git/
git status
cd ..
ls
git init
cd *M2005
ls
mv .git ../
mv -f .git ../
mv -rf .git ../
mv -r .git ../
mv -r .git ../git
mv -r .git ../.git
mv -fr .git ../.git
cp -fr .git ../.git
cd ..
vim .git/config 
rm .git/.git
rm -r .git/.git
rm -fr .git/.git
cp -fr SAM_LES_80mx80mx80mx1s_M2005/.git .
cd .git
vim config 
cd ..
rm .git
rm -r .git
rm -fr .git
git init
vim .git/config 
cd *M2005
rm -fr .git/
cd ..
cd -
git add ARM0005/
git add ARM0003/
git add SRC
git add Makefile 
git add Build 
git commit -m "first commit"
cd ..
ls
git push origin master
cd *SAM1MOM
ls
git add Build 
git add Makefile
git add CaseName 
git add SRC
git add ARM0003
git add README
cd ..
ls
cd *M2005
git add README
vim README.md
rm README.md
cd ..
git commit -a
vim ~/.bashrc
source ~/.bashrc
gitpush
cd *M2005
git add CaseName 
gitpush
gitcommit
gitpush
ls
git add gobsub.job 
cd ../*SAM1MOM
git add gobsub.job 
git commmit
gitcimmit
gitcommit
gitpush
bjobs
ls
cd ..
ls
cd *M2005
ls
cd OUT_2D
ls
cd tmp
ls
cd tmp
ls
ls -lt 2D
ls -lt 2D*
ln -sf ../../../../UTIL_gino/2Dcom_sep2one 
ls 2D*
./2Dcom_sep2one *
./2Dcom_sep2one ARM0003_0000072000.2Dcom
rm ARM0003_0000072000.2Dcom
./2Dcom_sep2one ARM0003_0000072000.2Dcom

vim ARM0003_0000072000.2Dcom_1
./2Dcom_sep2one ARM0003_0000072000.2Dcom
rm ARM0003_0000072000.2Dcom
./2Dcom_sep2one ARM0003_0000072000.2Dcom
rm ARM0003_0000072000.2Dcom
./2Dcom_sep2one ARM0003_0000072000.2Dcom
rm ARM0003_0000072000.2Dcom
./2Dcom_sep2one ARM0003_0000072000.2Dcom
rm ARM0003_0000072000.2Dcom
./2Dcom_sep2one ARM0003_0000072000.2Dcom
rm ARM0003_0000072000.2Dcom
./2Dcom_sep2one ARM0003_0000072000.2Dcom
rm ARM0003_0000072000.2Dcom
./2Dcom_sep2one ARM0003_0000072000.2Dcom
rm ARM0003_0000072000.2Dcom
./2Dcom_sep2one ARM0003_0000072000.2Dcom
rm ARM0003_0000072000.2Dcom
./2Dcom_sep2one ARM0003_0000072000.2Dcom
rm ARM0003_0000072000.2Dcom
./2Dcom_sep2one ARM0003_0000072000.2Dcom
rm ARM0003_0000072000.2Dcom
./2Dcom_sep2one ARM0003_0000072000.2Dcom
rm ARM0003_0000072000.2Dcom
./2Dcom_sep2one ARM0003_0000072000.2Dcom
rm ARM0003_0000072000.2Dcom
./2Dcom_sep2one ARM0003_0000072000.2Dcom
rm ARM0003_0000072000.2Dcom
./2Dcom_sep2one ARM0003_0000072000.2Dcom
rm ARM0003_0000072000.2Dcom
./2Dcom_sep2one ARM0003_0000072000.2Dcom
rm ARM0003_0000072000.2Dcom
./2Dcom_sep2one ARM0003_0000072000.2Dcom
rm ARM0003_0000072000.2Dcom
./2Dcom_sep2one ARM0003_0000072000.2Dcom
ls -lt ARM0003_0000072000.2Dcom
ln -sf ../../../../UTIL_gino/2Dcom2nc
./2Dcom2nc ARM0003_0000072000.2Dcom
ls
ls *nc
ncview ARM0003_0000072000.2Dcom_1.nc 
rm ARM0003_0000072000.2Dcom
./2Dcom2nc ARM0003_0000072000.2Dcom
./2Dcom_sep2one ARM0003_0000072000.2Dcom
./2Dcom2nc ARM0003_0000072000.2Dcom
ncview ARM0003_0000072000.2Dcom_1.nc 
rm ARM0003_0000072000.2Dcom
./2Dcom_sep2one ARM0003_0000072000.2Dcom
./2Dcom2nc ARM0003_0000072000.2Dcom
ncview ARM0003_0000072000.2Dcom_1.nc 
ls
cd ..
ls
pwd
rm -fr tmp/
cd ..
rm -fr tmp
ls
ls -lt ./2Dcom_sep2one 
rm 2Dcom_sep2one
ln -sf ../../UTIL_gino/2Dcom_sep2one 
./2Dcom_sep2one ARM0003_1536x1536x110_80m_80m_80m_1s_LES_512_0000086400.2Dcom
ln -sf ../../UTIL_gino/2Dcom2nc
./2Dcom2nc *2Dcom
./2Dcom2nc ARM0003_1536x1536x110_80m_80m_80m_1s_LES_512_0000086400.2Dcom
ls *2Dcom
rm *72000.2Dcom
ncview *nc
ncview ARM0003_1536x1536x110_80m_80m_80m_1s_LES_512_0000086400.2Dcom_1.nc 
cd ..
ls
vim prm
cd OUT_2D/
ncview ARM0003_1536x1536x110_80m_80m_80m_1s_LES_512_0000086400.2Dcom_1.nc 
ls
cd ..
ls
vim prm
cd OUT_2D/
ls *.nc
ncdump -h ARM0003_1536x1536x110_80m_80m_80m_1s_LES_512_0000086400.2Dcom_1.nc
cd ../OUT_STAT/
ls
ls -lt
du -sh
ln -sf ../../UTIL_gino/stat2nc
./stat2nc ARM0003_1536x1536x110_80m_80m_80m_1s_LES.stat 
ncdump -h *nc
ls
ncdump -h ARM0003_1536x1536x110_80m_80m_80m_1s_LES.nc
ncdump -h ARM0003_1536x1536x110_80m_80m_80m_1s_LES.nc | grep Tendency
grep TTEND ../SRC/
grep TTEND ../SRC/*
grep ttend ../SRC/
gitcommit
gitpush
gitcommit -a
gitpush
vim ~/.bashrc 
source ~/.bashrc
ls
cdsam
ls
cd *M2005
ls
cd OUT_STAT
ls
ncview ARM0003_1536x1536x110_80m_80m_80m_1s_LES.nc
ls
exit
ls
cdsam
ls
cd *M2205
cd *M2005
ls
grep SSTOBS SRC/
grep SSTOBS SRC/*
grep sstobs SRC/
vim SRC/vars.f90 
vim SRC/write_fields2D.f90 
vim SRC/hbuf
vim SRC/hbuffer.f90 
vim SST ARM0003/
grep SST ARM0003/
grep sst ARM0003/
vim ARM0003/sfc 
vim ARM0003/snd
vim ARM0003/sfc 
grep sst SRC/
grep sstxy SRC/
vim SRC/
vim ARM0003/sfc 
vim SRC/setdata.f90 
grep t00 SRC/
vim SRC/vars.f90 
grep tabs_s SRC/
vim SRC/params.f90 
vim /projects/rsmas/kirtman/gchen/SAM/SAM_LES_80mx80mx80mx1s_M2005/ARM0003.5262869.err
vim SRC/params.f90 
grep ocean_type SRC/*
vim SRC/simple_ocean.f90 
vim SRC/params.f90 
vim SRC/forcing.f90 
grep sstsfc SRC/
vim SRC/readiopdata.f90 
grep Tg_in SRC/
vim SRC/readiopdata.f90 
ls
vim OUT_STAT/var.txt 
vim prm
gitcommit
exit
cdsam
vim .git/config 
pegasus2
sshpeg2
cd *M2005
ls
cd OUT_STAT
ls
ncdump -h ARM0003_1536x1536x110_80m_80m_80m_1s_LES.nc > var.txt
vim var.txt 
ncdump -v SST ARM0003_1536x1536x110_80m_80m_80m_1s_LES.nc
cd ..
ls
vim prm
grep SST SRC/
vim SRC/write_fields2D.f90 
vim prm
vim SRC/write_fields2D.f90 
vim OUT_STAT/var.txt 
cd OUT_STAT/
ncdump -v SSTOBS ARM0003_1536x1536x110_80m_80m_80m_1s_LES.nc
ncdump -v SST SSTOBS ARM0003_1536x1536x110_80m_80m_80m_1s_LES.nc
ncdump -v SST -v SSTOBS ARM0003_1536x1536x110_80m_80m_80m_1s_LES.nc
ncdump -v SST ARM0003_1536x1536x110_80m_80m_80m_1s_LES.nc | grep -n30
ncdump -v SST ARM0003_1536x1536x110_80m_80m_80m_1s_LES.nc | grep tail -n30
ncdump -v SST ARM0003_1536x1536x110_80m_80m_80m_1s_LES.nc | tail -n30

ncdump -v SST ARM0003_1536x1536x110_80m_80m_80m_1s_LES.nc | tail -n30 | grep 282.889
ncdump -v SST ARM0003_1536x1536x110_80m_80m_80m_1s_LES.nc | tail -n30 | grep 282.849
ncdump -v SST ARM0003_1536x1536x110_80m_80m_80m_1s_LES.nc | tail -n30 
cd ..
ls
cd OUT_2D
ls *nc
ncdump -h ARM0003_1536x1536x110_80m_80m_80m_1s_LES_512_0000086400.2Dcom_1.nc > var_2D.txt
vim var_2D.txt 
cd ../OUT_3D
ls *nc
ncdump -h ARM0003_1536x1536x110_80m_80m_80m_1s_LES_512_0000072000.nc > var_3D.txt
vim var_3D.txt 
ncdump -h ARM0003_1536x1536x110_80m_80m_80m_1s_LES_512_0000043200.nc > var_3D.txt
vim var_3D.txt 
cd ..
ln -sf OUT_3D/var_3D.txt 
ln -sf OUT_2D/var_2D.txt 
cd OUT_STAT
mv var.txt var_STAT.txt
cd ..
ln -sf OUT_STAT/var_STAT.txt 
ls -lt var*
ls
git add var_*
gitcommit
vim ../.git/config
gitcommit
ls
vim prm
vim ../.git/config 
cd ..
git config core.editor 'vim'
vim .git/config 
git config core.editor 'vim'
vim .git/config 
gitpush
ls
cd -
ls
vim prm
bsub < gobsub.job 
bjobs
bhist -a -l -n 1
bhist -a -l -n 2
bjobs
cd ..
ls
mkdir SAM_LES_80mx80mx80mx1s_M2005_
cd
ls
cd SAM6.10.8.2
ls
cd SAM6.10.8/
ls
cd ..
ls
pwd
cdsam
ls
ln -sf /nethome/gchen/SAM6.10.8.2
ls
cp SAM6.10.8.2/SAM6.10.8/* SAM_LES_80mx80mx80mx1s_M2005_/
cp -r SAM6.10.8.2/SAM6.10.8/* SAM_LES_80mx80mx80mx1s_M2005_/
cd *M2005_
ls
cd ..
ls
cd -
cp ../SAM_LES_80mx80mx80mx1s_M2005/Build .
cp ../SAM_LES_80mx80mx80mx1s_M2005/Makefile .
vim Build 
vim Makefile 
ls
cd ..
ls
mv *M2005_ SAM_LES_80mx80mx80mx1s_M2005_KWAJEX
ls
bjobs
bpeekf 5273896
exit
bjobs
bpeekf 5273896
exit
cdsam
ls
cd *M2005
ls
vim gobsub.job 
ls
cdsam
ls
cd *M20205
cd *M2005
ls
vim GATE/prm
vim GATE/grd
vim ARM0003/grd
ls
cd ..
ls
cd *KWAJEX
ls
cd KWAJEX
ls
cat *
ls
vim prm
vim snd
cd ..
ls
cd -
cd ..
ls
cd ..
ls
exit
ls
cdsam
ls
bjobs
bpeek -f 5273896
bpeek -f 5273896 | grep NSTEP
cdsam
ls
cd KWAJEX
cd *KWAJEX
ls
cd KWAJEX/
ls
vim snd
vim prm
ls
cd ..
ln -sf KWAJEX/prm 
vim prm
vim ../SAM6.10.8.2/SAM6.10.8/ARM0003/prm
bjobs
bpeekf 5273896 | grep NSTEP
cd ../SAM6.10.8.2/SAM6.10.8/
ls
vim GATE/prm
ls GATE
vim GATE/READ.ME 
ls TOGA
vim TOGA/READ.ME 
vim TOGA/prm
vim Changes_log/README.UUmods 
bjobs
bpeekf 5273896 | grep NSTEP
bjobs
bpeekf 5273896 | grep NSTEP
ls
pwd
cd ..
ls
cd ..
ls
cd *KWAJEX
vim prm
vim KWAJEX
ls
vim Makefile 
vim Build 
vim CaseName 
cd ..
ls
mkdir SAM_LES_80mx80mx80mx1s_M2005_TOGA_COARE
cp SAM_LES_80mx80mx80mx1s_M2005_KWAJEX/* SAM_LES_80mx80mx80mx1s_M2005_TOGA_COARE/
cp -r SAM_LES_80mx80mx80mx1s_M2005_KWAJEX/* SAM_LES_80mx80mx80mx1s_M2005_TOGA_COARE/
cd *COARE
ls
ls -lt
rm prm
vim TOGA_LONG/prm
vim TOGA_LONG/README 
vim TOGA_LONG/prm
vim TOGA/prm
ncdump -h TOGA/toga_coare.nc 
ncdump -v lat TOGA/toga_coare.nc | tail -n10
ncdump -v lon TOGA/toga_coare.nc | tail -n2
ncdump -v lev TOGA/toga_coare.nc | tail -n2
ncdump -v tsec TOGA/toga_coare.nc | tail -n2
ncdump -v tsec TOGA_LONG/toga_coare_long.nc | tail -n2
ncdump -v lat TOGA_LONG/toga_coare_long.nc | tail -n2
ncdump -v lat TOGA_LONG/toga_coare_long.nc | tail -n5
ncdump -v leve TOGA_LONG/toga_coare_long.nc | tail -n5
ncdump -v lev TOGA_LONG/toga_coare_long.nc | tail -n5
ncdump -v lon TOGA_LONG/toga_coare_long.nc | tail -n5
ncdump -h  TOGA_LONG/toga_coare_long.nc 
ls
cd TOGA_LONG
ls
vim prm
grep domain *
grep DOM *
grep dom *
vim grd
vim grd_sp
vim sfc
vim sfc_MJO 
vim README
vim prm
cd ..
ls
vim TOGA_LONG/snd
vim TOGA_LONG/snd_11-13 
vim TOGA_LONG/prm
cd TOGA_LONG
ls
vim README 
vim snd
vim lsf3D
vim out
vim ../LBA/READ.ME 
vim ../*/READ.ME
vim -o ../*/READ.ME
vim prm
vim ../ARM0003/prm
vim prm
vim grd
vim prm
cd ..
ls
cd ..
s
cd -
pwd
ls
ln -sf TOGA_LONG/prm 
ls
ln -sf SRC/domain.f90 
vim domain.f90 
vim prm
vim domain.f90 
vim prm
bjobs
ls
bpeekf 5273896
bpeekf 5273896 | grep NSTEP
ls
cdsam
cd *COARE
ls
ls -l
vim prm
ls
vim ~/.git/config
gitpush
vim ~/.git/config
gitpush
git remote set-url origin https://github.com/ginochen/pegHome.git
gitpush
