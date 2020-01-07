%% Initialization
clear all
tun_curves = zeros(100,401); % (each row = 1 neuron) (each column = responses)
range = -2:0.01:2; %step size for tuning curves


%% create 100 neurons
for n=1:100
    %--for random (even) distribution
    r = floor(rand()*401)+1;
    tun_curves(n,:) = neuron(range(r));
    
    %--for purely uniform distribution
    %testx=[-2:0.04:1.96];
    %neuron(testx(n))
end

table = table();

table.tests = [0.01 0.05 0.1 0.2 0.5]';

for n=1:length(table.tests)
    table.positive_resps{n} = rsample(table.tests(n),tun_curves,range);
    table.negative_resps{n} = rsample(table.tests(n)*-1,tun_curves,range);
    [table.classification{n},table.error(n)] = classifier(table.positive_resps{n}, ...
        table.negative_resps{n});
end


%% function classifier()
function [output,err] = classifier(resps1,resps2)

% var 'mat'    = 100 (neurons) x 401 (responses at each stimulus)
% var 'resps1' = 500 (poissrnd responses) x 100 (each neuron) @ -0.1 deg
% var 'resps2' = 500 (poissrnd responses) x 100 (each neuron) @ +0.1 deg

training = [resps1(1:400,:); resps2(1:400,:)];
sample = [resps1(401:500,:); resps2(401:500,:)];
group = [repmat(-0.1,[400,1]); repmat(0.1,[400,1])];

[output,err] = classify(sample, training, group);

end



%% function rsample()
function [responses] = rsample(tuning, tun_curves, range)
%creates 500 poissrnd samples for each of the 100 neurons in tun_curves
%returns 500x100 matrix 'responses'

k1 = find(abs(range-tuning) < 0.001); % k is location of deg value
responses = zeros(500,100);

for n=1:500
    responses(n,:) = poissrnd(tun_curves(:,k1))';
end

end 



%% function neuron()
function [rate] = neuron(tuning)
%creates a tuning for a single model neuron
%tuning should be a range between (-2 and +2), 0.01 deg spaces 

%params
sigma = 0.157;

x = -2:0.01:+2;
y = normpdf(x,tuning,sigma);

shift = 45/max(y);
newy = y .* shift; %correct for max response
newy = newy + 5;

%% return the rate at the test stimulus depth (deg)
% k = find(abs(x-test) < 0.001); % k is location of deg value
% rate = newy(k);

%% return the entire tuning curve at all possible values
rate = newy;

%% Ploting
%plot(x,y);
%plot(x,newy);
%hold on;
end