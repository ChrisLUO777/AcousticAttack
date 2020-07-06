clc
close all
key = ".\single key samples\All direction Clicks v0.1\splitsp\A\A";

%files = dir('*.wav');
 %count = 1;
%  for i = 1:20
 i = 1;
 filename = strcat(key,num2str(i));
 [y,fs] = audioread(filename +".wav");
 %y = y1(:,1);

%plot(y)
%Fs = sample_rate;                                       % Sampling Frequency (Hz)
Fn = fs/2;                                              % Nyquist Frequency (Hz)
Wp = 2000/Fn;                                           % Passband Frequency (Normalised)
Ws = 3000/Fn;                                           % Stopband Frequency (Normalised)
Rp =  1;                                               % Passband Ripple (dB)
Rs = 150;                                               % Stopband Ripple (dB)
%signal = medfilt1(sample_data,90);

[n,Ws] = cheb2ord(Wp,Ws,Rp,Rs);                         % Filter Order
[z,p,k] = cheby2(n,Rs,Ws,'low');                        % Filter Design
[soslp,glp] = zp2sos(z,p,k);                            % Convert To Second-Order-Section For Stability

%figure(3)
%freqz(soslp, 2^16, fs)                                  % Filter Bode Plot

filtered_sound = filtfilt(soslp, glp, y);

N = ceil(96000*(length(filtered_sound)/44100));
upsmpl_sound = interpft(filtered_sound,N);

norm_sound=mat2gray(upsmpl_sound);

% sound(filtered_sound, fs);

f_filename = strcat(filename, 'f');
f_filename = f_filename +".wav";
% audiowrite(f_filename,filtered_sound,fs);
subplot(2,1,1);
plot(y);
title('Raw sound');

subplot(2,1,2);
plot(norm_sound);
title('Filtered & upsampled sound');
%  end
 

% nf=1024; %number of point in DTFT
% Y = fft(y,nf);
% f = fs/2*linspace(0,1,nf/2+1);
% plot(f,abs(Y(1:nf/2+1)));

% NFFT = length(y);
% Y = fft(y,NFFT);
% F = ((0:1/NFFT:1-1/NFFT)*Fs).';
% 
% magnitudeY = abs(Y);        % Magnitude of the FFT
% phaseY = unwrap(angle(Y));  % Phase of the FFT
% 
% helperFrequencyAnalysisPlot1(F,magnitudeY,phaseY,NFFT)