close all; clear;
key="M";
% [y,Fs] = audioread("E:\MATLABprogram\AcousticAttack\sound source\wav_5 clicks\"+key+".wav");
[y,Fs] = audioread("E:\MATLABprogram\KEMAR\VRsample\Google\48kletters\wav\"+key+".wav");
% yfilter=y;
yfilter=bandpass(y,[1000 1500],Fs);
% yfilter=highpass(y,1500,Fs);
[thl,thr,energylevel,peaks]=hitpeak(yfilter);
clickseg=[];
count=1;
templeftpeak=-Inf;
for left=1:20
    if peaks(left,1)~=0 && (peaks(left,1)-templeftpeak)>0.18*Fs
        for right=1:20
            if peaks(left,1)-peaks(right,2)<0.05*Fs && peaks(left,1)-peaks(right,2)>-0.05*Fs %match left and right peaks
                if peaks(left,1)<peaks(right,2)
%                     y(peaks(left,1)-0.02*Fs:peaks(right,2)+0.18*Fs,:);
                    clickseg=[clickseg peaks(left,1)-0.02*Fs peaks(right,2)+0.18*Fs];
                    count=count+1;
                    templeftpeak=peaks(right,2);
                    peaks(left,1)
                    peaks(right,2)
                else
%                     y(peaks(right,2)-0.02*Fs:peaks(left,1)+0.18*Fs,:);
                    clickseg=[clickseg peaks(right,2)-0.02*Fs peaks(left,1)+0.18*Fs];
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
subplot(3,2,1)
plot(y(:,1));
hold on;
for i=clickseg
    plot(i,0,'ro');
end
subplot(3,2,2)
plot(y(:,2));
hold on;
for i=clickseg
    plot(i,0,'ro');
end
subplot(3,2,3)
plot(yfilter(:,1));
hold on;
for i=clickseg
    plot(i,0,'ro');
end
subplot(3,2,4)
plot(yfilter(:,2));
hold on;
for i=clickseg
    plot(i,0,'ro');
end
subplot(3,2,5)
plot(energylevel(:,1));
hold on;
yline(thl);
subplot(3,2,6)
plot(energylevel(:,2));
hold on;
yline(thr);