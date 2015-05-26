%% STEP 0: Load Data, Set Default Param
clear;

addpath('../');
dataname='MathSE.mat';
load(dataname);
[N,~]=size(label);
% indexperm=randperm(N);
% feature=feature(indexperm(1:10000),:);
% label=label(indexperm(1:10000),:);
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

disp('data load and split');

%% STEP 1: Training
disp('---------Training: ---------');
tic;
for i=1:T
    if(mod(i,10)==0)
        disp(strcat('computing SVM model for label:',num2str(i)));
    end
    model(i)=svmtrain(train_label(i,:)',train_data');
end
SVM_trainingtime=toc;
%% STEP 2: Evaluation
disp('---------Result: ---------');
for j=5:9
    tic;
    Pre_Labels=zeros((j*200),T);
    Outputs=zeros((j*200),T);

    for i=1:T
        if(mod(i,10)==0)
            disp(strcat('predicting via SVM model for label:',num2str(i)));
        end
        [Pre_Labels(:,i),~,Outputs(:,i)]=svmpredict(test_label(i,1:(j*200))',test_data(:,1:(j*200))',model(i));
    end
    
    Pre_Labels(Pre_Labels==0)=-1;
    Outputs=Pre_Labels .* Outputs;
    
    mRecall(Outputs',test_label(:,1:(j*200)),5)
    mRecall(Outputs',test_label(:,1:(j*200)),10)
    mRecall(Outputs',test_label(:,1:(j*200)),20)
    SVM_testingtime(j)=toc;
end