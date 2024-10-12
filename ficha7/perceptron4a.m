function perceptron4a( )
%Implementing a perceptron using the NNTool

% clear
clear all;
close all;

% input initialization
in = [0 1 0 0 0 1 1 1 0 0 1 1 1 0 1;
      0 0 1 0 0 1 0 0 1 0 1 0 1 1 1;
      0 0 0 1 0 0 0 1 1 1 1 1 0 1 1;
      0 0 0 0 1 0 1 0 0 1 0 1 1 1 1];

target = [1 0 0 0 0 1 1 1 1 1 0 0 0 0 1];

% COMPLETE: use the nntool to create a perceptron called net
net = perceptron;

% COMPLETE: initialize the number of epochs to 100
net.trainParam.epochs = 100;

% COMPLETAR: use the nntool to train the perceptron
net = train(net, in, target);

% COMPLETE: use the nntool to simulate the perceptron (store the output in
% y)
y = sim(net, in);

erro = perform(net, target, y);
fprintf('Erro: %f\n', erro);

% Show output
fprintf('Target desired:');
disp(target);
fprintf('output reached: ')
disp(y);

% Vizualize the perceptron
view(net)

end

