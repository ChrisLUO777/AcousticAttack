close all; clear;
[y,Fs] = audioread("E:\MATLABprogram\AcousticAttack\single key samples\wav\A.wav");
y=bandpass(y,[1000 1200],Fs);
A=zeros(size(y,1)-11,2);
hitpeaks=zeros(500,2);
count1=1;
count2=1;
for t=1:size(y,1)-11
    for i=1:10
        A(t,1)=A(t,1)+y(t+i,1).^2;
        A(t,2)=A(t,2)+y(t+i,2).^2;
    end
end
for t=1:size(y,1)-7938
    if A(t,1)>0.00036
        for n=-882:7938    %W=200ms
            if A(t,1)<A(t+n,1)
                break;
            end
        end
        if n==7938
            hitpeaks(count1,1)=t;
            count1=count1+1;
            t=t+7938;
        end
    end
end
for t=1:size(y,1)-7938
    if A(t,2)>0.00036
        for n=-882:7938    %W
            if A(t,2)<A(t+n,2)
                break;
            end
        end
        if n==7938
            hitpeaks(count2,2)=t;
            count2=count2+1;
            t=t+7938;
        end
    end
end