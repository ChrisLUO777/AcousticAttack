clear;close all
for key = ('A':'Z')
    readpath=".\single key samples\letters v0.2\splitsp\"+key ;
    savepath = ".\single key samples\letters v0.2\filtered wavelet splitsp\"+key ;
    mkdir(savepath);
     for i = 1:20
        [y,fs] = audioread(readpath+"\"+key+i+".wav");

        Fn = fs/2;                                              % Nyquist Frequency (Hz)
        Wp = 2000/Fn;                                           % Passband Frequency (Normalised)
        Ws = 3000/Fn;                                           % Stopband Frequency (Normalised)
        Rp =  1;                                               % Passband Ripple (dB)
        Rs = 150;                                               % Stopband Ripple (dB)

        [n,Ws] = cheb2ord(Wp,Ws,Rp,Rs);                         % Filter Order
        [z,p,k] = cheby2(n,Rs,Ws,'low');                        % Filter Design
        [soslp,glp] = zp2sos(z,p,k);                            % Convert To Second-Order-Section For Stability

        filtered_sound = filtfilt(soslp, glp, y);
        newfs=96000;
        N = ceil(newfs*(length(filtered_sound)/fs));
        upsmpl_sound = interpft(filtered_sound,N);
%         norm_sound=mat2gray(upsmpl_sound);
        
        audiowrite(savepath+"\"+key+i+".wav",upsmpl_sound,newfs);

     end
end