%cyfil taken from pg543
function [x,y,w,phi] = pecCylinderfill(NumCells,circ)
%generates x,y coordinates around a circle with a given cell width 'width'
%     NumCells %number of cells around surface
    radius = circ/(2*pi); %2pir = circumfrence
    phi = linspace(0,2*pi,NumCells+1); %plus one is to stop repeats
    x = zeros(1,NumCells);
    y = zeros(1,NumCells);
    w = (circ/NumCells)*ones(1,NumCells);

    for ii = 1:NumCells
        x(ii) = radius*cos(phi(ii));
        y(ii) = radius*sin(phi(ii));
    end
    
    phi = phi(1:end-1)*180/pi;
end