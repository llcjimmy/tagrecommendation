%% STEP 0: Load Data, Set Default Param
clear;

addpath('../');
dataname='stackoverflow.mat';
load(dataname);

load('WeakPro.mat');

[N,~]=size(label);

%indexperm=randperm(N);
load('randomInput.mat');

feature=feature(indexperm(1:35000),:);
label=label(indexperm(1:35000),:);

WeakPro=WeakPro(indexperm(1:35000),:);

feature=full(feature);
label=full(label);
feature(:,all(feature==0,1))=[];
label(:,all(label==0,1))=[];

% [COEFF,SCORE,LATENT]=pca(feature,'Centered',false);
% feature=SCORE(:,(cumsum(LATENT)./sum(LATENT))<=0.95);

[N,T]=size(label);
[N,FeaNum]=size(feature);

n=N*0.9;

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
for i=1:6
    tic;
    [Prior,PriorN,Cond,CondN]=MLKNN_train(train_data(:,1:(i*5000))',train_label(:,1:(i*5000)),Num,Smooth);
    MLKNN_time(i)=toc;
end

%% STEP 3: Training Small
disp('---------Training: ---------');
for i=1:6
    tic;
    [Prior,PriorN,Cond,CondN,KeyCondLabel]=MLKNN_train_small(train_data(:,1:(i*5000))',train_label(:,1:(i*5000)),Num,Smooth,WeakProTrain(1:(i*5000),:));
    MATAR_time(i)=toc;
end
