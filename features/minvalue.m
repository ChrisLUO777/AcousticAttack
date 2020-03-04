function minvalue=minvalue(y,~,name,number,valuename)
    minvalue(1,1) = min(y(:,1));
    minvalue(1,2) = min(y(:,2));
    save(".\G"+name+"\G"+name+number+valuename+"min.mat",'minvalue');
end