X=[1000 1200 1400 1600 1800];
Y=[2373 2844 3315 3795 4266;
    1101 1297 1545 1768 1977;
    964 1156 1348 1545 1734;
    929 1088 1265 1439 1624;
    1729 2075 2419 2766 3114;
    403 485 557 638 711];
Z=[117;
71;
2825;
4672;
15397;
755];

Z=[Z Z Z Z Z];
Y=Y+Z;
% M=[X;X;X;X;X;X];
% Y=Y ./ M;

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
% set(gca,'yscale','log');

box on;

set(gca,'YMinorTick','off');

xlabel('# of testing data','fontsize',15);
ylabel('Wall-clock time (second)','fontsize',15);

legend('MATAR','MATAR-fast','SVMSim','TagCombine','MLKNN','LDASim',2);

set(legend,'fontweight','bold');
