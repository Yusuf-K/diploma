%function imageCalculation calculates image of x from [0,1]
%and places this image into array y
%M sets required accuracy
%N sets the dimension of hypercube
%key sets particular evolvent. 1: approximation by centers;
%                              2: approximation by piecewise linear evolvent l_M(x)
%                              3: approximation by non-univalent evolvent n_M(x)
%z_m = mth subcube
%s - centerNum in subcube
function y = imageCalculation(x, N, M)
    %y = zeros(1,N) - ones(1,N);
    y = zeros(1,N);
    p = ones(1,N)/2;
    partition = linspace(0, 1, 2^(M*N)+1);
    if x == 1
        lb_number = 2^M*N-1;
    else
        for i=2:2^(M*N)+1
            if x<partition(i) && x>=partition(i-1)
                lb_number = i-1;
            end
        end
    end
    left_bound = partition(lb_number);
    binary_part = zeros(1,M*N);
    if partition(lb_number) == 0
        binary_part = zeros(1,M*N);
    elseif partition(lb_number) == 1
        binary_part = [1 zeros(1,M*N-1)];
    else
        for i = 1:M*N
            left_bound = left_bound * 2;
            binary_part(i) = floor(left_bound);
            left_bound = left_bound - floor(left_bound);
        end
    end
    z = zeros(1, M);
    for j = 1:M
        for i=0:N-1
            z(j) = z(j) + binary_part(j*N-i)*2^i;
        end
    end
    if M == 0
        t = N;
        q = zeros(1, N);
   % elseif M > 0
        %t = coordDifference(z(1),N);
        %q = centerPosition(z(1),N);
        %t = coordDifference(lb_number,N);
        %q = centerPosition(lb_number,N);
        %t = coordDifferenceMod(z(M), N, t);
        %q = centerPositionMod(z(M), N, t, q);
        %t = coordDifferenceMod(lb_number, N, t);
        %q = centerPositionMod(lb_number, N, t, q);
    %else
    %    error('M should be positive!')
    end
    for i = 1:M
        t = coordDifference(z(1),N) + 1;
        q = centerPosition(z(1),N);
        t = coordDifferenceMod(z(M), N, t);
        q = centerPositionMod(z(M), N, t, q);
        for j = 1:2^N
            coords = linkNumerations(j, N, t, q);
            %coords = linkNumerations(lb_number, N, t, q);
            %y(i,:) = (coords-p)*2^(-i);
            y = y + (coords - p)*2^(-i);
        end
    end 
end
