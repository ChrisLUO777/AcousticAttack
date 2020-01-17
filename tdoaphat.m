function tdoa=tdoaphat(y,Fs,name,number)
    sig=y(:,1);
    refsig=y(:,2);
    tdoa=gccphat(sig,refsig,Fs);
    save(".\features\G"+name+"\G"+name+number+"tdoaphat.mat",'tdoa');
end