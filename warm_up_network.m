% build training input matrix
p1=[-1    1    1    1    1    -1    1    -1    -1    -1    -1    1    1    -1    -1    -1    -1    1    1    -1    -1    -1    -1    1    -1    1    1    1    1    -1]';
p2=[ -1    -1    -1    -1    -1    -1    1 -1 -1    -1    -1    -1    1    1    1    1    1    1    -1    -1    -1    -1    -1    -1    -1    -1    -1    -1    -1    -1]';
p3=[1 -1 -1    -1    -1    -1    1 -1 -1    1    1    1    1    -1    -1    1    -1    1    -1    1    1    -1    -1    1    -1    -1    -1    -1    -1    1]';
P=[p1 p2 p3];

% build expected output matrix
t1=[1 0 0]';
t2=[0 1 0]';
t3=[0 0 1]';
T=[t1 t2 t3];

training_set = {{p1 t1} {p2 t2} {p3 t3}};

% build test set
p4 = [1	1	1	1	1	-1	1	-1	-1	-1	-1	1	1	-1	-1	-1	-1	1	1	1	1	1	1	1	-1	-1	-1	-1	-1	-1]';
p5 = [1	-1	-1	-1	-1	-1	1	1	1	1	1	1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1]';
p6 = [-1	-1	-1	-1	-1	-1	1	-1	-1	1	1	1	1	-1	-1	1	-1	1	-1	1	1	-1	-1	1	-1	-1	-1	-1	-1	1]';

test_set = {{p4 t1} {p5 t2} {p6 t3}};

r = neural_network;

% length = 30 neurons = 2 
r.initialize(length(p1), 2, @logsig);

% t = 3 so last layer has 3 neurons
r.add_layer(3, @logsig);

r.train(50, training_set);
n_correct = r.evaluate(test_set);