function [PDF, CDF] = PDF_CDF_Hybrid1(L, thres)
[PDF_Thz, CDF_Thz] = PDF_Thz(L, thres)
[PDF_FSO, CDF_FSO] = PDF_FSO(L, thres);

SNR_sw = 10^(8/10);
% SNR_out = 10^(2/10);

if thres < SNR_sw
    PDF = PDF_FSO(L, thres)*CDF_Thz(L, thres) + PDF_Thz(L, thres)*CDF_FSO(L, thres);
    CDF = CDF_Thz(L, thres)*CDF_FSO(L, thres);
else
    PDF = PDF_FSO(L, thres) + CDF_FSO(L, SNR_sw)*PDF_Thz(L, thres);
    CDF = CDF_FSO(L, thres) - CDF_FSO(L, SNR_sw)*(1-CDF_Thz(L, thres));
end
end

