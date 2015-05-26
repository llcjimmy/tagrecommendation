X=[5000 10000 15000 20000 25000 30000];
Y=[15.4170 37.5725 71.8950 119.6159 169.1130 253.7316;
    25.3546 44.5316 63.1408 81.1270 98.6076 117.0602;
    751 1915 3287 4855 6560 10472;
    1151 2516 3993 5609 7297 9337;
    1030 5020 11533 20610 32784 50413;
    258 496 741 980 1220 1456];

figure('units','normalized','position',[0.1,0.4,0.4,0.5]);
%grid on;
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

legend('MATAR','MATAR-fast','SVMSim','TagCombine','MLKNN','LDASim',0);

set(legend,'fontweight','bold');
