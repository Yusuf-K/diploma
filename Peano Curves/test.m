clear vars
clc
%x = zeros(1,50);
%y = imageCalculation(0.5, 2, 3);
M = 3;
N = 2;
coords = ones(M, N);
%xs = zeros(1, 10*M);
%ys = zeros(1, 10*M);
xs = [];
ys = [];
step = 2^(-M*N);
for i=0:step:1
    coords = imageCalculation(i, N, M);
    xs = [xs coords(1,1)/2^N];
    ys = [ys coords(1,2)/2^N];
end
figure
grid on
hold on
plot(xs, ys, 'o')
xlim([-0.5 0.5])
ylim([-0.5 0.5])

