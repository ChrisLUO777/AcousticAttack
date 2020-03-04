close all; clear;
[y,fs] = audioread('E:\MATLABprogram\AcousticAttack\single key samples\splitsp\GA\GA3.wav');
% Fast Fourier Transformation
y_fft = fft(y);
 %Fundamental Frequency
[maxValue, indexOfMaxValue] = max(y);

%spectral flux in F-Domain  (of Melspectrogram)
[s,cf,t] = melSpectrogram(y,fs);

flux = spectralFlux(y,fs);
%spectral centroid 
centroid = spectralCentroid(y,fs);