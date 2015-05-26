function nnlsh = lshLookupTwo(originData, data, T, numOfNei)

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
        idTemp = Bucket{id,1};
        foundData = originData(idTemp',:);
        dist_matrix=zeros(1,size(idTemp,2));
        for distan=1:size(idTemp,2)
            dist_matrix(1,distan)=dot(foundData(distan,:), data) / norm(foundData(distan,:)) / norm(data);
        end
        [~,index]=sort(dist_matrix(1,:),'descend');
        
        nnlsh = idTemp(:,index(1:numOfNei));
    else
        nnlsh = Bucket{id,1};
        if(id == 1)
            idTemp = Bucket{id+1,1};
            foundData = originData(idTemp',:);
            dist_matrix=zeros(1,size(idTemp,2));
            for distan=1:size(idTemp,2)
                dist_matrix(1,distan)=dot(foundData(distan,:), data) / norm(foundData(distan,:)) / norm(data);
            end
            [~,index]=sort(dist_matrix(1,:),'descend');

            nnlsh = [nnlsh,idTemp(:,index(1:numOfNei-size(Bucket{id,1},2)))];
        else
            idTemp = Bucket{id-1,1};
            foundData = originData(idTemp',:);
            dist_matrix=zeros(1,size(idTemp,2));
            for distan=1:size(idTemp,2)
                dist_matrix(1,distan)=dot(foundData(distan,:), data) / norm(foundData(distan,:)) / norm(data);
            end
            [~,index]=sort(dist_matrix(1,:),'descend');

            nnlsh = [nnlsh,idTemp(:,index(1:numOfNei-size(Bucket{id,1},2)))];
        end
    end