close all; clear;
load(".\idealsamples.mat");
%%
%train model
subfeature=(1:19);
X=samples(1:2:179,subfeature);
y=samples(1:2:179,20);
Xtest=samples(2:2:180,subfeature);
ytest=samples(2:2:180,20);
guessresult=zeros(9,9);
%%
%Hamming loss
TP=0;
FP=0;
TN=0;
FN=0;
for letter=1:9
    ytmp=double(y~=letter);
    ytesttmp=double(ytest~=letter);
    model=fitcsvm(X,ytmp,'KernelFunction','polynomial');
%     model=fitcknn(X,ytmp);
    [label,score] = predict(model,Xtest);
    for i=1:size(ytesttmp,1)
        if((label(i,1)==0) && (ytesttmp(i,1)==0))%TP
                    guessresult(ceil(i/10),letter)=guessresult(ceil(i/10),letter)+1;
                    TP=TP+1;
        elseif((label(i,1)==0) && (ytesttmp(i,1)==1))%FP
                    guessresult(ceil(i/10),letter)=guessresult(ceil(i/10),letter)+1;
                    FP=FP+1;
        elseif((label(i,1)==1) && (ytesttmp(i,1)==1))%TN
                    TN=TN+1;
        elseif((label(i,1)==1) && (ytesttmp(i,1)==0))%FN
                    FN=FN+1;
        end
    end

end
HLoss=(FP+FN)/(10*90);
fprintf('Hamming Loss=%f \n',HLoss);