X=[2000 4000 6000 8000 10000 12000 14000 16000];
Y=[5.9492 13.5709 22.8516 34.3951 46.8631 62.6442 79.4097 95.3152;
    7.7038 13.9708 20.7186 28.1178 35.4697 43.0725 49.6958 57.9460;
    143 340 616 958 1262 1734 2054 2533;
    281 647 1115 1578 2062 2591 3189 3793;
    146 688 1500 2947 4631 7523 9691 13634;
    100 176 266 332 412 499 588 665];

figure('units','normalized','position',[0.1,0.4,0.4,0.5]);
% grid on;
hold on;

plot(X,Y(1,:),'b^-','linewidth',2,'markersize',10);
plot(X,Y(2,:),'rs-','linewidth',2,'markersize',10);
plot(X,Y(3,:),'kv-','linewidth',2,'markersize',10);
plot(X,Y(4,:),'gd-','linewidth',2,'markersize',10);
plot(X,Y(5,:),'c*-','linewidth',2,'markersize',10);
plot(X,Y(6,:),'mo-','linewidth',2,'markersize',10);

set(gca,'XTickLabel',X);
set(gca,'yscale','log');

box on;

set(gca,'YMinorTick','off');

xlabel('# of training data','fontsize',15);
ylabel('Wall-clock time (second)','fontsize',15);

legend('MATAR','MATAR-fast','SVMSim','TagCombine','MLKNN','LDASim',2);

set(legend,'fontweight','bold');
