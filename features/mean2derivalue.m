function mean2derivalue=mean2derivalue(y,~,name,number,valuename)
    mean2derivalue(1,1) = mean(diff(diff(y(:,1))));
    mean2derivalue(1,2) = mean(diff(diff(y(:,2))));
    save(".\G"+name+"\G"+name+number+valuename+"mean2deri.mat",'mean2derivalue');
end