function [rate] = neuron(tuning,test)

%tuning should be a range between (-2 and +2), 0.01 deg spaces 

%params
sigma = 0.157;

x = -2:.01:2;
y = normpdf(x,tuning,sigma);

shift = 45/max(y);
newy = y .* shift; %correct for max response
newy = newy + 5;

k = find(abs(x-test) < 0.001); % k is location of deg value

rate = newy(k);




%% Ploting
%plot(x,y);
%plot(x,newy);
%title('Tuning curve');
%xlabel('Deg (depth)');
%ylabel('Response (spikes/sec)');


end 