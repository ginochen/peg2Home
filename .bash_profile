# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
PATH=$HOME/share/autoconf/bin:$PATH
PATH=$PATH:$HOME/bin #:$HOME/bin/mpich-3.1.2/bin
PATH=/nethome/gchen/bin/texlive/2014/bin/i386-linux:$PATH 
PATH=/share/apps/netcdf/4.1.3/intel/13.0.2.146:$PATH
PATH=$PATH:$HOME/shscript/

export PATH

# Paths for different program libraries
LD_LIBRARY_PATH=$NETCDF/lib:$LD_LIBRARY_PATH  

#module purge
#module load lsf
uname -m
#x86_64
cat /etc/issue
#CentOS release 6.5 (Final)
#Kernel \r on an \m
gcc --version

#module unload perl/5.18.1
module unload gcc
#module unload openmpi
#module unload impi
module load ncview
module load intel/13.0.2.146
module load impi/4.1.1.036
#module load openmpi/1.7.5
module load gcc/4.7.3
module load netcdf/4.2.1.1
module load ncl/6.1.2
module list
module load sas
module load R

export NETCDF_LIB=$NETCDF/lib
export NETCDF_INC=$NETCDF/include
