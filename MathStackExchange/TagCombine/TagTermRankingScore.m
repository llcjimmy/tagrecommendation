function [TagTermRankingScores]=TagTermRankingScore(test_data,Aff)
% The third component about Tag-Term co-occurrence
%   
%   calculate the tag-term ranking scores


    [num_term,num_testing]=size(test_data);
    [num_class,~]=size(Aff);
    
    TagTermRankingScores=zeros(num_class,num_testing);
    
    for se=1:num_testing
        vector=test_data(:,se)';
        for tag=1:num_class
            sum=1;
            for t=1:num_term
                if(vector(t)~=0)
                    sum=sum*(1-Aff(tag,t));
                end
            end
            TagTermRankingScores(tag,se)=1-sum;
        end
    end