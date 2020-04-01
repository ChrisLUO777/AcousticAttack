close all; clear;
[y1,~] = audioread("E:\MATLABprogram\KEMAR\VRsample\Google\48kletters\wav\E.wav");
[y2,Fs] = audioread("E:\MATLABprogram\KEMAR\VRsample\Google\48kletters\wav\Z.wav");
y=[y1;y2];
y=bandpass(y,[1000 1500],Fs);

A=zeros(size(y,1)-11,2);
hitpeaks=zeros(20,2);
matchclick=[];
matchcount=1;
templeftpeak=-Inf;
peakcountl=1;
peakcountr=1;
for t=1:size(y,1)-11
    for i=1:10
        A(t,1)=A(t,1)+y(t+i,1).^2;
        A(t,2)=A(t,2)+y(t+i,2).^2;
    end
end

thresholdl=0.0045;
thresholdr=0.0046;

for t=1:size(A,1)-0.18*Fs
    if A(t,1)>thresholdl
        for n=-0.02*Fs:0.18*Fs    %W=200ms
            if A(t,1)<A(t+n,1)
                break;
            end
        end
        if n==0.18*Fs
            hitpeaks(peakcountl,1)=t;
            peakcountl=peakcountl+1;
            t=t+0.18*Fs;
        end
    end
end
for t=1:size(A,1)-0.18*Fs
    if A(t,2)>thresholdr
        for n=-0.02*Fs:0.18*Fs    %W
            if A(t,2)<A(t+n,2)
                break;
            end
        end
        if n==0.18*Fs
            hitpeaks(peakcountr,2)=t;
            peakcountr=peakcountr+1;
            t=t+0.18*Fs;
        end
    end
end

for left=1:size(hitpeaks,1)
    if hitpeaks(left,1)~=0 && (hitpeaks(left,1)-templeftpeak)>0.18*Fs
        for right=1:size(hitpeaks,1)
            if hitpeaks(left,1)-hitpeaks(right,2)<0.05*Fs && hitpeaks(left,1)-hitpeaks(right,2)>-0.05*Fs %match left and right peaks
                if hitpeaks(left,1)<hitpeaks(right,2)
                    matchclick=[matchclick; hitpeaks(left,1) hitpeaks(right,2)];
                    matchcount=matchcount+1;
                    templeftpeak=hitpeaks(right,2);
                    hitpeaks(left,1)
                    hitpeaks(right,2)
                else
                    matchclick=[matchclick; hitpeaks(left,1) hitpeaks(right,2)];
                    matchcount=matchcount+1;
                    templeftpeak=hitpeaks(left,1);
                    hitpeaks(left,1)
                    hitpeaks(right,2)
                end
                break;
            end
        end
    end
end

subplot(2,1,1)
plot(A(:,1));
hold on;
yline(thresholdl);
subplot(2,1,2)
plot(A(:,2));
hold on;
yline(thresholdr);