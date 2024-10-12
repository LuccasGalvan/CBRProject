function [net] = trainHeart_res()
%UNTITLED Summary of this function goes here
S = readmatrix('heart_train.csv', 'Delimiter', ',', 'DecimalSeparator', '.');
in = S(:,1:13)';
t = S(:,14)';

net = feedforwardnet([50 50 20]);
net.trainFcn = 'traingdx';
%net.divideFcn='';
[net,tr] = train(net,in,t);
view(net)
y = net(in); % equivalente a y = sim(net,x)
y = (y >= 0.5);
perf = perform(net,t,y)
plotperform(tr);
save('heart1.mat','net');
end