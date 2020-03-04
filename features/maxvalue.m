function maxvalue=maxvalue(y,~,name,number,valuename)
    maxvalue(1,1) = max(y(:,1));
    maxvalue(1,2) = max(y(:,2));
    save(".\G"+name+"\G"+name+number+valuename+"max.mat",'maxvalue');
end