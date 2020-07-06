close all; clear;
letter=0;
for key= ['a':'p','r':'z']
    key=strcat('Q',key);
    path=".\Inter_Key Timing\";
    [y,Fs] = audioread(path+key+".wav");
    % mkdir(path+"splitsp\"+key);
    y=bandpass(y,[1000 3000],Fs);
    % plot(y(:,1));
    [A,clicks]=matchclick(y);
    realclick=zeros(100,1);
%     plot(A(:,1));hold on;plot(A(:,2));
    count=1;
    templeftpeak=-Inf;
    for left=1:100
        if clicks(left,1)~=0 && (clicks(left,1)-templeftpeak)>0.3*Fs
            for right=1:100
                if clicks(left,1)-clicks(right,2)<0.07*Fs && clicks(left,1)-clicks(right,2)>-0.07*Fs %match left and right peaks
                        realclick(count,1)=ceil((clicks(left,1)+clicks(right,2))/2);
                        count=count+1;
                        templeftpeak=clicks(right,2);
%                         plot(clicks(left,1),0,'ro');
                        clicks(left,1)
                        clicks(right,2)
                    break;
                end
            end
        end
    end
    for timeidx=1:10
        timingrec{letter*10+timeidx,1}=(realclick(timeidx*2,1)-realclick(timeidx*2-1,1))/Fs;
        timingrec{letter*10+timeidx,2}=key;
        timingrec{letter*10+timeidx,3}=strcat(key,int2str(timeidx));
    end
    letter=letter+1;
end
smptitle={'timing' 'letter' 'smplID'};
samples=[smptitle;timingrec];
save(".\interKeyTiming_v0.1.mat",'samples');
filename = 'interKeyTiming_v0.1.csv';    %must end in csv
writetable( cell2table(samples), filename, 'writevariablenames', false, 'quotestrings', false);
