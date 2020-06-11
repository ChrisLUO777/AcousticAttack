function energyvalue=energyvalue(y,~,name,number,valuename)
    xfft1=fft(y(:,1));
    xfft2=fft(y(:,2));
    energyvalue(1,1)=sum(2.*xfft1)/size(xfft1,1);
    energyvalue(1,2)=sum(2.*xfft2)/size(xfft2,1);
    save(".\G"+name+"\G"+name+number+valuename+"energyvalue.mat",'energyvalue');
end