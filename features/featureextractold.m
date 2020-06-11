close all; clear;
% subname=["A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z"];
subname=('A':'I');
for name=subname
    path="..\single key samples\All direction Clicks\splitsp";
%     mkdir(".\G"+name);
    for i=11:20
        [y,Fs] = audioread(".\"+path+"\"+name+"\"+name+i+".wav");
        tdoaphat(y,Fs,name,i);
        tdoapeak(y,Fs,name,i);
        tdoaccml(y,Fs,name,i);
        tdoalms(y,Fs,name,i);

        %energy features
        A=zeros(size(y,1)-11,2);
        for t=1:size(y,1)-11
            for templength=1:10
                A(t,1)=A(t,1)+y(t+templength,1).^2;
                A(t,2)=A(t,2)+y(t+templength,2).^2;
            end
        end
         energyratio(y,Fs,name,i);
         energydiff(y,Fs,name,i);
         maxvalue(A,Fs,name,i,"energy");
         minvalue(A,Fs,name,i,"energy");
         stdvalue(A,Fs,name,i,"energy");
         rmsvalue(A,Fs,name,i,"energy");
         skewnessvalue(A,Fs,name,i,"energy");
         kurtosisvalue(A,Fs,name,i,"energy");
         iqrvalue(A,Fs,name,i,"energy");
         zcrvalue(A,Fs,name,i,"energy");
         meanvalue(A,Fs,name,i,"energy");
         medianvalue(A,Fs,name,i,"energy");
         mean1derivalue(A,Fs,name,i,"energy");
         mean2derivalue(A,Fs,name,i,"energy");
         
         %flux features
         flux(y,Fs,name,i);
         tempflux = spectralFlux(y,Fs);
         maxvalue(A,Fs,name,i,"flux");
         minvalue(A,Fs,name,i,"flux");
         stdvalue(A,Fs,name,i,"flux");
         rmsvalue(A,Fs,name,i,"flux");
         skewnessvalue(A,Fs,name,i,"flux");
         kurtosisvalue(A,Fs,name,i,"flux");
         iqrvalue(A,Fs,name,i,"flux");
         zcrvalue(A,Fs,name,i,"flux");
         meanvalue(A,Fs,name,i,"flux");
         medianvalue(A,Fs,name,i,"flux");
         mean1derivalue(A,Fs,name,i,"flux");
         mean2derivalue(A,Fs,name,i,"flux");
         
        %centroid features
         centroid(y,Fs,name,i);
         tempcentroid = spectralCentroid(y,Fs);
         maxvalue(A,Fs,name,i,"centroid");
         minvalue(A,Fs,name,i,"centroid");
         stdvalue(A,Fs,name,i,"centroid");
         rmsvalue(A,Fs,name,i,"centroid");
         skewnessvalue(A,Fs,name,i,"centroid");
         kurtosisvalue(A,Fs,name,i,"centroid");
         iqrvalue(A,Fs,name,i,"centroid");
         zcrvalue(A,Fs,name,i,"centroid");
         meanvalue(A,Fs,name,i,"centroid");
         medianvalue(A,Fs,name,i,"centroid");
         mean1derivalue(A,Fs,name,i,"centroid");
         mean2derivalue(A,Fs,name,i,"centroid");
         
         %sound source feat.
         soundsourcefeatures(y,Fs,name,i,"soundsource");
    end
end

