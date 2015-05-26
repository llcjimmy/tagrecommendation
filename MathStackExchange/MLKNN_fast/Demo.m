%% STEP 0: Load Data, Set Default Param
clear;

addpath('../');
dataname='MathSE.mat';
load(dataname);

load('WeakPro.mat');

[N,~]=size(label);

%indexperm=randperm(N);
% load('randomInput.mat');
% 
% feature=feature(indexperm(1:10000),:);
% label=label(indexperm(1:10000),:);
% 
% WeakPro=WeakPro(indexperm(1:10000),:);
% 
% feature=full(feature);
% label=full(label);
% feature(:,all(feature==0,1))=[];
% label(:,all(label==0,1))=[];

% [COEFF,SCORE,LATENT]=pca(feature,'Centered',false);
% feature=SCORE(:,(cumsum(LATENT)./sum(LATENT))<=0.95);

[N,T]=size(label);
[N,FeaNum]=size(feature);

n=round(N*0.9);

train_data=feature(1:n,:)';
train_label=label(1:n,:)';
test_data=feature(n+1:N,:)';
test_label=label(n+1:N,:)';

WeakProTrain=WeakPro(1:n,:);
WeakProTest=WeakPro(n+1:N,:);

disp('data load and split');

Num=10;
Smooth=1; %Set the number of nearest neighbors consider to 10 and the smoothing paremeter to 1

%% STEP 1: Training Large fast
disp('---------Training: ---------');
tic;
[Prior,PriorN,Cond,CondN,KeyCondLabel]=MLKNN_train_fast(train_data',train_label,Num,Smooth,WeakProTrain);
toc;
%% STEP 2: Evaluation Large fast
disp('---------Result: ---------');
tic;
[HammingLoss,RankingLoss,OneError,Coverage,Average_Precision,Outputs,Pre_Labels]=MLKNN_test_fast(train_data',train_label,test_data',test_label,Num,Prior,PriorN,Cond,CondN,WeakProTest,KeyCondLabel);
toc;
mRecall(Outputs,test_label,5)
mRecall(Outputs,test_label,10)
mRecall(Outputs,test_label,20)