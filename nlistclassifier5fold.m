close all; clear;
load(".\samples.mat");
%%
%train model
%subfeature=[5 9 14 16 40 44];%max TP
subfeature=[1 2 4 5 6 7 16 17];%max top5 list
%subfeature=[1:7,12:13,24:25,36:37,48:49,60:61,72:73];
%subfeature=[5:7,16:19,40:43,64:67];
%subfeature=(1:79);
X1=[samples(1:10:251,subfeature); samples(2:10:252,subfeature)];
y1=[samples(1:10:251,92); samples(2:10:252,92)];
X2=[samples(3:10:253,subfeature); samples(4:10:254,subfeature)];
y2=[samples(3:10:253,92); samples(4:10:254,92)];
X3=[samples(5:10:255,subfeature); samples(6:10:256,subfeature)];
y3=[samples(5:10:255,92); samples(6:10:256,92)];
X4=[samples(7:10:257,subfeature); samples(8:10:258,subfeature)];
y4=[samples(7:10:257,92); samples(8:10:258,92)];
X5=[samples(9:10:259,subfeature); samples(10:10:260,subfeature)];
y5=[samples(9:10:259,92); samples(10:10:260,92)];

%%
%n possible guess
TP=0;
npossible=5;
rawrecord=zeros(260,26);
guessresult=zeros(260,npossible);
for fold=1:5
    if fold==1
        X=[X2;X3;X4;X5];
        y=[y2;y3;y4;y5];
        Xtest=X1;
        ytest=y1;
    elseif fold==2
        X=[X1;X3;X4;X5];
        y=[y1;y3;y4;y5];
        Xtest=X2;
        ytest=y2;
    elseif fold==3
        X=[X1;X2;X4;X5];
        y=[y1;y2;y4;y5];
        Xtest=X3;
        ytest=y3;
    elseif fold==4
        X=[X1;X2;X3;X5];
        y=[y1;y2;y3;y5];
        Xtest=X4;
        ytest=y4;
    elseif fold==5
        X=[X1;X2;X3;X4];
        y=[y1;y2;y3;y4];
        Xtest=X5;
        ytest=y5;
    end
    for letter=0:25
        ytmp=double(y==letter);
        ytesttmp=double(ytest==letter);
        model=fitcsvm(X,ytmp,'KernelFunction','gaussian');
%         model=fitcknn(X,ytmp);
        [label,score] = predict(model,Xtest);
        rawrecord((fold-1)*52+1:fold*52,letter+1)=score(:,1);    
     end
end

for savepointer=1:npossible
    [M,I]=max(rawrecord,[],2);
    guessresult(:,savepointer)=I;
    for deletepointer=1:260
        rawrecord(deletepointer,I(deletepointer))=-Inf;
    end
end
ytruth=[y1;y2;y3;y4;y5];
for samplepointer=1:260 %check if each row has correct prediction
    if size(find(guessresult(samplepointer,:)== ytruth(samplepointer)),2)~=0
        TP=TP+1;
    end
end
guessresult(:,7)=0;
for letter=1:26 %calculate accuracy
    for guesscount=1:10
        tmparray=guessresult((guesscount-1)*26+letter,:);
        findletter=find(tmparray==letter);
        if size(findletter,2)~=0
            guessresult((guesscount-1)*26+letter,6)=6-findletter;
            guessresult(letter,7)=guessresult(letter,7)+6-findletter;
        else
            guessresult((guesscount-1)*26+letter,6)=0;
        end
    end
end