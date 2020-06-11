function iqrvalue=iqrvalue(y,~,name,number,valuename)
    iqrvalue(1,1) = iqr(y(:,1));
    iqrvalue(1,2) = iqr(y(:,2));
    save(".\G"+name+"\G"+name+number+valuename+"iqrvalue.mat",'iqrvalue');
end