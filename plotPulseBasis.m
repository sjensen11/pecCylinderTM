function [ tt,JJ ] = plotPulseBasis( coeff, widths )
%UNTITLED5 Summary of this function goes here
%   given the coefficients and width of each section plot the current
%   expanded by pulse basis

numNodes = length(coeff);
JJ = [coeff(1) coeff(1)];
tt = [0 widths(1)];
curLoc = widths(1);
for ii = 2:numNodes
    JJ = [JJ coeff(ii) coeff(ii)];
    tt =[tt curLoc curLoc+widths(ii) ];
    
    curLoc = curLoc+widths(ii);
end

plot(tt,abs(JJ))

end

