%l(s) -- number of coordinate in which
%centers u(s) and u(s-1) are different
function l = coordDifference(centersQuant, N) 
    l=-1;
    if (centersQuant == 0) || (centersQuant == 2^N - 1)
        l = N-1;
    elseif centersQuant == 2^N
        return;
    elseif mod(centersQuant,2) == 0
        centers_numeration_m1 = centersNumeration(centersQuant - 1, N);
        centers_numeration = centersNumeration(centersQuant, N);
        diff = centers_numeration - centers_numeration_m1;
        for i=1:N
            if diff(i)~=0
                l = i-1;
            end
        end
    else l = coordDifference(centersQuant+1,N);
    end
    
end