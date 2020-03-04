close all; clear;
load(".\samples.mat");
%%
%train SVM
X=samples(1:2:259,1:91);
m = size(X, 1);
Xtest=samples(2:2:260,1:91);
mtest=size(Xtest,1);

d=samples(:,1:91);
f=samples(:,92);
K=91;
fea=mrmr_mid_d(d,f,K);
%%
%max TP
% subfeature=[];
% HLoss=1;
% TP=0;
% for featin=1:91
%     TPtemp=0;
%     subfeaturetemp=[subfeature featin];
%     X=samples(1:2:259,subfeaturetemp);
%     m = size(X, 1);
%     Xtest=samples(2:2:260,subfeaturetemp);
%     mtest=size(Xtest,1);
%     npossible=5;
%     rawrecord=zeros(130,26);
%     guessresult=zeros(130,npossible);
%     for letter=0:25
%         y=ones(130,1);
%         y(1+letter*5:5+letter*5)=0;
%         ytest=ones(130,1);
%         ytest(1+letter*5:5+letter*5)=0;
%         model=fitcsvm(X,y,'KernelFunction','gaussian');
%         %model=fitcknn(X,y);
%         [label,score] = predict(model,Xtest);
%         rawrecord(:,letter+1)=score(:,1);
%     end
%     for savepointer=1:npossible
%         [M,I]=max(rawrecord,[],2);
%         guessresult(:,savepointer)=I;
%         for deletepointer=1:130
%             rawrecord(deletepointer,I(deletepointer))=-Inf;
%         end
%     end
%     for samplepointer=1:130
%         if size(find(guessresult(samplepointer,:)==int32(ceil(samplepointer/5))),2)~=0
%             TPtemp=TPtemp+1;
%         end
%     end
%     if TPtemp>TP
%         subfeature=subfeaturetemp;
%         TP=TPtemp;
%     end
% end