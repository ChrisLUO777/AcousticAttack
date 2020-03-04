function zcrvalue=zcrvalue(y,~,name,number,valuename)
    zcrvalue(1,1) = sum(abs(diff(y(:,1)>0)))/length(y(:,1));
    zcrvalue(1,2) = sum(abs(diff(y(:,2)>0)))/length(y(:,2));
    save(".\G"+name+"\G"+name+number+valuename+"zcr.mat",'zcrvalue');
end