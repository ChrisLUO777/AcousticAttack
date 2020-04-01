close all; clear;
[y1,~] = audioread("E:\MATLABprogram\AcousticAttack\sound source\K1.wav");
[y2,~] = audioread("E:\MATLABprogram\AcousticAttack\sound source\K2.wav");
[y3,~] = audioread("E:\MATLABprogram\AcousticAttack\sound source\K3.wav");
[y4,Fs] = audioread("E:\MATLABprogram\AcousticAttack\sound source\K4.wav");
subplot(4,2,1)
plot(y1(:,1))
subplot(4,2,2)
plot(y1(:,2))
subplot(4,2,3)
plot(y2(:,1))
subplot(4,2,4)
plot(y2(:,2))
subplot(4,2,5)
plot(y3(:,1))
subplot(4,2,6)
plot(y3(:,2))
subplot(4,2,7)
plot(y4(:,1),'r')
subplot(4,2,8)
plot(y4(:,2),'r')
%%
% [H12,p12] = ansaribradley(y1(:,1),y2(:,1));
% [H13,p13] = ansaribradley(y1(:,1),y3(:,1));
% [H14,p14] = ansaribradley(y1(:,1),y4(:,1));
% [H23,p23] = ansaribradley(y2(:,1),y3(:,1));
% [H24,p24] = ansaribradley(y2(:,1),y4(:,1));
% [H34,p34] = ansaribradley(y3(:,1),y4(:,1));
%%
% [H12,p12] = cmtest2(y1(:,1),y2(:,1));
% [H13,p13] = cmtest2(y1(:,1),y3(:,1));
% [H14,p14] = cmtest2(y1(:,1),y4(:,1));
% [H23,p23] = cmtest2(y2(:,1),y3(:,1));
% [H24,p24] = cmtest2(y2(:,1),y4(:,1));
% [H34,p34] = cmtest2(y3(:,1),y4(:,1));
%%
% [H12,p12] = kstest2(y1(:,1),y2(:,1));
% [H13,p13] = kstest2(y1(:,1),y3(:,1));
% [H14,p14] = kstest2(y1(:,1),y4(:,1));
% [H23,p23] = kstest2(y2(:,1),y3(:,1));
% [H24,p24] = kstest2(y2(:,1),y4(:,1));
% [H34,p34] = kstest2(y3(:,1),y4(:,1));
%%
% [H12,p12] = ranksum(y1(:,1),y2(:,1));
% [H13,p13] = ranksum(y1(:,1),y3(:,1));
% [H14,p14] = ranksum(y1(:,1),y4(:,1));
% [H23,p23] = ranksum(y2(:,1),y3(:,1));
% [H24,p24] = ranksum(y2(:,1),y4(:,1));
% [H34,p34] = ranksum(y3(:,1),y4(:,1));
%%
[H12,p12] = ttest2(y1(:,1),y2(:,1));
[H13,p13] = ttest2(y1(:,1),y3(:,1));
[H14,p14] = ttest2(y1(:,1),y4(:,1));
[H23,p23] = ttest2(y2(:,1),y3(:,1));
[H24,p24] = ttest2(y2(:,1),y4(:,1));
[H34,p34] = ttest2(y3(:,1),y4(:,1));