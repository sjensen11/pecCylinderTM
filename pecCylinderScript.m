%script to run the pec stuff

NumCells = 100;
circumference = 1;

phi_inc = 0;
phi_RCS = pi;

[xx,yy,ww,phi] = pecCylinderfill(NumCells,circumference);
[ rcs,jj ] = solvePECcylinder( xx,yy,ww,phi_inc,phi_RCS  );

 rcs = rcs
 rcs_dB = 10*log10(rcs)
 
 [ tt,JJ ] = plotPulseBasis( jj, ww );
 title('circumference = 1 lambda, num cell = 100');xlabel('points around circumference');ylabel('current density magnitude')