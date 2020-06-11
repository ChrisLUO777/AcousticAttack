close all; clear;
load(".\idealsamples.mat");
%%
%train model
subfeature=(1:19);
X=samples(1:2:179,subfeature);
y=samples(1:2:179,20);
Xtest=samples(2:2:180,subfeature);
ytest=samples(2:2:180,20);
%%
%n possible guess
TP=0;
npossible=5;
rawrecord=zeros(90,9);
guessresult=zeros(90,npossible);
for letter=0:8
    ytmp=double(y==letter);
    model=fitcsvm(X,ytmp,'KernelFunction','gaussian');
%     model=fitcknn(X,ytmp);
    [label,score] = predict(model,Xtest);
    rawrecord(:,letter+1)=score(:,1);
end
for savepointer=1:npossible
    [M,I]=max(rawrecord,[],2);%find max in each row
    guessresult(:,savepointer)=I;
    for deletepointer=1:90
        rawrecord(deletepointer,I(deletepointer))=-Inf;
    end
end
for samplepointer=1:90 %check if each row has correct prediction
    if size(find(guessresult(samplepointer,:)==ytest(samplepointer)),2)~=0
        TP=TP+1;
    end
end
for letter=1:9 %calculate accuracy
    for guesscount=1:10
        tmparray=guessresult((letter-1)*10+guesscount,:);
        findletter=find(tmparray==letter);
        if size(findletter,2)~=0
            guessresult((letter-1)*10+guesscount,6)=6-findletter;
        else
            guessresult((letter-1)*10+guesscount,6)=0;
        end
    end
    guessresult((letter-1)*10+1,7)=sum(guessresult((letter-1)*10+1:(letter-1)*10+10,6));
end