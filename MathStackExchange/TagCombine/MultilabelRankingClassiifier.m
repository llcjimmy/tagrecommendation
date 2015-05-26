function model=MultilabelRankingClassiifier(train_data,train_target)
% The first component about multi label classifier

% train the classifiers

    [num_class,~]=size(train_target);
    [num_term,~]=size(train_data);
    
    model=cell(num_class,1);
    
    for i=1:num_class
        if(mod(i,100)==0)
            disp(strcat('training nb for label:',num2str(i)));
        end
        model{i,1}=NaiveBayes.fit(train_data',train_target(i,:)','Distribution','mn');
%         model(i)=svmtrain(train_target(i,:)',train_data');
    end