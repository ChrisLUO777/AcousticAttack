close all; clear;
subname=["A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z"];
samples=zeros(260,20);
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
        load(".\"+path+"\G"+name+"\G"+name+i+"tdoalms.mat");
        samples(letter*10+i,5)=tdoa;
        load(".\"+path+"\G"+name+"\G"+name+i+"energyratio.mat");
        samples(letter*10+i,6)=energyratio;
        load(".\"+path+"\G"+name+"\G"+name+i+"energydiff.mat");
        samples(letter*10+i,7)=energydiff;
        load(".\"+path+"\G"+name+"\G"+name+i+"energyvalue.mat");
        samples(letter*10+i,8:11)=energyvalue;
        load(".\"+path+"\G"+name+"\G"+name+i+"flux.mat");
        samples(letter*10+i,12:15)=flux;
        load(".\"+path+"\G"+name+"\G"+name+i+"centroid.mat");
        samples(letter*10+i,16:19)=centroid;
        
        samples(letter*10+i,20)=letter;
    end
    letter=letter+1;
end
save(".\samples.mat",'samples');

