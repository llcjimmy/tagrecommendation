%% STEP 0: Load Data, Set Default Param
clear;

addpath('../');
dataname='stackoverflow.mat';
load(dataname);
[N,~]=size(label);
load('randomInput.mat');
feature=feature(indexperm(1:35000),:);
label=label(indexperm(1:35000),:);
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

disp('data load and split');

%% STEP 1: Training
disp('---------Training: ---------');
for j=1:6
    tic;
    for i=1:T
       if(mod(i,10)==0)
           disp(strcat('computing SVM model for label:',num2str(i)));
       end
       model(i)=svmtrain(train_label(i,1:(j*5000))',train_data(:,1:(j*5000))');
    end
    SVM_time(j)=toc;
end