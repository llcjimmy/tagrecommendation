function retVal=mPrecision(output,label,topN)

N=size(output,2);
retVal=0;
for i=1:N
    retVal=retVal+computePrecision(label(:,i),output(:,i),topN);
end

retVal=retVal / N;

end