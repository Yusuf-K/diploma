%The binary vector w(z1) is to be used for 
%determining the position of the center of the subcube ? (0) employed in 
%(2.2.22) with z2 = 0, i.e., it will be used to set the value of the vector q 
%embedded into (2.2.24).
function center_position = centerPosition(centersQuant, N)
%     centers_numeration = centersNumeration(centersQuant, N);
%     center_position = ones(1, N);
%     if centersQuant == 0
%         center_position = centers_numeration;
%     elseif centersQuant == 2^N - 1
%         center_position = centers_numeration;
%         center_position(N) = 1;
%     elseif mod(centersQuant,2) == 1
%         for i=2:N
%             center_position(i) = centers_numeration(i);
%         end
%         center_position(1) = mod(centers_numeration(1)+1, 2);
%     else center_position = centerPosition(centersQuant - 1, N);
%     end
    centers_numeration = centersNumeration(centersQuant, N);
    center_position = centers_numeration;
    if centersQuant == 0
        return;
    elseif centersQuant == 2^N - 1
        %center_position = centers_numeration;
        center_position(N) = 1;
    elseif mod(centersQuant,2) ~= 1
        l = coordDifference(centersQuant, N);
        center_position(l+1) = mod(centers_numeration(l+1)+1, 2);
        %enter_position(l+1) = mod(centers_numeration(l)+1, 2)
        center_position(N) = mod(centers_numeration(N)+1, 2);
        %center_position(1) = mod(centers_numeration(1)+1, 2);
    else center_position = centerPosition(centersQuant - 1, N);
    end
end