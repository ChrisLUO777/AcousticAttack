function centroid=centroid(y,Fs,name,number)
    tempcentroid = spectralCentroid(y,Fs);
    centroid(1,1)=sum(tempcentroid(:,1));
    centroid(1,2)=std(tempcentroid(:,1));
    centroid(1,3)=sum(tempcentroid(:,2));
    centroid(1,4)=std(tempcentroid(:,2));
    save(".\G"+name+"\G"+name+number+"centroid.mat",'centroid');
end