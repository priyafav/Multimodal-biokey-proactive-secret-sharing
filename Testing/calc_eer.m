%calculate EER
 [gen1,seq2]=genuinue();
 [impo1,seq3]=imposter();
 [EER, mTSR, mFAR, mFRR, mGAR] = computeperformance(gen1, impo1, 0.001);
 
 [muhat2,sigma2] = normfit(gen1);
% construct histogram
[F2,X2] = hist(gen1,80);
% get ready to plot as probability histogram
F2 = F2/trapz(X2,F2);
%bar(X,F); hold on;
% use muhat and sigma to construct pdf
x2 = muhat2-3*sigma2:0.0001:muhat2+3*sigma2;
% plot PDF over histogram
y2 = normpdf(x2,muhat2,sigma2);
%yyaxis right
plot(x2,y2,'g-*','linewidth',1);
hold on;

%pseudo imposter
[muhat3,sigma3] = normfit(impo1);
% construct histogram
[F11,X11] = hist(impo1,80);
% get ready to plot as probability histogram
F11 = F11/trapz(X11,F11);
%bar(X1,F1); hold on;
% use muhat and sigma to construct pdf
x11 = muhat3-3*sigma3:0.0001:muhat3+3*sigma3;
% plot PDF over histogram
y11 = normpdf(x11,muhat3,sigma3);
%yyaxis right
plot(x11,y11,'b-o','linewidth',1);

plotyy(x2,y2,x11,y11,'plot');
xlabel('Matching score');
ylabel('Frequency');

legend1 = sprintf('genuine(mean = %.03f)', mean(gen1));
legend2 = sprintf('imposter(mean = %.3f)', mean(impo1));
legend({legend1, legend2});