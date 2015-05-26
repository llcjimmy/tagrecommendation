X=[0.7122 0.6965 0.6770 0.6429 0.6267 0.6191 0.3671];
Y=[4686 2292 4760 6935 18862 1515 80];

figure('units','normalized','position',[0.1,0.4,0.4,0.5]);
% grid on;
hold on;

scatter(Y,X,170,'k','filled');

set(gca,'XTickLabel',{'0','4000','8000','12000','16000','20000'});
set(gca,'XTick',[0 4000 8000 12000 16000 20000]);
set(gca,'XAxisLocation','top');
set(gca,'YTickLabel',{'0.35','0.4','0.45','0.5','0.55','0.6','0.65','0.7','0.75'});
set(gca,'YTick',[0.35 0.4 0.45 0.5 0.55 0.6 0.65 0.7 0.75]);
set(gca,'FontSize',25);
box on;

xlabel('Wall-clock time (second)','fontsize',25);
ylabel('Recall@10','fontsize',25);

annotation('textarrow',[0.364185022026432 0.330440528634362],[0.758627858627859 0.74902286902287],'FontWeight','bold','FontSize',25,'String','MATAR');
annotation('textarrow',[0.261982378854626 0.234140969162997],[0.811995841995843 0.735571725571726],'FontWeight','bold','FontSize',25,'String','MATAR-fast');
annotation('textarrow',[0.367709251101322 0.332819383259913],[0.702099792099792 0.693284823284824],'FontWeight','bold','FontSize',25,'String','SVMSim');
annotation('textarrow',[0.449339207048458 0.415903083700443],[0.575675675675676 0.631413721413722],'FontWeight','bold','FontSize',25,'String','TagCombine');
annotation('textarrow',[0.828810572687228 0.855242290748902],[0.562016632016632 0.602991683991685],'FontWeight','bold','FontSize',25,'String','MLKNN');
annotation('textarrow',[0.235550660792952 0.206211453744494],[0.54004158004158 0.593201663201664],'FontWeight','bold','FontSize',25,'String','LDASim');
annotation('textarrow',[0.195638766519824,0.14920704845815],[0.266900207900208,0.225925155925156],'FontWeight','bold','FontSize',25,'String','Snaff');


