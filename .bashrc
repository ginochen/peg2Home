# .bashrc

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad


case "$0" in
          -sh|sh|*/sh)  modules_shell=sh ;;
       -ksh|ksh|*/ksh)  modules_shell=ksh ;;
       -zsh|zsh|*/zsh)  modules_shell=zsh ;;
    -bash|bash|*/bash)  modules_shell=bash ;;
esac
#module() { eval `/share/apps/modules/Modules/$MODULE_VERSION/bin/modulecmd $modules_shell $*`; }

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
#alias mpif90='mpif90 -I$NETCDF_INC -L$NETCDF_LIB'
#alias autoconf='/nethome/gchen/share/autoconf/bin/autoconf'
#alias autoheader='/nethome/gchen/share/autoconf/bin/autoheader'
#alias autom4te='/nethome/gchen/share/autoconf/bin/autom4te'
alias hhsu='cd hhsu'
alias bhistl='bhist -l'
alias bjobsl='bjobs -l' # CPU, Memories, etc.
alias bpeekf='bpeek -f'
alias htop='/nethome/gchen/share/htop/bin/htop'
alias matlab='/share/opt/MATLAB/R2013a/bin/matlab -nodesktop -nosplash'
alias grep='grep --color=always -n -r'
#alias quick='module load intel;module load netcdf;module load ncview'
alias untar='tar xvf' # add 'z' for gzip file
alias ystone='ssh -Y -l ginochen yellowstone.ucar.edu'
alias cdwork1='cd /bkirtman/gchen'
alias cdccsmdata='cd /projects/rsmas/kirtman/ccsm6.0/01ic/atm.01/daily/E1/'
alias cdcesm='cd /nethome/gchen/CESM/cesm'
alias cdcam='cd /nethome/gchen/CESM/cesm/models/atm/cam/src/physics/cam'
alias cdsam='cd /projects/rsmas/kirtman/gchen/SAM/'
alias cdsamo='cd /projects/rsmas/kirtman/gchen/SAM/OUTPUTS'
alias cdscam='cd /nethome/gchen/SCAM'
alias cdscratch='cd /projects/rsmas/kirtman/gchen/'
alias ls='ls --color=auto -F'
alias view='gnome-open' # opens website in x11
alias gitpush='git push -u origin master'
alias gitcommit='git commit -a'
#alias openpdf='gnome-open'
