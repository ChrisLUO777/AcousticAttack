function SEvalue=SEvalue(y,Fs,name,number,valuename)
    SEvalue(1,1)=pentropy(y(:,1),Fs,'Instantaneous',false);
    SEvalue(1,2)=pentropy(y(:,2),Fs,'Instantaneous',false);
    save(".\G"+name+"\G"+name+number+valuename+"SEvalue.mat",'SEvalue');
end


