function stdvalue=stdvalue(y,~,name,number,valuename)
    stdvalue(1,1) = std(y(:,1));
    stdvalue(1,2) = std(y(:,2));
    save(".\G"+name+"\G"+name+number+valuename+"std.mat",'stdvalue');
end