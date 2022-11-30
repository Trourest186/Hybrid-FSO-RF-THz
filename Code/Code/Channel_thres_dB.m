%Channel-state Modeling 
%Equal-duration method 
%SNR thresholds with unit in dB 
%Using bisection search method
function channel_state_thres = Channel_thres_dB(t_slot,hl,hp,B0,SNR_av,Rytov)
channel_state_thres = [];
%-----------------------------------------------------------------------%
SNR1_dB             = -10; %starting threshold (dB) 
SNR1                = 10^(SNR1_dB/10);
channel_state_thres = [channel_state_thres SNR1_dB];
func = @(x) (CDF_func(hl,hp,B0,SNR_av,Rytov,10.^(x./10))-CDF_func(hl,hp,B0,SNR_av,Rytov,SNR1))... 
./(level_crossing_rate(hl,hp,SNR_av,Rytov,B0,10.^(x./10)) + level_crossing_rate(hl,hp,SNR_av,Rytov,B0,SNR1)) - t_slot;
st  = SNR1_dB;
fi  = 40; %Maximum value in dB
tol = 1e-6;
N   = 20;
for i = 1:N
    tmp = 0.5*(st + fi);
    if(abs(fi - st) <= tol)
        break;
    else
        if(func(tmp)*func(st) < 0)
            fi = tmp;
        else
            st = tmp;
        end
    end
end
SNR2_dB = tmp;
channel_state_thres = [channel_state_thres SNR2_dB];
%-----------------------------------------------------------------------%
while abs(CDF_func(hl,hp,B0,SNR_av,Rytov,10^(SNR2_dB/10))-CDF_func(hl,hp,B0,SNR_av,Rytov,10^(SNR1_dB/10)))>=10^(-5) && abs(SNR2_dB-SNR1_dB)>10^(-4)
SNR1_dB = SNR2_dB;
SNR1    = 10^(SNR1_dB/10);
func    = @(x) (CDF_func(hl,hp,B0,SNR_av,Rytov,10.^(x./10))-CDF_func(hl,hp,B0,SNR_av,Rytov,SNR1))... 
./(level_crossing_rate(hl,hp,SNR_av,Rytov,B0,10.^(x./10)) + level_crossing_rate(hl,hp,SNR_av,Rytov,B0,SNR1)) - t_slot;
st  = SNR1_dB;
fi  = 40; %Maximum value in dB
tol = 1e-6;
N   = 20;
for i = 1:N
    tmp = 0.5*(st + fi);
    if(abs(fi - st) <= tol)
        break;
    else
        if(func(tmp)*func(st) < 0)
            fi = tmp;
        else
            st = tmp;
        end
    end
end
SNR2_dB = tmp;
%-----------------------------------------------------------------------%
channel_state_thres = [channel_state_thres SNR2_dB];
end
% channel_state_thres = channel_state_thres(1,1:length(channel_state_thres)-1);
channel_state_thres(length(channel_state_thres)) = 100;    
if length(channel_state_thres) == 2
    channel_state_thres = [channel_state_thres(1) 40 channel_state_thres(2)];
end

