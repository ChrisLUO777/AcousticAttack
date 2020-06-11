function mfccvalue=mfccvalue(y,fs,name,number,valuename)
    win = hann(1024,"periodic");
    SL = stft(y(:,1),"Window",win,"OverlapLength",512,"Centered",false);
    coeffsL = mfcc(SL,fs,"LogEnergy","Ignore");
    SR = stft(y(:,2),"Window",win,"OverlapLength",512,"Centered",false);
    coeffsR = mfcc(SR,fs,"LogEnergy","Ignore");
    %IQR
    mfccvalue(1,1) = iqr(coeffsL(:,12));
    mfccvalue(1,2) = iqr(coeffsR(:,12));
    mfccvalue(1,3) = iqr(coeffsL(:,13));
    mfccvalue(1,4) = iqr(coeffsR(:,13));
    %skewness
    mfccvalue(1,5) = skewness(coeffsL(:,12));
    mfccvalue(1,6) = skewness(coeffsR(:,12));
    mfccvalue(1,7) = skewness(coeffsL(:,13));
    mfccvalue(1,8) = skewness(coeffsR(:,13));
    %kurtosis
    mfccvalue(1,9) = kurtosis(coeffsL(:,12));
    mfccvalue(1,10) = kurtosis(coeffsR(:,12));
    mfccvalue(1,11) = kurtosis(coeffsL(:,13));
    mfccvalue(1,12) = kurtosis(coeffsR(:,13));
    %corr
    corrmatrix=corrcoef(coeffsL(:,12),coeffsR(:,12));
    mfccvalue(1,13) = corrmatrix(1,2);
    corrmatrix=corrcoef(coeffsL(:,13),coeffsR(:,13));
    mfccvalue(1,14) = corrmatrix(1,2);
    save(".\G"+name+"\G"+name+number+valuename+"mfccvalue.mat",'mfccvalue');
end

