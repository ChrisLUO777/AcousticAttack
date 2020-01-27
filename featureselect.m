close all; clear;
load(".\samples.mat");
%%
%train SVM
X=samples(1:2:259,1:19);
m = size(X, 1);
Xtest=samples(2:2:260,1:19);
mtest=size(Xtest,1);

d=samples(:,1:19);
f=samples(:,20);
K=19;
fea=mrmr_mid_d(d,f,K);
