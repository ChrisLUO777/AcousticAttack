close all; clear;
load(".\samples.mat");
%%
%train model
subfeature=[5 8 10 7 6 3 9 14 17];
X=samples(1:2:259,subfeature);
m = size(X, 1);
Xtest=samples(2:2:260,subfeature);
mtest=size(Xtest,1);

%%
%confusion matrix
% TP=0;
% FP=0;
% TN=0;
% FN=0;
% for letter=0:25
%     y(1+letter*5:5+letter*5)=0;
%     ytest(1+letter*5:5+letter*5)=0;
%     model=fitcsvm(X,y,'KernelFunction','linear');
%     [label,score] = predict(model,Xtest);
%     for i=1:size(ytest,1)
%         if((label(i,1)==0) && (ytest(i,1)==0))%TP
%                     TP=TP+1;
%         elseif((label(i,1)==0) && (ytest(i,1)==1))%FP
%                     FP=FP+1;
%         elseif((label(i,1)==1) && (ytest(i,1)==1))%TN
%                     TN=TN+1;
%         elseif((label(i,1)==1) && (ytest(i,1)==0))%FN
%                     FN=FN+1;
%         end
%     end
% 
% end
% precise=TP/(TP+FP);
% recall=TP/(TP+FN);
% Fscore=2*precise*recall/(precise+recall);
% fprintf('TP=%f, FN=%f, FP=%f, TN=%f \n',TP,FN,FP,TN);
% fprintf('Fscore=%f \n',Fscore);
%%
%Hamming loss
TP=0;
FP=0;
TN=0;
FN=0;
for letter=0:25
    y=ones(130,1);
    y(1+letter*5:5+letter*5)=0;
    ytest=ones(130,1);
    ytest(1+letter*5:5+letter*5)=0;
    %model=fitcsvm(X,y,'KernelFunction','poly');
    model=fitcknn(X,y);
    [label,score] = predict(model,Xtest);
    %label=ones(130,1);
    for i=1:size(ytest,1)
        if((label(i,1)==0) && (ytest(i,1)==0))%TP
                    TP=TP+1;
        elseif((label(i,1)==0) && (ytest(i,1)==1))%FP
                    FP=FP+1;
        elseif((label(i,1)==1) && (ytest(i,1)==1))%TN
                    TN=TN+1;
        elseif((label(i,1)==1) && (ytest(i,1)==0))%FN
                    FN=FN+1;
        end
    end

end
HLoss=(FP+FN)/(26*130);
fprintf('Hamming Loss=%f \n',HLoss);