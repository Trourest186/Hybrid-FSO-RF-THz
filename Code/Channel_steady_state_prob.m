%Steady-state probabilities for channel states
function channel_prob = Channel_steady_state_prob(state_thres,m,SNR_av)
N_chan = length(state_thres)-1; %number of channel-state
channel_prob = zeros(1,N_chan);
for i = 1:1:N_chan
   channel_prob(i) = gammainc(m*10^(state_thres(i)/10)/SNR_av,m,'upper') - gammainc(m*10^(state_thres(i+1)/10)/SNR_av,m,'upper');
end
end
