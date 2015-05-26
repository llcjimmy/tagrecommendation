X=[0.5871 0.5531 0.3803 0.4936 0.4476 0.4402 0.2586];
Y=[1455 781 3332 4161 5773 679 40];

figure('units','normalized','position',[0.1,0.4,0.4,0.5]);
% grid on;
hold on;

scatter(Y,X,170,'k','filled');

set(gca,'ylim',[0.25 0.6]);
set(gca,'XTickLabel',{'0','1000','2000','3000','4000','5000','6000'});
set(gca,'XTick',[0 1000 2000 3000 4000 5000 6000]);
set(gca,'XAxisLocation','top');
set(gca,'YTickLabel',{'0.25','0.3','0.35','0.4','0.45','0.5','0.55','0.6'});
set(gca,'YTick',[0.25 0.3 0.35 0.4 0.45 0.5 0.55 0.6]);
set(gca,'FontSize',25);
box on;

xlabel('Wall-clock time (second)','fontsize',25);
ylabel('Recall@10','fontsize',25);

annotation('textarrow',[0.372114537444934 0.337488986784142],[0.840324543610548 0.849590820341329],'FontWeight','bold','FontSize',25,'String','MATAR');
annotation('textarrow',[0.269555066079295 0.2452237885462557],[0.692967545638945 0.774882251732151],'FontWeight','bold','FontSize',25,'String','MATAR-fast');
annotation('textarrow',[0.605286343612337 0.570396475770928],[0.360903037535897 0.392088068720929],'FontWeight','bold','FontSize',25,'String','SVMSim');
annotation('textarrow',[0.612466960352425 0.65903083700441],[0.605249712186832 0.645987757924878],'FontWeight','bold','FontSize',25,'String','TagCombine');
annotation('textarrow',[0.842026431718067 0.868458149779741],[0.466483163456794 0.517458215431847],'FontWeight','bold','FontSize',25,'String','MLKNN');
annotation('textarrow',[0.26431718061674 0.227929515418503],[0.460787018255578 0.521838580037364],'FontWeight','bold','FontSize',25,'String','LDASim');
annotation('textarrow',[0.177162995594714 0.14873127753304],[0.198786617636516 0.147811565661464],'FontWeight','bold','FontSize',25,'String','Snaff');


