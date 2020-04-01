close all; clear;
[y1,~] = audioread("E:\MATLABprogram\KEMAR\VRsample\Google\48kletters\wav\E.wav");
[y2,Fs] = audioread("E:\MATLABprogram\KEMAR\VRsample\Google\48kletters\wav\Z.wav");
y=[y1;y2];
y=bandpass(y,[1000 1500],Fs);

A=zeros(size(y,1)-11,2);
hitpeaks=zeros(20,2);
count1=1;
count2=1;
for t=1:size(y,1)-11
    for i=1:10
        A(t,1)=A(t,1)+y(t+i,1).^2;
        A(t,2)=A(t,2)+y(t+i,2).^2;
    end
end

peakl=A(1:100:end,1);
peakr=A(1:100:end,2); 
histl=tabulate(peakl);
histr=tabulate(peakr);
gdiffl=zeros(size(histl,1),2);
gdiffr=zeros(size(histr,1),2);
ul=sum(peakl)/size(peakl,1);
ur=sum(peakr)/size(peakr,1);
    for i=1:size(histl,1)
        gdiffl(i,1)=histl(i,1);
        w0l=sum(histl(1:i,2))/size(peakl,1);
        w1l=sum(histl(i+1:end,2))/size(peakr,1);
        u0l=sum(histl(1:i,1).*histl(1:i,2))/sum(histl(1:i,2));
        u1l=sum(histl(i+1:end,1).*histl(i+1:end,2))/sum(histl(i+1:end,2));
        gdiffl(i,2)=w0l*(u0l-ul)^2+w1l*(u1l-ul)^2;
    end
    [~,I]=max(gdiffl(:,2));
    thresholdl=gdiffl(I,1);
    for j=1:size(histr,1)
        gdiffr(j,1)=histr(j,1);
        w0r=sum(histr(1:j,2))/size(peakl,1);
        w1r=sum(histr(j+1:end,2))/size(peakr,1);
        u0r=sum(histr(1:j,1).*histr(1:j,2))/sum(histr(1:j,2));
        u1r=sum(histr(j+1:end,1).*histr(j+1:end,2))/sum(histr(j+1:end,2));
        gdiffr(j,2)=w0r*(u0r-ur)^2+w1r*(u1r-ur)^2;
    end
[~,I]=max(gdiffr(:,2));
thresholdr=gdiffr(I,1);
    
subplot(2,1,1)
plot(A(:,1));
hold on;
yline(thresholdl);
subplot(2,1,2)
plot(A(:,2));
hold on;
yline(thresholdr);