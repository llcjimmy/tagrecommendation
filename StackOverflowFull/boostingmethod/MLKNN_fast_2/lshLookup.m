function nnlsh = lshLookup(data, T, numOfNei)

    randomVec = T.ranV;
    Bucket = T.buck;
    [numOfBucket,~]=size(randomVec);
    
    tempMatrix = data * randomVec';
    tempMatrix = (tempMatrix>=0);
    
    id = 1;
    for j = 1:numOfBucket
%         if(dot(data,randomVec(j,:))>=0)
%         	temp = 1;
%         else
%         	temp = 0;
%         end
    	id = id + tempMatrix(j)*2^(j-1);
    end
    
    if(size(Bucket{id,1},2)>=numOfNei)
        indexperm=randperm(size(Bucket{id,1},2));
        nnlsh = Bucket{id,1}(:,indexperm(1:numOfNei));
    else
        nnlsh = Bucket{id,1};
        if(id == 1)
            indexperm=randperm(size(Bucket{id+1,1},2));
            nnlsh = [nnlsh,Bucket{id+1,1}(:,indexperm(1:numOfNei-size(Bucket{id,1},2)))];
        else
            indexperm=randperm(size(Bucket{id-1,1},2));
            nnlsh = [nnlsh,Bucket{id-1,1}(:,indexperm(1:numOfNei-size(Bucket{id,1},2)))];
        end
    end