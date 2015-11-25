function precision=computePrecision(real, predict,topN)
% real is {0,1} vector
% predict is [0,1] vector
% topN is 10

[t,ind] = sort(predict,'descend');
prec_sum = 0;
for i=1:topN
    if real(ind(i)) == 1
        prec_sum = prec_sum + 1;
    end
end

precision = prec_sum / topN;

end