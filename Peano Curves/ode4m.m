function [ T, Y ] = ode4m( ode, tspan, y0, options )
%ODE4m Реализует явный многошаговый метод 4 порядка
h = options.h;

t0 = tspan(1);
tf = tspan(2);

T = (t0:h:tf).';
if T(end) ~= tf
    T(end+1) = tf;
end

nrowsT = size(T, 1);
Y = zeros(nrowsT, length(y0));
Y(1, :) = y0(:).';


%Стартовые точки из метода Рунге-Кутты
for norowT = 2:min(4, nrowsT)
    
    h = T(norowT) - T(norowT-1);
    t = T(norowT - 1);
    y = Y(norowT - 1,:).';
    
    k1 = ode(t,       y);
    k2 = ode(t + h/2, y + h*k1/2);
    k3 = ode(t + h/2, y + h*k2/2);
    k4 = ode(t + h,   y + h*k3);
    
    yn = y + h*(k1 + 2*k2 + 2*k3 + k4)/6;
    
    Y(norowT, :) = yn.';
end

%Многошаговый метод 4порядка для остальных точек
for norowT = 4:nrowsT-1
    tn = T(norowT);
    tnm1 = T(norowT - 1);
    tnm2 = T(norowT - 2);
    tnm3 = T(norowT - 3);
    
    yn = Y(norowT, :).';
    ynm1 = Y(norowT - 1, :).';
    ynm2 = Y(norowT - 2, :).';
    ynm3 = Y(norowT - 3, :).';
    
    fn = ode(tn, yn);
    fnm1 = ode(tnm1, ynm1);
    fnm2 = ode(tnm2, ynm2);
    fnm3 = ode(tnm3, ynm3);

    ynp1 = yn + h*(55/24*fn - 59/24*fnm1 + 37/24*fnm2 - 9/24*fnm3);
    
    Y(norowT+1, :) = ynp1.';
    
    
    
end
if nrowsT > 4
% Интерполяция 4 порядка

dtm3 = (tf - tnm3)/h;
dtm2 = (tf - tnm2)/h;
dtm1 = (tf - tnm1)/h;
dtm0 = (tf - tn)/h;
dtp1 = (tf - tn - h)/h;

s1 =   ynm3 * dtm2 * dtm1 * dtm0 * dtp1/24;
s2 = - ynm2 * dtm3 * dtm1 * dtm0 * dtp1/6;
s3 =   ynm1 * dtm3 * dtm2 * dtm0 * dtp1/4;
s4 = - yn   * dtm3 * dtm2 * dtm1 * dtp1/6;
s5 =   ynp1 * dtm3 * dtm2 * dtm1 * dtm0/24;

Y(norowT+1, :) = (s1 + s2 + s3+ s4+s5).';

end


end



