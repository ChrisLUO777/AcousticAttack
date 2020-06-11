close all; clear;

% [y,Fs] = audioread('E:\MATLABprogram\AcousticAttack\single key samples\wav\P.wav');
[y,Fs] = audioread('.\single key samples\All direction Clicks v0.1\A.wav');

yfilter=bandstop(y,[80 250],Fs);
yfilter=bandstop(yfilter,[800 900],Fs);
%%
%freq domain
% noisestart=46780;
% noiseend=69710;
% L=noiseend-noisestart;
% t=fft(y(noisestart:noiseend,1));
% P2 = abs(t/L);
% P1 = P2(1:L/2+1);
% P1(2:end-1) = 2*P1(2:end-1);
% f = Fs*(0:(L/2))/L;
% figure;subplot(2,1,1);plot(f,P1);
% 
% clickstart=24920;
% clickend=35700;
% L=clickend-clickstart;
% t=fft(y(clickstart:clickend,1));
% P2 = abs(t/L);
% P1 = P2(1:L/2+1);
% P1(2:end-1) = 2*P1(2:end-1);
% f = Fs*(0:(L/2))/L;
% subplot(2,1,2);plot(f,P1);
%%
%time domain
figure; subplot(2,1,1);plot(y(:,1));
subplot(2,1,2);plot(y(:,2));

figure; subplot(2,1,1);plot(yfilter(:,1));
subplot(2,1,2);plot(yfilter(:,2));
% ylim([-0.08 0.08]);
%sound(y,Fs);