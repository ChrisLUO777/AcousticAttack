close all; clear;
key="Z";
[y,Fs] = audioread("E:\MATLABprogram\KEMAR\VRsample\Google\48kletters\wav\"+key+".wav");
yfilter=bandpass(y,[1000 1500],Fs);
thl=0.001;
thr=0.001;
[energylevel,peaks]=hitpeak(yfilter,thl,thr);
matchedpeak=zeros(20,2);
count=1;
templeftpeak=-Inf;
for left=1:20
    if peaks(left,1)~=0 && (peaks(left,1)-templeftpeak)>0.18*Fs
        for right=1:20
            if peaks(left,1)-peaks(right,2)<0.05*Fs && peaks(left,1)-peaks(right,2)>-0.05*Fs %match left and right peaks
                matchedpeak(count,1)=peaks(left,1);
                matchedpeak(count,2)=peaks(right,2);
                count=count+1;
                thl=max(energylevel(peaks(left,1)-0.02*Fs:peaks(left,1)+0.18*Fs));
                thr=max(energylevel(peaks(right,2)-0.02*Fs:peaks(right,2)+0.18*Fs));
                if peaks(left,1)<peaks(right,2)
                    templeftpeak=peaks(right,2);
%                     peaks(left,1)
%                     peaks(right,2)
                else
                    templeftpeak=peaks(left,1);
%                     peaks(left,1)
%                     peaks(right,2)
                end
                break;
            end
        end
    end
end
% while ~isequal(matchedpeak,peaks)
%     unmatch=setdiff(peaks,matchedpeak);
% end

matchedpeak=nonzeros(matchedpeak);
matchedpeak=reshape(matchedpeak,count-1,2);
subplot(3,2,1)
plot(y(:,1));
hold on;
for i=matchedpeak
    plot(i,0,'ro');
end
subplot(3,2,2)
plot(y(:,2));
hold on;
for i=matchedpeak
    plot(i,0,'ro');
end
subplot(3,2,3)
plot(yfilter(:,1));
hold on;
for i=matchedpeak
    plot(i,0,'ro');
end
subplot(3,2,4)
plot(yfilter(:,2));
hold on;
for i=matchedpeak
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