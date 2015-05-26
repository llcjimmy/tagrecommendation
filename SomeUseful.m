[num_tag,~] = size(Count);
stat = zeros(10,1);
averTit = zeros(10,1);
averBod = zeros(10,1);
averTot = zeros(10,1);
for i = 1:num_tag
    if(Count(i,1) <= 10)
        stat(1,1) = stat(1,1) + 1;
        averTit(1,1) = averTit(1,1) + Count(i,2);
        averBod(1,1) = averBod(1,1) + Count(i,3);
        averTot(1,1) = averTot(1,1) + Count(i,4);
    end
    if(Count(i,1) <= 20)
        stat(2,1) = stat(2,1) + 1;
        averTit(2,1) = averTit(2,1) + Count(i,2);
        averBod(2,1) = averBod(2,1) + Count(i,3);
        averTot(2,1) = averTot(2,1) + Count(i,4);
    end
    if(Count(i,1) <= 30)
        stat(3,1) = stat(3,1) + 1;
        averTit(3,1) = averTit(3,1) + Count(i,2);
        averBod(3,1) = averBod(3,1) + Count(i,3);
        averTot(3,1) = averTot(3,1) + Count(i,4);
    end
    if(Count(i,1) <= 50)
        stat(4,1) = stat(4,1) + 1;
        averTit(4,1) = averTit(4,1) + Count(i,2);
        averBod(4,1) = averBod(4,1) + Count(i,3);
        averTot(4,1) = averTot(4,1) + Count(i,4);
    end
    if(Count(i,1) <= 70)
        stat(5,1) = stat(5,1) + 1;
        averTit(5,1) = averTit(5,1) + Count(i,2);
        averBod(5,1) = averBod(5,1) + Count(i,3);
        averTot(5,1) = averTot(5,1) + Count(i,4);
    end
    if(Count(i,1) <= 100)
        stat(6,1) = stat(6,1) + 1;
        averTit(6,1) = averTit(6,1) + Count(i,2);
        averBod(6,1) = averBod(6,1) + Count(i,3);
        averTot(6,1) = averTot(6,1) + Count(i,4);
    end
    if(Count(i,1) <= 250)
        stat(7,1) = stat(7,1) + 1;
        averTit(7,1) = averTit(7,1) + Count(i,2);
        averBod(7,1) = averBod(7,1) + Count(i,3);
        averTot(7,1) = averTot(7,1) + Count(i,4);
    end
    if(Count(i,1) <= 500)
        stat(8,1) = stat(8,1) + 1;
        averTit(8,1) = averTit(8,1) + Count(i,2);
        averBod(8,1) = averBod(8,1) + Count(i,3);
        averTot(8,1) = averTot(8,1) + Count(i,4);
    end
    if(Count(i,1) <= 2500)
        stat(9,1) = stat(9,1) + 1;
        averTit(9,1) = averTit(9,1) + Count(i,2);
        averBod(9,1) = averBod(9,1) + Count(i,3);
        averTot(9,1) = averTot(9,1) + Count(i,4);
    end
    if(Count(i,1) <= 250000)
        stat(10,1) = stat(10,1) + 1;
        averTit(10,1) = averTit(10,1) + Count(i,2);
        averBod(10,1) = averBod(10,1) + Count(i,3);
        averTot(10,1) = averTot(10,1) + Count(i,4);
    end
end
for j = 10:-1:2
    stat(j,1) = stat(j,1) - stat((j - 1),1);
    averTit(j,1) = (averTit(j,1) - averTit((j - 1),1)) / stat(j,1);
    averBod(j,1) = (averBod(j,1) - averBod((j - 1),1)) / stat(j,1);
    averTot(j,1) = (averTot(j,1) - averTot((j - 1),1)) / stat(j,1);
end
averTit(1,1) = averTit(1,1) / stat(1,1);
averBod(1,1) = averBod(1,1) / stat(1,1);
averTot(1,1) = averTot(1,1) / stat(1,1);