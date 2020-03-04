function kurtosisvalue=kurtosisvalue(y,~,name,number,valuename)
    kurtosisvalue(1,1) = kurtosis(y(:,1));
    kurtosisvalue(1,2) = kurtosis(y(:,2));
    save(".\G"+name+"\G"+name+number+valuename+"kurtosis.mat",'kurtosisvalue');
end