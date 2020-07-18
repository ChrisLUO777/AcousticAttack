close all; clear;
% subname=('A':'I');
subname=('A':'Z');
for name=subname
    path="..\single key samples\letters v0.2\filtered wavelet splitsp";
    mkdir(".\G"+name);
    for i=1:20
        [y,Fs] = audioread(".\"+path+"\"+name+"\"+name+i+".wav");
        %IQR
        iqrvalue(y,Fs,name,i,"acoustic");
        %skew
        skewnessvalue(y,Fs,name,i,"acoustic");
        %kurt
        kurtosisvalue(y,Fs,name,i,"acoustic");
        %corr
        corrvalue(y,Fs,name,i,"acoustic");
        %energy
        energyvalue(y,Fs,name,i,"acoustic");
        %spectral density
        SEvalue(y,Fs,name,i,"acoustic");
        %mean
        meanvalue(y,Fs,name,i,"acoustic");
        %median
        medianvalue(y,Fs,name,i,"acoustic");
        %std
        stdvalue(y,Fs,name,i,"acoustic");
        %var
        varvalue(y,Fs,name,i,"acoustic");
        %mfcc
        mfccvalue(y,Fs,name,i,"acoustic");
    end
end

