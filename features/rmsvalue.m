function rmsvalue=rmsvalue(y,~,name,number,valuename)
    rmsvalue(1,1) = rms(y(:,1));
    rmsvalue(1,2) = rms(y(:,2));
    save(".\G"+name+"\G"+name+number+valuename+"rms.mat",'rmsvalue');
end