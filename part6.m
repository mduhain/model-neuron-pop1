function [output,err] = classifier(resps1,resps2)

% var 'mat'    = 100 (neurons) x 401 (responses at each stimulus)
% var 'resps1' = 500 (poissrnd responses) x 100 (each neuron) @ -0.1 deg
% var 'resps2' = 500 (poissrnd responses) x 100 (each neuron) @ +0.1 deg

training = [resps1(1:400,:); resps2(1:400,:)];
sample = [resps1(401:500,:); resps2(401:500,:)];
group = [repmat(-0.1,[400,1]); repmat(0.1,[400,1])];

[output,err] = classify(sample, training, group);

end

