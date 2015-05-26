%% STEP 0: Load Data, Set Default Param
clear;

addpath('../');
dataname='MathSE.mat';
load(dataname);

load('WeakPro.mat');

[N,~]=size(label);

%indexperm=randperm(N);
% load('randomInput.mat');

% feature=feature(indexperm(1:10000),:);
% label=label(indexperm(1:10000),:);

% WeakPro=WeakPro(indexperm(1:10000),:);

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

Num=30;
Smooth=1; %Set the number of nearest neighbors consider to 10 and the smoothing paremeter to 1

%% STEP 1: Training
disp('---------Training: ---------');
tic;
[Prior,PriorN,Cond,CondN]=MLKNN_train(train_data',train_label,Num,Smooth);
MLKNN_trainingtime=toc;
%% STEP 2: Evaluation
disp('---------Result: ---------');
for i=5:9
    tic;
    [HammingLoss,RankingLoss,OneError,Coverage,Average_Precision,Outputs,Pre_Labels]=MLKNN_test(train_data',train_label,test_data(:,1:(i*200))',test_label(:,1:(i*200)),Num,Prior,PriorN,Cond,CondN);
    mRecall(Outputs,test_label(:,1:(i*200)),5)
    mRecall(Outputs,test_label(:,1:(i*200)),10)
    mRecall(Outputs,test_label(:,1:(i*200)),20)
    MLKNN_testingtime(i)=toc;
end

%% STEP 3: Training Small
disp('---------Training: ---------');
tic;
[Prior,PriorN,Cond,CondN,KeyCondLabel]=MLKNN_train_small(train_data',train_label,Num,Smooth,WeakProTrain);
MATAR_trainingtime=toc;
%% STEP 4: Evaluation Small
disp('---------Result: ---------');
for i=5:9
    tic;
    [HammingLoss,RankingLoss,OneError,Coverage,Average_Precision,Outputs,Pre_Labels]=MLKNN_test_small(train_data',train_label,test_data(:,1:(i*200))',test_label(:,1:(i*200)),Num,Prior,PriorN,Cond,CondN,WeakProTest(1:(i*200),:),KeyCondLabel);
    mRecall(Outputs,test_label(:,1:(i*200)),5)
    mRecall(Outputs,test_label(:,1:(i*200)),10)
    mRecall(Outputs,test_label(:,1:(i*200)),20)
    MATAR_testingtime(i)=toc;
end