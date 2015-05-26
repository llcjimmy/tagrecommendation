X=[0.2470 0.3932;0.2993 0.4836];

figure('units','normalized','position',[0.1,0.4,0.6,0.5]);
% grid on;
hold on;

bar(X,'grouped');

set(gca,'ylim',[0.2 0.5]);
set(gca,'XTickLabel',{'Recall@5','Recall@10'});
set(gca,'XTick',[1 2 3 4]);
set(gca,'FontSize',25);
% set(gca,'YTickLabel',{'0.25','0.3','0.35','0.4','0.45','0.5','0.55','0.6'});
% set(gca,'YTick',[0.25 0.3 0.35 0.4 0.45 0.5 0.55 0.6]);
box on;

% xlabel('Methods','fontsize',15);
% ylabel('Recall@10','fontsize',15);

legend('Snaff','MATAR-fast',2);

set(legend,'fontweight','bold');