%
[g_score1,seq]=genuinue();
[imp_score1,seq1]=pseudo_imposter();
[imp_score2,seq2]=imposter();
range1=0.1:.01:1;
%range1=0:0.1:1;
g_score1_hist = histc(g_score1,range1);
imp_score1_hist = histc(imp_score1,range1);
imp_score2_hist=histc(imp_score2,range1);
g_score1_pdf = g_score1_hist;
imp_score1_pdf = imp_score1_hist;
imp_score2_pdf = imp_score2_hist;

figure(1),%plot(range1,g_score1_pdf, 'MarkerFaceColor','g');
plot(range1,g_score1_pdf,'-r','LineWidth',2,...
'MarkerEdgeColor','k',...
'MarkerFaceColor','g',...
'MarkerSize',3)
hold on;
plot(range1,imp_score1_pdf,'-k','LineWidth',2,...
'MarkerEdgeColor','k',...
'MarkerFaceColor','r',...
'MarkerSize',3)
xlabel('Matching Score distribution');
ylabel('frequency');

hold on;
plot(range1,imp_score2_pdf,'-g','LineWidth',2,...
'MarkerEdgeColor','k',...
'MarkerFaceColor','r',...
'MarkerSize',3)

xlabel('Matching Score distribution');
ylabel('Frequency');

title('Revocability analysis');
legend1 = sprintf('Genuine(mean = %.03f)', mean(g_score1));
legend2 = sprintf('Pseudo-imposter(mean = %.3f)', mean(imp_score1));
legend3 = sprintf('Imposter(mean = %.3f)', mean(imp_score2));
%legend({legend1, legend2,legend3},'Orientation','horizontal','Location','best');
legend({legend1, legend2,legend3});
hold off