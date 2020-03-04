close all; clear;
%[y,Fs] = audioread('E:\MATLABprogram\KEMAR\VRsample\Google\Gs1.wav');
[y,Fs] = audioread('E:\MATLABprogram\AcousticAttack\single key samples\wav\P.wav');
%[y,Fs] = audioread('E:\MATLABprogram\AcousticAttack\single key samples\wav\ChangingVoice1.wav');
y=bandpass(y,[1000 1500],Fs);
%%
%freq domain

%L=88064;

% L=624640;

% L=693248;
% t=fft(y(:,1));
% P2 = abs(t/L);
% P1 = P2(1:L/2+1);
% P1(2:end-1) = 2*P1(2:end-1);
% f = Fs*(0:(L/2))/L;
% plot(f,P1);
%plot(f(1,1:11008),P1(1:11008,1));
%%
%time domain

plot(y(:,1));
hold on;
plot(y(:,2));
ylim([-0.08 0.08]);

%sound(y,Fs);