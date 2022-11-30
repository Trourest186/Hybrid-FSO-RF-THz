%Channel-state transition probabilities
function chan_trans_prob = channel_trans_prob(state_thres,SNR_av,m,T_burst,fd)
N_chan = length(state_thres)-1; %number of channel-state
trans_prob = zeros(N_chan,N_chan);
%+++++++++Prob_channel+++++++++++%
prob_chan = zeros(1,N_chan);
for i = 1:1:N_chan
   prob_chan(i) = gammainc(m*10^(state_thres(i)/10)/SNR_av,m,'upper') - gammainc(m*10^(state_thres(i+1)/10)/SNR_av,m,'upper');
end
%+++++++++++Trans_prob+++++++++++%
%state i->i+1
for i = 1:1:N_chan-1    
    if prob_chan(i)==0
        trans_prob(i,i+1) = 0;
    else
        trans_prob(i,i+1) = min(1,(1/prob_chan(i))*T_burst*level_crossing_rate(state_thres(i+1),m,SNR_av,fd));  
        if trans_prob(i,i+1) < 0 
            trans_prob(i,i+1) = 0;
        end
    end
end
%state i->i-1
for i = 2:1:N_chan
    if prob_chan(i)==0
        trans_prob(i,i-1) = 0;
    else
        trans_prob(i,i-1) = min(1,(1/prob_chan(i))*T_burst*level_crossing_rate(state_thres(i),m,SNR_av,fd));
        if trans_prob(i,i-1) < 0 
            trans_prob(i,i-1) = 0;
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
trans_prob(1,1) = max(0,1-trans_prob(1,2));
trans_prob(N_chan,N_chan) = max(0,1-trans_prob(N_chan,N_chan-1));
for i=2:1:N_chan-1
    trans_prob(i,i)=max(0,1-trans_prob(i,i+1)-trans_prob(i,i-1));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
chan_trans_prob = trans_prob;
if sum(chan_trans_prob(3,:)) > 1
    chan_trans_prob(3,2) = 1 - chan_trans_prob(3,4) - chan_trans_prob(3,3);
end
end

