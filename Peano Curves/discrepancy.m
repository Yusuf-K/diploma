%function discrepancy calculates discrepancy between actual and integrated
%values of coordinates and velocity
%input:
%theta_1, theta_2, theta_3 - angles which describe position on 4D
%elementary sphere
%output: vector which contains difference in velocity and coordinate
function [diff_v, diff_r] = discrepancy(theta_1, theta_2, theta_3)
    T = t_f - t_0;
    r_1 = cos(theta_1);
    r_2 = sin(theta_1)*cos(theta_2);
    r_3 = sin(theta_1)*sin(theta_2)*cos(theta_3);
    r_4 = sin(theta_1)*sin(theta_2)*sin(theta_3);
    y_0 = [r_1, r_2, r_3, r_4];
    v_0 = [0, 1];
    v_f = [0, sqrt(R_2)];
    delta_v = 0.01*T;
    
    %rvect = y(1:3);
    %r = norm(rvect);
    %vvect = y(4:6);

    dydt = zeros(6, 1);
    dydt(1:3) = vvect;
    dydt(4:6) = -mu*rvect/r^3;
end