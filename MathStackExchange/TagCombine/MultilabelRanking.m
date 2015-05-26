function MultilabelRankingScores = MultilabelRanking(model, test_data)
% The first component about multi label score

% compute multi label score

    [num_term,num_testing]=size(test_data);
    [num_class]=size(model);
    MultilabelRankingScores=zeros(num_class,num_testing);
    
    for i=1:num_class
        re=model{i,1}.posterior(test_data');
        if(size(re,2)~=2)
            disp(strcat('error predict for label:',num2str(i)));
            MultilabelRankingScores(i,:)=ones(1,num_testing)-re(:,1)';
        else
            MultilabelRankingScores(i,:)=re(:,2)';
        end
%         MultilabelRankingScores(i,:)=re(:,2)';
%         [Pre_Labels(:,i),~,Outputs(:,i)]=svmpredict(test_label(i,:)',test_data',model(i));
    end