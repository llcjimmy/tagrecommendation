%% STEP 0: Load Data, Set Default Param
clear;

addpath('../');
dataname='stackoverflow.mat';
load(dataname);
[N,~]=size(label);
indexperm=randperm(N);
feature=feature(indexperm(1:5000),:);
label=label(indexperm(1:5000),:);
feature=full(feature);
label=full(label);
feature(:,all(feature==0,1))=[];
label(:,all(label==0,1))=[];

[COEFF,SCORE,LATENT]=pca(feature,'Centered',false);
feature=SCORE(:,(cumsum(LATENT)./sum(LATENT))<=0.95);

[N,T]=size(label);
[N,FeaNum]=size(feature);

n=N*0.9;

train_data=feature(1:n,:)';
train_label=label(1:n,:)';
test_data=feature(n+1:N,:)';
test_label=label(n+1:N,:)';

% dataname='Arts.mat';
% load(dataname);
% [n,T]=size(train_target);
% [n,FeaNum]=size(train_data);
% train_target(train_target==-1)=0;
% test_target(test_target==-1)=0;
% train_data=train_data';
% train_label=train_target';
% test_data=test_data';
% test_label=test_target';

disp('data load and split');

TagCo=sparse(T,T);
for i=1:T
    for j=1:T
        Ui=train_label(i,:);
        Uj=train_label(j,:);
        intersection=Ui*Uj';
        normi=norm(Ui,1);
        normj=norm(Uj,1);
        if(normi + normj - intersection ~= 0)
            TagCo(i,j)=intersection / (normi + normj - intersection);
        end
    end
end
TD=diag(ones(1,T)*TagCo);
TC=TD-TagCo;

disp('label similarity');

K=train_data'*train_data;
NormK=sqrt(diag(K));
NormW=repmat(NormK,1,n);
W=K ./ NormW ./ NormW';
W(isnan(W))=0;

% W=sparse(n,n);
% for i=1:n
%     for j=1:n
%         Ui=train_data(:,i);
%         Uj=train_data(:,j);
%         normi=norm(Ui,2);
%         normj=norm(Uj,2);
%         if(normi ~= 0 && normj ~= 0)
%             W(i,j)=dot(Ui,Uj) / normi / normj;
%         end
%     end
% end
D=diag(W*ones(n,1));
L=D-W;

disp('instance similarity');

GammaS=0.09;   %set the param
Mu=0;       %set the param[-1,0]
GammaA=0;   %set the param
GammaB=0;   %set the param

lambda=0.01;  %set the param

max_iter=10000;

%% STEP 1: Training
disp('---------Training: ---------');

%[omageFinal]=train(train_data,train_label,L,TC,GammaS,Mu,GammaA,GammaB,max_iter,n,FeaNum,T,lambda);
[omageFinal]=trainLogistic(train_data,train_label,L,TC,GammaS,Mu,GammaA,GammaB,max_iter,n,FeaNum,T,lambda);

%% STEP 2: Evaluation
disp('---------Result: ---------');

result=omageFinal'*test_data;

AP=AveragePrecision(result',test_label');

mAP(result,test_label);

mRecall(result,test_label,5)
mRecall(result,test_label,10)
mRecall(result,test_label,20)

disp(['The average precision for the test instances is: ' num2str(AP)]);