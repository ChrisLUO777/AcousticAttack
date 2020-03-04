close all; clear;
subname=["A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z"];
samples=zeros(260,92);
letter=0;
path="features";
for name=subname
    for i=1:10
        load(".\"+path+"\G"+name+"\G"+name+i+"tdoapeak.mat");
        samples(letter*10+i,1)=tdoa;
        load(".\"+path+"\G"+name+"\G"+name+i+"tdoaphat.mat");
        samples(letter*10+i,2)=tdoa;
        load(".\"+path+"\G"+name+"\G"+name+i+"tdoaccml.mat");
        samples(letter*10+i,3:4)=tdoa;
        load(".\"+path+"\G"+name+"\G"+name+i+"tdoalms.mat");
        samples(letter*10+i,5)=tdoa;
        %energy features
        valuename="energy";
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"ratio.mat");
        samples(letter*10+i,6)=energyratio;
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"diff.mat");
        samples(letter*10+i,7)=energydiff;
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"max.mat");
        samples(letter*10+i,8:9)=maxvalue;
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"min.mat");
        samples(letter*10+i,10:11)=minvalue;
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"std.mat");
        samples(letter*10+i,12:13)=stdvalue;
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"rms.mat");
        samples(letter*10+i,14:15)=rmsvalue;
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"skewness.mat");
        samples(letter*10+i,16:17)=skewnessvalue;
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"kurtosis.mat");
        samples(letter*10+i,18:19)=kurtosisvalue;
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"iqr.mat");
        samples(letter*10+i,20:21)=iqrvalue;
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"zcr.mat");
        samples(letter*10+i,22:23)=zcrvalue;
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"mean.mat");
        samples(letter*10+i,24:25)=meanvalue;
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"median.mat");
        samples(letter*10+i,26:27)=medianvalue;
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"mean1deri.mat");
        samples(letter*10+i,28:29)=mean1derivalue;
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"mean2deri.mat");
        samples(letter*10+i,30:31)=mean2derivalue;
        
        %flux features
        valuename="flux";
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"max.mat");
        samples(letter*10+i,32:33)=maxvalue;
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"min.mat");
        samples(letter*10+i,34:35)=minvalue;
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"std.mat");
        samples(letter*10+i,36:37)=stdvalue;
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"rms.mat");
        samples(letter*10+i,38:39)=rmsvalue;
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"skewness.mat");
        samples(letter*10+i,40:41)=skewnessvalue;
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"kurtosis.mat");
        samples(letter*10+i,42:43)=kurtosisvalue;
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"iqr.mat");
        samples(letter*10+i,44:45)=iqrvalue;
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"zcr.mat");
        samples(letter*10+i,46:47)=zcrvalue;
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"mean.mat");
        samples(letter*10+i,48:49)=meanvalue;
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"median.mat");
        samples(letter*10+i,50:51)=medianvalue;
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"mean1deri.mat");
        samples(letter*10+i,52:53)=mean1derivalue;
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"mean2deri.mat");
        samples(letter*10+i,54:55)=mean2derivalue;
        
        %centroid features
        valuename="centroid";
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"max.mat");
        samples(letter*10+i,56:57)=maxvalue;
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"min.mat");
        samples(letter*10+i,58:59)=minvalue;
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"std.mat");
        samples(letter*10+i,60:61)=stdvalue;
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"rms.mat");
        samples(letter*10+i,62:63)=rmsvalue;
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"skewness.mat");
        samples(letter*10+i,64:65)=skewnessvalue;
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"kurtosis.mat");
        samples(letter*10+i,66:67)=kurtosisvalue;
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"iqr.mat");
        samples(letter*10+i,68:69)=iqrvalue;
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"zcr.mat");
        samples(letter*10+i,70:71)=zcrvalue;
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"mean.mat");
        samples(letter*10+i,72:73)=meanvalue;
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"median.mat");
        samples(letter*10+i,74:75)=medianvalue;
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"mean1deri.mat");
        samples(letter*10+i,76:77)=mean1derivalue;
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"mean2deri.mat");
        samples(letter*10+i,78:79)=mean2derivalue;
        
        
%         load(".\"+path+"\G"+name+"\G"+name+i+"flux.mat");
%         samples(letter*10+i,12:15)=flux;
%         load(".\"+path+"\G"+name+"\G"+name+i+"centroid.mat");
%         samples(letter*10+i,16:19)=centroid;

        %sound source features
        valuename="soundsource";
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"max.mat");
        samples(letter*10+i,80)=maxvalue;
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"min.mat");
        samples(letter*10+i,81)=minvalue;
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"std.mat");
        samples(letter*10+i,82)=stdvalue;
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"rms.mat");
        samples(letter*10+i,83)=rmsvalue;
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"skewness.mat");
        samples(letter*10+i,84)=skewnessvalue;
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"kurtosis.mat");%typo
        samples(letter*10+i,85)=kurtosisvalue;%typo
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"iqr.mat");
        samples(letter*10+i,86)=iqrvalue;
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"zcr.mat");
        samples(letter*10+i,87)=zcrvalue;
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"mean.mat");
        samples(letter*10+i,88)=meanvalue;
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"median.mat");
        samples(letter*10+i,89)=medianvalue;
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"mean1deri.mat");
        samples(letter*10+i,90)=mean1derivalue;
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"mean2deri.mat");
        samples(letter*10+i,91)=mean2derivalue;
        
        samples(letter*10+i,92)=letter;
    end
    letter=letter+1;
end
save(".\samples.mat",'samples');

