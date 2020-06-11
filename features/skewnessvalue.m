function skewnessvalue=skewnessvalue(y,~,name,number,valuename)
    skewnessvalue(1,1) = skewness(y(:,1));
    skewnessvalue(1,2) = skewness(y(:,2));
    save(".\G"+name+"\G"+name+number+valuename+"skewnessvalue.mat",'skewnessvalue');
end