close all; clear;
[y,Fs] = audioread('E:\MATLABprogram\AcousticAttack\single key samples\wav\A.wav');
y=bandpass(y,[650 1500],Fs);
peaks=hitpeak(y,0.0002);
y1=y(peaks(1,1)-882:peaks(2,2)+7938,:);
signal=y1(1:5000,:);
noise=y1(5001:8993,:);
sum(signal(:,1).^2)/sum(noise(:,1).^2)
%snr(signal,noise);
%plot(y1(:,1));

% L=size(signal,1);
% t=fft(signal(:,1));
% P2 = abs(t/L);
% P1 = P2(1:L/2+1);
% P1(2:end-1) = 2*P1(2:end-1);
% f = Fs*(0:(L/2))/L;
% plot(f,P1);

% ratio=1;
% high=100;
% for hightemp=1600:100:20000
%     ytemp=bandpass(y,[1500 hightemp],Fs);
%     ratiotemp=(ytemp(26820,1).^2)/(ytemp(59920,1).^2);
%     if ratiotemp>ratio
%         high=hightemp;
%         ratio=ratiotemp;
%     end
% end
