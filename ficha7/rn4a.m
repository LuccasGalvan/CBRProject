function rn4a( )
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

% COMPLETAR: ajustar os parametros seguintes
net = feedforwardnet([10 10]);

% FUNCAO DE ATIVACAO DA CAMADA DE SAIDA
net.layers{2}.transferFcn = 'tansig';

% FUNCAO DE TREINO 
net.trainFcn = 'trainlm';


% NUMERO DE EPOCAS DE TREINO
net.trainParam.epochs = 1000;

% TODOS OS EXEMPLOS DE INPUT SAO USADOS NO TREINO
net.divideFcn = '';

% COMPLETAR: treinar a rede
net = train(net, in, target);

% visualizar a rede
view(net)

% COMPLETAR simular a rede e guardar o resultado na variavel y
y = sim(net, in);

% Mostrar resultado
y = (y >= 0.5);
fprintf('Saida da RN: ');
disp(y);
fprintf('Saida desejada para: ');
disp(target);

erro = perform(in, target, y);
fprintf('Erro: %f', erro);


end


