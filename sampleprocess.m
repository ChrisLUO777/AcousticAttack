close all; clear;
key="I";
% [y,Fs] = audioread(".\single key samples\wav\"+key+".wav");
[y,Fs] = audioread(".\single key samples\All direction Clicks v0.1\"+key+".wav");
% [y,Fs] = audioread("E:\MATLABprogram\AcousticAttack\sound source\"+key+".wav");
% mkdir("E:\MATLABprogram\AcousticAttack\single key samples\splitsp\G"+key);
mkdir(".\single key samples\All direction Clicks v0.1\splitsp\"+key);
y=bandpass(y,[1000 1500],Fs);
% plot(y(:,1));
[A,clicks]=matchclick(y);
plot(A(:,1));hold on;plot(A(:,2));
count=1;
templeftpeak=-Inf;
for left=1:100
    if clicks(left,1)~=0 && (clicks(left,1)-templeftpeak)>0.3*Fs
        for right=1:100
            if clicks(left,1)-clicks(right,2)<0.07*Fs && clicks(left,1)-clicks(right,2)>-0.07*Fs %match left and right peaks
                if clicks(left,1)<clicks(right,2)
                    audiowrite(".\single key samples\All direction Clicks v0.1\splitsp\"+key+"\"+key+count+".wav",...
                    y(clicks(left,1)-0.02*Fs:clicks(right,2)+0.18*Fs,:),Fs);

                    count=count+1;
                    templeftpeak=clicks(right,2);
                    plot(clicks(left,1),0,'ro');
                    clicks(left,1)
                    clicks(right,2)
                else
                    audiowrite(".\single key samples\All direction Clicks v0.1\splitsp\"+key+"\"+key+count+".wav",...
                    y(clicks(left,1)-0.02*Fs:clicks(right,2)+0.18*Fs,:),Fs);

                    count=count+1;
                    templeftpeak=clicks(left,1);
                    plot(clicks(left,1),0,'ro');
                    clicks(left,1)
                    clicks(right,2)
                end
                break;
            end
        end
    end
end