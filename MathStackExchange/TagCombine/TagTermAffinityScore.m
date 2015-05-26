function [Aff]=TagTermAffinityScore(train_data,train_target)
% The third component about Tag-Term co-occurrence
%   
%   calculate the tag-term affinity scores


    [num_class,~]=size(train_target);
    [num_term,~]=size(train_data);
    
    Aff=zeros(num_class,num_term);
    
    ntag=sum(train_target,2);
    
    for tag=1:num_class
        if(mod(tag,100)==0)
            disp(strcat('calculating aff for label:',num2str(tag)));
        end
        for t=1:num_term
            vector=train_target(tag,:) .* train_data(t,:);
            nttag=sum(vector~=0);
            if(ntag(tag)~=0)
                Aff(tag,t)=nttag / ntag(tag);
            else
                Aff(tag,t)=0;
            end
        end
    end