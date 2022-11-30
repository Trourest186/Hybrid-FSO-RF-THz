%Steady-state probabilities for channel states
function channel_prob = Channel_steady_state_prob(state_thres,SNR_av,n_factor,alpha,beta)
N_chan = length(state_thres)-1; %number of channel-state
channel_prob = zeros(1,N_chan);
thres = 10.^(state_thres/10);
for i = 1:1:N_chan
    channel_prob(i) = max(0,CDF_func1(alpha,beta,thres(i+1),SNR_av,n_factor) - CDF_func1(alpha,beta,thres(i),SNR_av,n_factor));
end
end
