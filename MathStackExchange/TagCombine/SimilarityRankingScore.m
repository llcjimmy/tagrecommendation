function [SimilarityRankingScores]=SimilarityRankingScore(train_data,train_target,test_data)
% The second component about similarity
%   
%   calculate the similarity ranking scores

    [IDF]=CalculateIDF(train_data);
    
%   represent the data as TFIDF vector
    
    totalTF=sum(train_data,1);
    
    [num_term,num_training]=size(train_data);
    
    train_TFIDF=zeros(num_term,num_training);
    
    for i=1:num_training
        train_TFIDF(:,i)=train_data(:,i) / totalTF(i) .* IDF;
    end
    
    totalTF=sum(test_data,1);
    
    [num_term,num_testing]=size(test_data);
    
    test_TFIDF=zeros(num_term,num_testing);
    
    for i=1:num_testing
        test_TFIDF(:,i)=test_data(:,i) / totalTF(i) .* IDF;
    end
    
%   calculate the distance
    
    dist_matrix=zeros(num_testing,num_training);
    
    for i=1:num_testing
        testvector=test_TFIDF(:,i);
        for j=1:num_training
            trainvector=train_TFIDF(:,j);
            dist_matrix(i,j)=testvector' * trainvector / norm(testvector) / norm(trainvector);
        end
    end
    
%   Find neighbors of each testing instance
    Neighbors=cell(num_testing,1); %Neighbors{i,1} stores the Num neighbors of the ith testing instance
    for i=1:num_testing
        [~,index]=sort(dist_matrix(i,:));
        Neighbors{i,1}=index(1:50);
    end
    
%   Computing Outputs
    [num_class,~]=size(train_target);
    SimilarityRankingScores=zeros(num_class,num_testing);
    for i=1:num_testing
        neighbor_labels=[];
        for j=1:50
            neighbor_labels=[neighbor_labels,train_target(:,Neighbors{i,1}(j))];
        end
        vote=sum(neighbor_labels,2);
        totalvote=sum(vote);
        SimilarityRankingScores(:,i)=vote / totalvote;
    end