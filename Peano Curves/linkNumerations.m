% special linkage in the numerations of elements D(z1 , z2 ), 
% 0 ˜ z2 ˜ 2N ? 1, from different subcubes D(z1 ), 0 ˜ z1 ˜ 2N ? 1.
function link_numerations = linkNumerations(centersQuant, N, t, q)
    centers_numeration = centersNumeration(centersQuant, N);    
    permutated = permutation(centers_numeration, t, N);
    link_numerations = ones(1,N);
    
    for i= 1:N
        link_numerations(i) = mod(permutated(i)+q(i), 2);
    end
end