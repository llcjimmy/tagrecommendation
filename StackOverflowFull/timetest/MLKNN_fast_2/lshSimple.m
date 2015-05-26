function T = lshSimple(numOfBucket, dataFeatureSize, data)
% numOfBucket: num of random vectors
% dataFeatureSize: data feature dim
% data: data(instance*feature)

    [numOfIns, dim] = size(data);
    disp(strcat('data size:',num2str(numOfIns),'*',num2str(dim)));
    Bucket = cell(2^numOfBucket,1);
    if(dataFeatureSize~=dim)
        disp('dim not match!');
    end
    
    randomVec = zeros(numOfBucket, dataFeatureSize);
    for i = 1:numOfBucket
        randomVec(i,:)=round(rand(1,dataFeatureSize)*100-50);
    end
    disp('randomVec generated over!');
    
    tempMatrix = data * randomVec';
    tempMatrix = (tempMatrix>=0);
    
    for i = 1:numOfIns
%         if(mod(i,100)==0)
%             disp(strcat('computing lsh for instance:',num2str(i)));
%             toc;
%         end
        id = 1;
        for j = 1:numOfBucket
%             if(dot(data(i,:),randomVec(j,:))>=0)
%                 temp = 1;
%             else
%                 temp = 0;
%             end
            id = id + tempMatrix(i,j)*2^(j-1);
        end
        Bucket{id,1}=[Bucket{id,1} i];
    end

    T.ranV = randomVec;
    T.buck = Bucket;
    