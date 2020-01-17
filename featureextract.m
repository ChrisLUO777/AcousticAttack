close all; clear;
subname=["A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z"];
for name=subname
    path="single key samples\splitsp";
    %mkdir(".\features\G"+name);
    for i=1:10
        [y,Fs] = audioread(".\"+path+"\G"+name+"\G"+name+i+".wav");
        %tdoaphat(y,Fs,name,i);
        %tdoapeak(y,Fs,name,i);
        tdoaccml(y,Fs,name,i);
    end
end

