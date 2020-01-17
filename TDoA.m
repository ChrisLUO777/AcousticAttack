close all; clear;
[y,Fs] = audioread("E:\MATLABprogram\AcousticAttack\single key samples\splitsp\GP\GP10.wav");
%plot(y(:,1));
%hold on;
%plot(y(:,2));
sig=y(:,1);
refsig=y(:,2);
gccphat(sig,refsig,Fs);