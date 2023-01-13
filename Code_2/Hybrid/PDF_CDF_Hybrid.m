function [PDF, CDF] = PDF_CDF_Hybrid(L, thres)
[PDF_Thz1, CDF_Thz1] = PDF_Thz(L, thres);
[PDF_FSO1, CDF_FSO1] = PDF_FSO(L, thres);
% SNR _sw
SNR_sw = 10^(8/10);
[PDF_FSO_sw, CDF_FSO_sw] = PDF_CDF_FSO(L, SNR_sw);

if thres < SNR_sw
    PDF = PDF_FSO1*CDF_Thz1 + PDF_Thz1*CDF_FSO1;
    CDF = CDF_Thz1*CDF_FSO1;
else
    PDF = PDF_FSO1 + CDF_FSO_sw*PDF_Thz1;
    CDF = CDF_FSO1 - CDF_FSO_sw*(1-CDF_Thz1);
end
end

