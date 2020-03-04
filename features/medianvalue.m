function medianvalue=medianvalue(y,~,name,number,valuename)
    medianvalue(1,1) = median(y(:,1));
    medianvalue(1,2) = median(y(:,2));
    save(".\G"+name+"\G"+name+number+valuename+"median.mat",'medianvalue');
end