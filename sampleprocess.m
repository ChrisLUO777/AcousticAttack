close all; clear;
key="K";
% [y,Fs] = audioread("E:\MATLABprogram\AcousticAttack\single key samples\wav\"+key+".wav");
[y,Fs] = audioread("E:\MATLABprogram\AcousticAttack\sound source\"+key+".wav");
%mkdir("E:\MATLABprogram\AcousticAttack\single key samples\splitsp\G"+key);
yfilter=bandpass(y,[1000 1500],Fs);
%plot(y(:,1));
peaks=hitpeak(yfilter);
count=1;
templeftpeak=-Inf;
for left=1:20
    if peaks(left,1)~=0 && (peaks(left,1)-templeftpeak)>0.18*Fs
        for right=1:20
            if peaks(left,1)-peaks(right,2)<0.02*Fs && peaks(left,1)-peaks(right,2)>-0.02*Fs %match left and right peaks
                if peaks(left,1)<peaks(right,2)
%                     audiowrite("E:\MATLABprogram\AcousticAttack\single key samples\splitsp\G"+key+"\G"+key+count+".wav",...
%                     y(peaks(left,1)-0.02*Fs:peaks(right,2)+0.18*Fs,:),Fs);
                    audiowrite("E:\MATLABprogram\AcousticAttack\sound source\"+key+count+".wav",...
                    y(peaks(left,1)-0.02*Fs:peaks(right,2)+0.18*Fs,:),Fs);
                    count=count+1;
                    templeftpeak=peaks(right,2);
                    peaks(left,1)
                    peaks(right,2)
                else
%                     audiowrite("E:\MATLABprogram\AcousticAttack\single key samples\splitsp\G"+key+"\G"+key+count+".wav",...
%                     y(peaks(right,2)-0.02*Fs:peaks(left,1)+0.18*Fs,:),Fs);
                    audiowrite("E:\MATLABprogram\AcousticAttack\sound source\"+key+count+".wav",...
                    y(peaks(right,2)-0.02*Fs:peaks(left,1)+0.18*Fs,:),Fs);
                    count=count+1;
                    templeftpeak=peaks(left,1);
                    peaks(left,1)
                    peaks(right,2)
                end
                break;
            end
        end
    end
end