close all; clear;
% subname=('A':'I');
subname=('A':'Z');
% samples{180,34}='Z';
letter=0;
samplenum=20;
path="features";
for name=subname
    for i=1:samplenum
        valuename="acoustic";
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"iqrvalue.mat");
        samples{letter*samplenum+i,1}=iqrvalue(1);
        samples{letter*samplenum+i,2}=iqrvalue(2);
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"skewnessvalue.mat");
        samples{letter*samplenum+i,3}=skewnessvalue(1);
        samples{letter*samplenum+i,4}=skewnessvalue(2);
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"kurtosisvalue.mat");
        samples{letter*samplenum+i,5}=kurtosisvalue(1);
        samples{letter*samplenum+i,6}=kurtosisvalue(2);
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"corrvalue.mat");
        samples{letter*samplenum+i,7}=corrvalue;
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"energyvalue.mat");
        samples{letter*samplenum+i,8}=abs(energyvalue(1));
        samples{letter*samplenum+i,9}=abs(energyvalue(2));
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"SEvalue.mat");
        samples{letter*samplenum+i,10}=SEvalue(1);
        samples{letter*samplenum+i,11}=SEvalue(2);
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"meanvalue.mat");
        samples{letter*samplenum+i,12}=meanvalue(1);
        samples{letter*samplenum+i,13}=meanvalue(2);
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"medianvalue.mat");
        samples{letter*samplenum+i,14}=medianvalue(1);
        samples{letter*samplenum+i,15}=medianvalue(2);
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"stdvalue.mat");
        samples{letter*samplenum+i,16}=stdvalue(1);
        samples{letter*samplenum+i,17}=stdvalue(2);
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"varvalue.mat");
        samples{letter*samplenum+i,18}=varvalue(1);
        samples{letter*samplenum+i,19}=varvalue(2);
        load(".\"+path+"\G"+name+"\G"+name+i+valuename+"mfccvalue.mat");
        samples{letter*samplenum+i,20}=mfccvalue(1);
        samples{letter*samplenum+i,21}=mfccvalue(2);
        samples{letter*samplenum+i,22}=mfccvalue(3);
        samples{letter*samplenum+i,23}=mfccvalue(4);
        samples{letter*samplenum+i,24}=mfccvalue(5);
        samples{letter*samplenum+i,25}=mfccvalue(6);
        samples{letter*samplenum+i,26}=mfccvalue(7);
        samples{letter*samplenum+i,27}=mfccvalue(8);
        samples{letter*samplenum+i,28}=mfccvalue(9);
        samples{letter*samplenum+i,29}=mfccvalue(10);
        samples{letter*samplenum+i,30}=mfccvalue(11);
        samples{letter*samplenum+i,31}=mfccvalue(12);
        samples{letter*samplenum+i,32}=mfccvalue(13);
        samples{letter*samplenum+i,33}=mfccvalue(14);
        
        samples{letter*samplenum+i,34}=name;
        samples{letter*samplenum+i,35}=strcat(name,int2str(i));
    end
    letter=letter+1;
end
smptitle={'IQRL' 'IQRR' 'SkewnessL' 'SkewnessR' 'KurtosisL' 'KurtosisR' 'Corr' 'EnergyL' 'EnergyR' ...
    'SEL' 'SER' 'MeanL' 'MeanR' 'MedianL' 'MedianR' 'STDL' 'STDR' 'VarL' 'VarR' ...
    'MFCCiqr1' 'MFCCiqr2' 'MFCCiqr3' 'MFCCiqr4' 'MFCCskewness1' 'MFCCskewness2' 'MFCCskewness3' 'MFCCskewness4' ...
    'MFCCkurtosis1' 'MFCCkurtosis2' 'MFCCkurtosis3' 'MFCCkurtosis4' ...
    'MFCCcorr1' 'MFCCcorr2' 'letter' 'smplID'};
samples=[smptitle;samples];
save(".\letters_v0.2.mat",'samples');
filename = 'letters_v0.2.csv';    %must end in csv
writetable( cell2table(samples), filename, 'writevariablenames', false, 'quotestrings', false);
