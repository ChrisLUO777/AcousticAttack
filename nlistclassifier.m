close all; clear;
load(".\samples.mat");
%%
%train model
%subfeature=[5 9 14 16 40 44];%max TP
subfeature=[1 2 4 5 6 7 16 17];%max top5 list
%subfeature=[1:7,12:13,24:25,36:37,48:49,60:61,72:73];
%subfeature=[5:7,16:19,40:43,64:67];
%subfeature=(1:79);
X=samples(1:2:259,subfeature);
m = size(X, 1);
Xtest=samples(2:2:260,subfeature);
mtest=size(Xtest,1);

%%
%n possible guess
TP=0;
FP=0;
TN=0;
FN=0;
npossible=5;
rawrecord=zeros(130,26);
guessresult=zeros(130,npossible);
for letter=0:25
    y=ones(130,1);
    y(1+letter*5:5+letter*5)=0;
    ytest=ones(130,1);
    ytest(1+letter*5:5+letter*5)=0;
    model=fitcsvm(X,y,'KernelFunction','gaussian');
    %model=fitcknn(X,y);
    [label,score] = predict(model,Xtest);
    rawrecord(:,letter+1)=score(:,1);
end
for savepointer=1:npossible
    [M,I]=max(rawrecord,[],2);
    guessresult(:,savepointer)=I;
    for deletepointer=1:130
        rawrecord(deletepointer,I(deletepointer))=-Inf;
    end
end
for samplepointer=1:130
    if size(find(guessresult(samplepointer,:)==int32(ceil(samplepointer/5))),2)~=0
        TP=TP+1;
    end
end