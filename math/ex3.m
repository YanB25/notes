mu = 2;
sigma = 0.25;
x1 = [0.5 : 0.01 : 3.5];
x2 = [1.5 : 0.01 : 1.9];
y1 = normpdf(x1, mu, sigma);
y2 = normpdf(x2, mu, sigma);
n = size(x2, 2) 
plot(x1, y1)
    , hold
    , fill([x2, fliplr(x2)], [zeros(1, n), fliplr(y2)], 'b')
    , xlabel('X')
    , ylabel('probability density');
