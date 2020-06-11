function varvalue=varvalue(y,~,name,number,valuename)
    varvalue(1,1) = var(y(:,1));
    varvalue(1,2) = var(y(:,2));
    save(".\G"+name+"\G"+name+number+valuename+"varvalue.mat",'varvalue');
end