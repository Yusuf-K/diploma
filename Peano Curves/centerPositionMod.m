%computes centers position for M>1
function center_position = centerPositionMod(centersQuant,N,t,q)
    center_position = centerPosition(centersQuant, N);    
    permutated = permutation(center_position, t, N);
    link_numerations = ones(1,N);
    
    for i= 1:N
        link_numerations(i) = mod(permutated(i)+q(i), 2);
    end
end