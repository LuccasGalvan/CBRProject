function trainHeart()
S = readmatrix('heart_train.csv', 'Delimiter', ',', 'DecimalSeparator', '.');

in = S(:,1,end-1)';

target = S(:, end)';

net = feedforwardnet;

net.trainFcn = 'trainlm';

net.layers{2}.transferFcn = 'tansig';

net.trainParam.epochs = 1000;

[net, tr] = train(net, in, target);

out_sim = sim(net, in);

fprintf('Output: ');
display(out_sim);
fprintf('Target: ');
display(target);
end