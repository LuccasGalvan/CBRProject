function paridade_par()
%Implementa Paridade par com um perceptrao e com uma rede neuronal



% inicializar entrada
in = [0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1
     0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1 
     0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1
     0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1];

t = [1 0 0 1 0 1 1 0 0 1 1 0 1 0 0 1];


fprintf('Perceptrao:\n');


p = perceptron;

p = train(p, in, t);
out_sim = sim(p, in);
out_sim = out_sim>=0.5;

disp(out_sim);


fprintf('Rede Neuronal:\n');

n = feedforwardnet;

n.divideFcn = '';                 

n = train(n, in, t);

out_sim = sim(n, in);
out_sim = out_sim>=0.5;
disp(out_sim);


end
