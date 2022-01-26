%
[g_score1]=brute_force();
[imp_score1,seq1]=imposter();
%range1=0.01:.001651:1;
range2=0.01:0.01:1;
% g_score11=normalise(g_score1); 
% imp_score11=normalise(imp_score1); 
g_score1_hist = histc(g_score1,range2);
imp_score1_hist = histc(imp_score1,range2);
g_score1_pdf = g_score1_hist;
imp_score1_pdf = imp_score1_hist;
figure(1),%plot(range1,g_score1_pdf, 'MarkerFaceColor','g');
plot(range2,g_score1_pdf,'-r','LineWidth',2,...
'MarkerEdgeColor','k',...
'MarkerFaceColor','g',...
'MarkerSize',3)
hold on;
plot(range2,imp_score1_pdf,'-k','LineWidth',2,...
'MarkerEdgeColor','k',...
'MarkerFaceColor','r',...
'MarkerSize',3)

%plotyy(range2,g_score1_pdf,range1,imp_score1_pdf,'plot');
xlabel('Matching Score distribution');
ylabel('Frequency');
title('Bruteforce analysis');
legend1 = sprintf('Bruteforce(mean = %.3f)', mean(g_score1));
legend2 = sprintf('Imposter(mean = %.3f)', mean(imp_score1));
legend({legend1, legend2});
hold off