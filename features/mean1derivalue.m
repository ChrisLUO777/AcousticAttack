function mean1derivalue=mean1derivalue(y,~,name,number,valuename)
    mean1derivalue(1,1) = mean(diff(y(:,1)));
    mean1derivalue(1,2) = mean(diff(y(:,2)));
    save(".\G"+name+"\G"+name+number+valuename+"mean1deri.mat",'mean1derivalue');
end