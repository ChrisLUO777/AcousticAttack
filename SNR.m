close all; clear;
%key=["A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z"];
key="A";
snrvalue=zeros(26,10);
for file=1
    for num=1:10
        [y,Fs] = audioread("E:\MATLABprogram\AcousticAttack\single key samples\splitsp\G"+key(file)+"\G"+key(file)+num+".wav");
        snrvalue(file,num)=snr(y(:,1));
    end
end
avesnr=sum(sum(snrvalue))/10;