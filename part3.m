%% parameters
% tic;
% 
% mat = zeros(100,401);
% range = -2:0.01:2;
% 
% %% create neurons
% for n=1:100
%     %% for random (even) distribution
%     r = floor(rand()*401)+1;
%     mat(n,:) = neuron(range(r));
%     
%     %% for purely uniform distribution
%     %testx=[-2:0.04:1.96];
%     %neuron(testx(n))
% end
% 
% % title('Tuning curve');
% % xlabel('Deg (depth)');
% % ylabel('Response (spikes/sec)');
% 
% %% plot/find tunings
% toc;

tuning = -0.1;
k1 = find(abs(range-tuning) < 0.001); % k is location of deg value
pop_resp1 = poissrnd(mat(:,k1));

tuning = 0.1;
k2 = find(abs(range-tuning) < 0.001); % k is location of deg value
pop_resp2 = poissrnd(mat(:,k2));

%% plotting
bar(pop_resp1)
hold on
bar(pop_resp2)

title('Population Response at -0.1 & +0.1 Deg');
xlabel('Neuron Number (1-100)')
ylabel('Neuron Response (spikes / second)')

%% generate one neuron with specific tuning
function [rate] = neuron(tuning)

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