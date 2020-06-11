function corrvalue=corrvalue(y,~,name,number,valuename)
    corrmatrix=corrcoef(y(:,1),y(:,2));
    corrvalue = corrmatrix(1,2);
    save(".\G"+name+"\G"+name+number+valuename+"corrvalue.mat",'corrvalue');
end