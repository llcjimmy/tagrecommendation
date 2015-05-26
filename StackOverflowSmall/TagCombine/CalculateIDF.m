function [IDF]=CalculateIDF(train_data)
% The second component about similarity
%   
%   calculate the idf

    [~,num_training]=size(train_data);
    df=sum((train_data~=0),2);
    
    df(df==0)=num_training;
    
    IDF=log(num_training ./ df);