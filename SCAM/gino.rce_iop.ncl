;IOP Settings
;Use 3D forcing - if vertical advection terms are available in the selected IOP dataset, this option causes the model to be forced with combined vertical and horizontal advection terms, as opposed to horizontal advection terms and omega. The controlling logical variable in the model code is "use_3dfrc", declared in "comiop.h"; the relevant code is located in stepon.F. (This option is not enabled if the required fields are missing from IOP dataset.)

;Use specified surface properties - if surface fields are available in the selected IOP dataset, this option causes the model to be constrained to using the prescribed surface properties (i.e., latent and sensible heat fluxes, and ground temperature). The controlling logical variable in the model code is "use_srfprop", declared in "comiop.h"; the relevant code is located in stepon.F.(This option is not enabled if the required fields are missing from IOP dataset.)

;Use relaxation - this option enables relaxation of predicted T and Q fields to observed values. on enables relaxation of predicted T and Q fields to observed values. The controll
ing logical variable in the model code is "use_relax", declared in "comiop.h." The relevant code is located in stepon.F; it may require modification depending on the particulars o
f the run.

;===========================================================================
;===========================================================================
; This script creates a custom IOP file for use in the NCAR SCAM
; The essential variables are:
;   bdate     Base date
;;   time      Time after 0Z on base date
;;   lev       pressure levels
;;   lat       Latitude
;;   lon       Longitude
;;   phis      Surface geopotential
;;   t         Temperature
;;   divT      Horizontal T advective tendency
;;   q         Specific humidity
;;   divq      Horizontal Q advective tendency
;;   ps        Surface pressure
;;   omega     Vertical pressure velocity
;;   u         U wind
;;   v         V windspeed
;;   usrf      U wind at surface
;;   vsrf      V wind at surface
;;   pt        Surface pressure tendency
;===========================================================================
;===========================================================================
begin
;    ifile = "/glade/p/cesmdata/cseg/inputdata/atm/cam/scam/iop/TWP06_4scam.nc"
;    ifile = "/glade/p/cesmdata/cseg/inputdata/atm/cam/scam/iop/TOGAII_4scam.nc"
;    ofile = "/glade/scratch/ginochen/SCAM/rce_iop_twp06.nc"
;    ofile = "/glade/scratch/ginochen/SCAM/rce_iop_togaii.nc"  ; this is the output column file on a point (lat,lon)

    days = 100                      ; number of days to simulate
    
    tstep   = 20   *60              ; model time step in seconds
    tsz     = days *60*60*24/tstep  ; number of time steps
    ifile = "example.nc"
    fin = addfile(ifile,"r")
    ofile = "out_test.nc"

    lat = -2.10  ; 0.
    lon = 154.69 ; 155.

;===========================================================================
;===========================================================================
    print("")
    print("  tstep =    "+tstep+" sec   ("+(tstep/60.)+" min)")
    print("")
    print("  tsz    =   "+tsz+" steps   ("+(tsz/(60.*60.*24./tstep))+" days)")
    print("")

    pi = 3.14159
    R  = 287.
    cp = 1004.

    if isfilepresent(ofile) then system("rm "+ofile) end if
    fout = addfile(ofile,"c")
;===========================================================================
;===========================================================================
    lon!0           = "lon"
    lon&lon         = lon
    lon@long_name   = "Longitude"
    lon@units       = "degrees_east"
    
    lat!0           = "lat"
    lat&lat         = lat
    lat@long_name   = "Latitude"
    lat@units       = "degrees_north"

    lev = fin->lev
    nlev = dimsizes(lev)
    T_in     = fin->t; (0,:,0,0) 
    q_in     = fin->q; (0,:,0,0)
    u_in     = fin->u; (0,:,0,0)
    v_in     = fin->v; (0,:,0,0)
    omega_in = fin->omega; (0,:,0,0)
    divT_in  = fin->divT; (0,:,0,0)
    divq_in  = fin->divq; (0,:,0,0)
    divs_in  = fin->divs; (0,:,0,0)
    dTdt_in  = fin->dTdt; (0,:,0,0)
    dqdt_in  = fin->dqdt; (0,:,0,0)
    dsdt_in  = fin->dsdt; (0,:,0,0)

    Ptend_in = fin->Ptend; (0,0,0)
    ps_in    = fin->ps; (0,0,0)
    phis_in  = fin->phis; (0,0,0)
    Tsair_in = fin->tsair; (0,0,0)
    usrf_in  = fin->usrf; (0,0,0)
    vsrf_in  = fin->vsrf; (0,0,0)
    lhflx_in = fin->lhflx; (0,0,0)
    shflx_in = fin->shflx; (0,0,0)
;    TOA_LWup_in = fin->lw_net_toa; (0,0,0)
;    TOA_SWdn_in = fin->sw_net_toa; (0,0,0)
;    TOA_ins_in  = fin->sw_dn_toa; (0,0,0)
;    NDRsrf_in   = fin->rad_net_srf; (0,0,0)

;    print(Tsair_in)
;    print(usrf_in)
;    print(vsrf_in)
;    print(TOA_LWup_in)
;    print(TOA_SWdn_in)
;    print(TOA_ins_in)
;    print(NDRsrf_in)

    print("  nlev     =   "+nlev)
    print("")

    bdate       = 19921218 ; togaii
;    bdate      = 20060117 ; twp06
;    bdate      = 19950718 ; arm95
    bdate@units = "yymmdd"
    bdate!0     = "date"

    ;tsec       = new(floattoint(tsz),integer)  
    tsec        = 00+ispan(0,(tsz-1)*tstep,tstep)
    tsec!0      = "time"
    tsec@units  = "s"
;===========================================================================
;===========================================================================
;     Basic Variables
    phis     = new((/tsz/),float)
    ps       = new((/tsz/),float)
    T        = new((/tsz,nlev/),float)
    q        = new((/tsz,nlev/),float)
    u        = new((/tsz,nlev/),float)
    v        = new((/tsz,nlev/),float)
    Tg       = new(tsz,float)
    Tsair    = new(tsz,float)
    vsrf     = new(tsz,float)
    usrf     = new(tsz,float)
    omega    = new((/tsz,nlev/),float)
;     Tendency variables
    divT     = new((/tsz,nlev/),float)
    divq     = new((/tsz,nlev/),float)
    divs     = new((/tsz,nlev/),float)
    dTdt     = new((/tsz,nlev/),float) 
    dqdt     = new((/tsz,nlev/),float)
    dsdt     = new((/tsz,nlev/),float)
    Ptend    = new((/tsz/),float)
    lhflx    = new((/tsz/),float)
    shflx    = new((/tsz/),float)
;     Radiation
    TOA_LWup = new(tsz,float)
    TOA_SWdn = new(tsz,float)
    TOA_ins  = new(tsz,float)
    NDRsrf   = new(tsz,float)
;===========================================================================
;===========================================================================    
    phis(:)  = 0.
    
    phis@long_name  = "Surface geopotential height"
    phis@units      = "m/s2"  
    phis!0          = "time"
    phis&time       = tsec
        
    dP = new(nlev,float)
    dP(0)    = 0.
    dP(1:)   = lev(1:nlev-1) - lev(0:nlev-2)
;===========================================================================
;===========================================================================
    ;-----------------------------------------------------
    ; Option #1 - pull T and qv from a file
    ;-----------------------------------------------------
    ;infile = addfile(dir+"mean.raspe.nc","r")
    ;T_avg = infile->T_avg
    ;Q_avg = infile->Q_avg
    
    ;-----------------------------------------------------
    ; Option #2 - Define T & q based on lapse rates
    ;-----------------------------------------------------
    ; define near surface values
    T(:,nlev-1) = 301.   ;(28 C)
    q(:,nlev-1) = 0.022

    ;-----------------------------------------------------
    ; iterate upwards from the surface
    ;-----------------------------------------------------
    do k = 1,nlev-1
        l = nlev-1-k
        print("    k = "+k+"    l = "+l)
        ;-----------------------------------------------------
        ; #1 Use data from a file
        ;-----------------------------------------------------
        T(:,l) = T_in(l)
        q(:,l) = q_in(l)
        ;-----------------------------------------------------
        ; #2 Use Lapse rate to define mean T profile
        ;-----------------------------------------------------
        ;T(:,l) = T(:,l+1) - (R/cp) * T(:,l+1) / lev(l+1) * dP(l+1)
        ;q(:,l) = q(:,l+1) - .3 * q(:,l+1)
        ;-----------------------------------------------------
        ; check for negative water vapor (and set to zero)
        ;-----------------------------------------------------
        ;if q(0,l).lt.0. then q(:,l) = 0. end if
    end do
    ;-----------------------------------------------------
    ; flip profiles if necessary
    ;-----------------------------------------------------
    ;T = T(:,::-1)
    ;q = q(:,::-1)
    ;-----------------------------------------------------
    ;-----------------------------------------------------
    fmt = "%8.2f"
    print("-----------------------------------------------")
    print("   lev          T             q")
    print("   "+(lev(:)/100.)+" hpa    "+sprintf(fmt,T(0,:))+"    "+sprintf(fmt,q(0,:)*1e3))
    print("-----------------------------------------------")
    ;-----------------------------------------------------
    ; Add coordinate information
    ;-----------------------------------------------------
    T@long_name = "Temperature"
    T@units     = "K"
    
    q@long_name = "water vapor mixing ratio"
    q@units     = "kg/kg"

    s@long_name = "dry static energy"
    s@units     = "K"
;   s = 


    T!0         = "time"
    T!1         = "lev"
    T&time      = tsec
    T&lev       = lev
    
    copy_VarCoords(T,q)
;===========================================================================
; Set large-scale tendencies to 0.0 for RCE
;===========================================================================
    ;-----------------------------------------------------
    ; Large-scale divergence
    ;-----------------------------------------------------
    do k = 1,nlev-1
        l = nlev-1-k

        divT(:,l) = divT_in(l)
        divq(:,l) = divq_in(l)
        divs(:,l) = divs_in(l)
    end do
;    divT(:,:) = 0.
;    divq(:,:) = 0.
;    divs(:,:) = 0.
      
        divT@long_name  = "Horizontal T advective tendency"
        divq@long_name  = "Horizontal Q advective tendency"
        divs@long_name  = "Horizontal S advective tendency"

        divT@units  = "K/s"
        divq@units  = "kg/kg/s"
        divs@units  = "K/s"
        copy_VarCoords(T,divT)
        copy_VarCoords(T,divs)
        copy_VarCoords(T,divq)
    ;-----------------------------------------------------
    ; Eulerian large-scale tendency (not important)
    ;-----------------------------------------------------
    do k = 1,nlev-1
        l = nlev-1-k

        dTdt(:,l) = dTdt_in(l)
        dqdt(:,l) = dqdt_in(l)
        dsdt(:,l) = dsdt_in(l)
    end do
;    dTdt(:,:) = 0.
;    dqdt(:,:) = 0.
;    dsdt(:,:) = 0.
  
        dTdt@long_name = "dT/dt"
        dqdt@long_name = "dq/dt"
        dsdt@long_name = "ds/dt"
        dTdt@units     = "K/s"
        dqdt@units     = "kg/kg/s"
        dsdt@units     = "K/s"

        copy_VarCoords(T,dTdt)
        copy_VarCoords(T,dqdt)
        copy_VarCoords(T,dsdt)
;===========================================================================
; Set other necessary variables
;===========================================================================
    ;-----------------------------------------------------
    ; Set Surface Pressure
    ;-----------------------------------------------------
    ps(:) = ps_in
;    ps(:) = 99800.

        ps@units    = "Pa"
        ps!0        = "time"
        ps&time     = tsec
    ;-----------------------------------------------------
    ; Set Omega
    ;-----------------------------------------------------
    do k = 1,nlev-1
        l = nlev-1-k
        omega(:,l) = omega_in(l)
    end do
;    omega(:,:) = 0.  

        omega@long_name = "Vertical pressure velocity"
        omega@units     = "Pa/s"

        copy_VarCoords(T,omega)
    ;-----------------------------------------------------
    ; Set wind profile
    ;-----------------------------------------------------
    do k = 1,nlev-1
        l = nlev-1-k

        u(:,l) = u_in(l)
        v(:,l) = v_in(l)
    end do
;    u(:,:) = 0.
;    v(:,:) = 0.

        u@long_name = "U wind"
        u@units     = "m/s" 
        
        v@long_name = "U wind"
        v@units     = "m/s" 
        
        copy_VarCoords(T,u)
        copy_VarCoords(T,v)
    ;-----------------------------------------------------
    ; Set Pressure Tendency
    ;-----------------------------------------------------
    Ptend(:) = Ptend_in
;    Ptend(:)  = 0.

        Ptend@long_name = "Surface pressure tendency"
        Ptend@units     = "Pa/s"
        
        copy_VarCoords(ps,Ptend)
    ;-----------------------------------------------------
    ; Set surface fluxes (or set surface wind)
    ;-----------------------------------------------------
    lhflx(:) = lhflx_in
    shflx(:) = shflx_in
;    ;lhflx(:) = 30.
;    ;shflx(:) = 30.

        lhflx@long_name = "Surface latent heat flux"
        lhflx@units     = "W/m2"
        shflx@long_name = "Surface sensible heat flux"
        shflx@units     = "W/m2"   
        copy_VarCoords(ps,lhflx)
        copy_VarCoords(ps,shflx)     
    ;-----------------------------------------------------
    ; Set surface variables
    ;-----------------------------------------------------
    Tg(:)     = Tsair_in
    Tsair(:)  = Tsair_in
      
        Tg@long_name    = "Ground temperature"
        Tg@units        = "K"
        Tg!0            = "time"
        Tg&time         = tsec
  
        Tsair@long_name = "Surface air temperature"
        Tsair@units     = "K"
        
        copy_VarCoords(ps,Tg   )
        copy_VarCoords(ps,Tsair)
    ;-----------------------------------------------------
    ; Set surface wind (which control fluxes)
    ;-----------------------------------------------------
    usrf(:) = usrf_in
    vsrf(:) = vsrf_in
;    usrf(:)   = 5.
;    vsrf(:)   = 0.
  
        usrf@long_name  = "Surface U wind"
        usrf@units      = "m/s"
  
        vsrf@long_name  = "surface V wind"
        vsrf@units      = "m/s"
        
        copy_VarCoords(ps,usrf)
        copy_VarCoords(ps,vsrf)
    ;-----------------------------------------------------
    ; Set radiation variables
    ;-----------------------------------------------------
;    TOA_LWup(:)   = TOA_LWup_in
;    TOA_SWdn(:)   = TOA_SWdn_in
;    TOA_ins(:)    = TOA_ins_in
;    NDRsrf(:)     = NDRsrf_in
    TOA_LWup(:)   = 260.
    TOA_SWdn(:)   = 100.
    TOA_ins(:)    = 300.
    NDRsrf(:)     = 80.
  
        TOA_LWup@long_name  = "TOA LW up"
        TOA_LWup@units      = "W/m2"
        
        TOA_SWdn@long_name  = "TOA SW down"
        TOA_SWdn@units      = "W/m2"
        
        TOA_ins@long_name   = "TOA insolation"
        TOA_ins@units       = "W/m2"
  
        NDRsrf@long_name    = "Net downwelling radiation at the surface"
        NDRsrf@units        = "W/m2"

        copy_VarCoords(ps,TOA_LWup)
        copy_VarCoords(ps,TOA_SWdn)
        copy_VarCoords(ps,TOA_ins)
        copy_VarCoords(ps,NDRsrf)
;===========================================================================
; Write data out to file (path set by ofile)
;===========================================================================
    ;-----------------------------------------------------
    ; Coordinates
    ;-----------------------------------------------------
    fout->lev      = lev
    fout->lat      = lat
    fout->lon      = lon
    fout->bdate    = bdate
    fout->tsec     = tsec
    ;-----------------------------------------------------
    ; Basic variables
    ;-----------------------------------------------------
    fout->phis     = phis
    fout->T        = T
    fout->q        = q
    fout->Ps       = ps
    fout->omega    = omega
    fout->u        = u
    fout->v        = v
    fout->Tg       = Tg
    fout->Tsair    = Tsair
    fout->usrf     = usrf
    fout->vsrf     = vsrf
    ;-----------------------------------------------------
    ; Tendency variables
    ;-----------------------------------------------------
    fout->Ptend    = Ptend
    fout->divT     = divT
    fout->divq     = divq
    fout->divs     = divs
    fout->dTdt     = dTdt
    fout->dqdt     = dqdt
    fout->dsdt     = dsdt
    fout->lhflx    = lhflx
    fout->shflx    = shflx
    ;-----------------------------------------------------
    ; Radiation
    ;-----------------------------------------------------
    fout->TOA_LWup = TOA_LWup
    fout->TOA_SWdn = TOA_SWdn
    fout->TOA_ins  = TOA_ins
    fout->NDRsrf   = NDRsrf
;===========================================================================
; Print output file path
;=========================================================================== 
    print("")
    print("   "+ofile)
    print("")
;===========================================================================
;===========================================================================
end
