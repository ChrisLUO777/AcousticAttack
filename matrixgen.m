close all; clear;
subname=["A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z"];
samples=zeros(260,3);
letter=0;
path="features";
for name=subname
    for i=1:10
        load(".\"+path+"\G"+name+"\G"+name+i+"tdoapeak.mat");
        samples(letter*10+i,1)=tdoa;
        load(".\"+path+"\G"+name+"\G"+name+i+"tdoaphat.mat");
        samples(letter*10+i,2)=tdoa;
        load(".\"+path+"\G"+name+"\G"+name+i+"tdoaccml.mat");
        samples(letter*10+i,3)=tdoa(1,1);
        samples(letter*10+i,4)=tdoa(1,2);
        samples(letter*10+i,5)=letter;
    end
    letter=letter+1;
end
save(".\samples.mat",'samples');

