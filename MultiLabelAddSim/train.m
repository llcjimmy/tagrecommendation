function [omageFinal]=train(train_data,train_label,L,TC,GammaS,Mu,GammaA,GammaB,max_iter,n,FeaNum,T,lambda)

%% Initialization
i=0;
omagePast=rand(FeaNum,T);
omage=omagePast;
costPast=1/n/T*norm((omagePast'*train_data-train_label),'fro')^2+GammaS/(T^2)*norm(omagePast,'fro')^2+Mu*GammaS/(T^3)*norm(omagePast*ones(T,1),'fro')^2+GammaA/(T^2)*trace(omagePast'*train_data*L*train_data'*omagePast)+GammaB/(T^2)*trace(train_data'*omagePast*TC*omagePast'*train_data);

%% Iteration
while i<max_iter
    i=i+1;
    disp(strcat('train at the  ',num2str(i),'th iteration'));
    grad=2/n/T*(train_data*train_data')*omage-2/n/T*train_data*train_label'+GammaS/(T^2)*2*omage+Mu*GammaS/(T^3)*2*omage*ones(T,T)+GammaA/(T^2)*2*(train_data*L*train_data')*omage+GammaB/(T^2)*2*(train_data*train_data')*omage*TC;
    omage=omage-lambda*grad;
    cost=1/n/T*norm((omage'*train_data-train_label),'fro')^2+GammaS/(T^2)*norm(omage,'fro')^2+Mu*GammaS/(T^3)*norm(omage*ones(T,1),'fro')^2+GammaA/(T^2)*trace(omage'*train_data*L*train_data'*omage)+GammaB/(T^2)*trace(train_data'*omage*TC*omage'*train_data);
    convergence=abs(costPast-cost);
    disp(strcat('--------costPast:',num2str(costPast)));
    disp(strcat('--------cost:',num2str(cost)));
    disp(strcat('--------convergence:',num2str(convergence)));
    if convergence<(1e-5)
        disp(strcat('end at the ',num2str(i),'th iteration'));
        break;
    end
    costPast=cost;
    omagePast=omage;
end

%% Prepare for return
if i==max_iter
    warning('reach maximum iteration~~do not converge!!!');
end
omageFinal=omage;
