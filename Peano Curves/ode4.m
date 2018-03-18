function [T,Y] = ode4(ode,tspan,y0,options)
%ODE4     Функция ODE4 Реализует 4-хстадийный метод Рунге-Кутты 4 порядка
h = options.h;
t0 = tspan(1);
tf = tspan(2);

T = (t0:h:tf)';
if T(end) < tf, T(end+1)=tf; end

nrowsT = size(T,1);
Y=zeros(nrowsT,length(y0));
Y(1,:) = y0(:).';
for norowT = 2:nrowsT
    
    t  = T(norowT-1);
    y  = Y(norowT-1,:).';
    h  = T(norowT) - T(norowT-1);
    k1 = ode(t,y);
    k2 = ode(t+h/2,y+1/2*h*k1);
    k3 = ode(t+h/2,y+1/2*h*k2);
    k4 = ode(t+h,y+h*k3);
    yn = y+(1/6)*h*(k1+2*k2+2*k3+k4);
    
    Y(norowT,:) = yn.';

end

end