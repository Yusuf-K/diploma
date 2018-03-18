function l_t = coordDifferenceMod(centersQuant, N, t)
    l = coordDifference(centersQuant, N)+1;   
    if l == t
        l_t = N;
    elseif l == N
        l_t = t;
    else
        l_t = l;
    end
end