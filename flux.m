function flux=flux(y,Fs,name,number)
    tempflux = spectralFlux(y,Fs);
    flux(1,1)=sum(tempflux(:,1));
    flux(1,2)=std(tempflux(:,1));
    flux(1,3)=sum(tempflux(:,2));
    flux(1,4)=std(tempflux(:,2));
    save(".\features\G"+name+"\G"+name+number+"flux.mat",'flux');
end