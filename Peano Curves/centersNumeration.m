%function centersNumeration calculates vector u(s) centersNumeration which gives
%numeration of subcubes'centers
%centersQuant: quantity of centers
%N: dimension
%0 <= centersQuant <= 2^N - 1
function centers_Numeration = centersNumeration(centersQuant, N)
    %calculate binary representation of centersQuant
%     if centersQuant == 0
%         binary_representation = zeros(1,N);
%         centers_Numeration = binary_representation;
%     elseif centersQuant == 1
%         binary_representation = [1 zeros(1,N-1)];
%         centers_Numeration = binary_representation;
%     else
%         binary_representation = de2bi(centersQuant);
%     end
%     centers_Numeration = ones(1,N);
%     for j=2:N
%         centers_Numeration(j) = mod(binary_representation(j-1) + binary_representation(j), 2);
%     end
%     centers_Numeration(N) = binary_representation(N);
    if centersQuant == 0
        binary_representation = zeros(1,N);
        centers_Numeration = binary_representation;
    elseif centersQuant == 2^N-1
        binary_representation = [1 zeros(1,N-1)];
        centers_Numeration = binary_representation;
    else
        if centersQuant == 1
            binary_representation = [0 0 1];
        else
            binary_representation = [0 de2bi(centersQuant, 'left-msb')];
        end
        buffer = ones(1,N);
        for j=2:N+1
            buffer(j) = mod(binary_representation(j-1) + binary_representation(j), 2);
        end
        centers_Numeration = buffer(2:N+1); 
    end
    
    %centers_Numeration(N) = binary_representation(N);    
    
    
end
