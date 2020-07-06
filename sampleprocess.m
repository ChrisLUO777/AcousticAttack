close all; clear;
key="I";
path=".\single key samples\All direction Clicks v0.1\";
[y,Fs] = audioread(path+key+".wav");

mkdir(path+"splitsp\"+key);
y=bandpass(y,[1000 3000],Fs);
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
                    audiowrite(path+"splitsp\"+key+"\"+key+count+".wav",...
                    y(clicks(left,1)-0.02*Fs:clicks(right,2)+0.18*Fs,:),Fs);

                    count=count+1;
                    templeftpeak=clicks(right,2);
                    plot(clicks(left,1),0,'ro');
                    clicks(left,1)
                    clicks(right,2)
                else
                    audiowrite(path+"splitsp\"+key+"\"+key+count+".wav",...
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