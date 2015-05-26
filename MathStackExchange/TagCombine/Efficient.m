%% STEP 0: Load Data, Set Default Param
clear;

addpath('../');
dataname='MathSE.mat';
load(dataname);
[N,~]=size(label);
% indexperm=randperm(N);
% feature=feature(indexperm(1:5000),:);
% label=label(indexperm(1:5000),:);
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
for timei=1:8
    tic;
    m=round(timei*2000*0.9);
    train_data_tr=train_data(:,1:m);
    train_data_va=train_data(:,m+1:timei*2000);
    train_label_tr=train_label(:,1:m);
    train_label_va=train_label(:,m+1:timei*2000);

    [model]=MultilabelRankingClassiifier(train_data_tr,train_label_tr);
    disp('MultiLabel training over!');
    [Aff]=TagTermAffinityScore(train_data_tr,train_label_tr);
    disp('Affinity computing over!');
    
    [MultilabelRankingScores] = MultilabelRanking(model, train_data_va);
    [SimilarityRankingScores]=SimilarityRankingScore(train_data_tr,train_label_tr,train_data_va);
    [TagTermRankingScores]=TagTermRankingScore(train_data_va,Aff);
    disp('Begin evaluation!');
    
    alphe=0;
    beta=0;
    gamma=0;
    recallMax=0;
    
    for i=0:0.1:1
        for j=0:0.1:1
            for k=0:0.1:1
                eva=i*MultilabelRankingScores+j*SimilarityRankingScores+k*TagTermRankingScores;
                recall=mRecall(eva,train_label_va,5);
                if(recall>recallMax)
                    recallMax=recall;
                    alphe=i;
                    beta=j;
                    gamma=k;
                    disp(strcat('better performance and now alphe=',num2str(alphe),',beta=',num2str(beta),',gamma=',num2str(gamma)));
                end
            end
        end
    end
    TagCom_time(timei)=toc;
end