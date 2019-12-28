tic;
for n=1:100
    % for randomly (evenly) distributed
    %r = floor(rand()*401)+1;
    %range = [-2:0.01:2];
    %neuron(range(r));
    
    %for purely uniform distribution
    testx=[-2:0.04:1.96];
    neuron(testx(n))
end


title('Tuning curve');
xlabel('Deg (depth)');
ylabel('Response (spikes/sec)');

toc;


function [rate] = neuron(tuning)

%tuning should be a range between (-2 and +2), 0.01 deg spaces 

%params
sigma = 0.157;

x = [-2:0.01:+2];
y = normpdf(x,tuning,sigma);

shift = 45/max(y);
newy = y .* shift; %correct for max response
newy = newy + 5;

%% Ploting
%plot(x,y);
plot(x,newy);
hold on;


end 