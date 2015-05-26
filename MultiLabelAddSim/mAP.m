function retVal=mAP(output,label)

N=size(output,2);
retVal=0;
for i=1:N
    retVal=retVal+computeAP(label(:,i),output(:,i));
end

retVal=retVal / N;

end