function meanvalue=meanvalue(y,~,name,number,valuename)
    meanvalue(1,1) = mean(y(:,1));
    meanvalue(1,2) = mean(y(:,2));
    save(".\G"+name+"\G"+name+number+valuename+"meanvalue.mat",'meanvalue');
end