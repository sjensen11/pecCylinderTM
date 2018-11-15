function [ rcs,jj ] = solvePECcylinder( xx,yy,ww,phi_inc,phi_RCS  )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
kk=2*pi;
netta = 377;
gamma = 1.781072418; %cme-petterson-pg39, (2.13)

NumCells = length(xx);
%solve
Einc = zeros(NumCells,1);
zz = zeros(NumCells);


for mm = 1:NumCells %where I'm looking at
    
     Einc(mm) = exp(1j*-2*pi*((xx(mm)*cos(phi_inc) + yy(mm)*sin(phi_inc))));
%      Ein(mm) = exp(1j*2*pi*(x(mm)));
    for nn = 1:NumCells %against the source
        if mm == nn %diagonal component
            zz(mm,nn) = ww(mm)*(1 - 1j*(2/pi)* (log(gamma *kk*ww(mm)/4)-1));
        else
            RR = sqrt( (xx(mm)-xx(nn))^2 + (yy(mm)-yy(nn))^2);          

            zz(mm,nn) = ww(nn)*besselh(0,2,2*pi*RR); %2pi from k
        end

    end
    
end

zz = (kk*netta/4) * zz;

jj = zz\Einc;

rcs = 0;
for nn =1:NumCells
    rcs = rcs + jj(nn)*ww(nn)*exp(1j*kk*(xx(nn)*cos(phi_RCS)+yy(nn)*sin(phi_RCS)));
end
rcs = kk*netta^2/4 * abs(rcs)^2;
end

