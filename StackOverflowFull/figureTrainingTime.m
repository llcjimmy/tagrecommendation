X=[12.5 25 37.5 50 62.5 75 87.5 100];
Y=[1746 5613 10676 16281 20142 24075 28734 31621];

figure('units','normalized','position',[0.1,0.4,0.6,0.5]);
hold on;

plot(X,Y(1,:),'ko-','linewidth',5,'markersize',20);

set(gca,'XTick',X);
set(gca,'XTickLabel',{'12.5%','25%','37.5%','50%','62.5%','75%','87.5%','100%'});
set(gca,'FontSize',20);
% set(gca,'yscale','log');

box on;

set(gca,'YMinorTick','off');

xlabel('Percentage of the entire SO data','fontsize',20);
ylabel('Wall-clock time (second)','fontsize',20);

