function [thresholdl,thresholdr] = OtsuThresh(y)
    peakl=y(1:100:end,1);
    peakr=y(1:100:end,2);
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
end