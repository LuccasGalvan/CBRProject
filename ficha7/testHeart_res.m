function [y] = testHeart_res()
    load('heart1.mat');
    S = readmatrix('heart_test.csv', 'Delimiter', ',', 'DecimalSeparator', '.');
    in = S';
    y = net(in); % equivalente a y = sim(net,x)
    y = (y >= 0.5);

end