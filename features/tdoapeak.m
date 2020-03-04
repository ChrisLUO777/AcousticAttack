function tdoa=tdoapeak(y,Fs,name,number)
    peak1=find(y == max(y(:,1)),1); %locate the first peak
    peak2=find(y == max(y(:,2)),1)-size(y,1);   %locate the first peak
    tdoa=(peak1-peak2)/Fs;
    save(".\G"+name+"\G"+name+number+"tdoapeak.mat",'tdoa');
end