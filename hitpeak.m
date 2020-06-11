function [energylevel,hitpeaks] = hitpeak(y,thresholdl,thresholdr)
Fs=44100;
A=zeros(size(y,1)-11,2);
hitpeaks=zeros(100,2);
count1=1;
count2=1;
for t=1:size(y,1)-11
    for i=1:10
        A(t,1)=A(t,1)+y(t+i,1).^2;
        A(t,2)=A(t,2)+y(t+i,2).^2;
    end
end
energylevel=A;
% plot(A(:,1));hold on;plot(A(:,2));
% [thresholdl,thresholdr]=OtsuThresh(A);
for t=1:size(A,1)-0.18*Fs
    if A(t,1)>thresholdl
        for n=-0.02*Fs:0.18*Fs    %W=200ms
            if A(t,1)<A(t+n,1)
                break;
            end
        end
        if n==0.18*Fs
            hitpeaks(count1,1)=t;
            count1=count1+1;
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
            hitpeaks(count2,2)=t;
            count2=count2+1;
            t=t+0.18*Fs;
        end
    end
end