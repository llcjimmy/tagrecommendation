function T = lshSimple(numOfBucket, dataFeatureSize, data)
% numOfBucket: num of random vectors
% dataFeatureSize: data feature dim
% data: data(instance*feature)

    [numOfIns, dim] = size(data);
    Bucket = cell(2^numOfBucket,1);
    if(dataFeatureSize~=dim)
        disp('dim not match!');
    end
    
    randomVec = zeros(numOfBucket, dataFeatureSize);
    for i = 1:numOfBucket
        randomVec(i,:)=round(rand(1,dataFeatureSize)*100-50);
    end
    
    for i = 1:numOfIns
        id = 1;
        for j = 1:numOfBucket
            if(dot(data(i,:),randomVec(j,:))>=0)
                temp = 1;
            else
                temp = 0;
            end
            id = id + temp*2^(j-1);
        end
        Bucket{id,1}=[Bucket{id,1} i];
    end

    T.ranV = randomVec;
    T.buck = Bucket;
    