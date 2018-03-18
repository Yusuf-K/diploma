function vector = permutation(vec, t, N)
    vector = ones(1,N);
    for i= 1:t-1
        vector(i) = vec(i);
    end
    vector(t) = vec(N);
    for i= t+1:N-1
        vector(i) = vec(i);
    end
    vector(N) = vec(t);
end
