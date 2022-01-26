clc;
%[gen,seq]=pseudo_genuinue();
 [impo,seq1]=pseudo_imposter(); 
 [gen1,seq2]=genuinue();
 [impo1,seq3]=imposter();
[muhat1,sigma1] = normfit(impo);
% construct histogram
[F1,X1] = hist(impo,80);
% get ready to plot as probability histogram
F1 = F1/trapz(X1,F1);
%bar(X1,F1); hold on;
% use muhat and sigma to construct pdf
x1 = muhat1-3*sigma1:0.01:muhat1+3*sigma1;
% plot PDF over histogram
y1 = normpdf(x1,muhat1,sigma1);
%yyaxis left
plot(x1,y1,'b-*','linewidth',2);
hold on;

%pseudo-genuine
[muhat2,sigma2] = normfit(gen1);
% construct histogram
[F2,X2] = hist(gen1,80);
% get ready to plot as probability histogram
F2 = F2/trapz(X2,F2);
%bar(X,F); hold on;
% use muhat and sigma to construct pdf
x2 = muhat2-3*sigma2:0.01:muhat2+3*sigma2;
% plot PDF over histogram
y2 = normpdf(x2,muhat2,sigma2);
%yyaxis right
plot(x2,y2,'g-o','linewidth',2);
hold on;

%pseudo imposter
[muhat3,sigma3] = normfit(impo1);
% construct histogram
[F11,X11] = hist(impo1,80);
% get ready to plot as probability histogram
F11 = F11/trapz(X11,F11);
%bar(X1,F1); hold on;
% use muhat and sigma to construct pdf
x11 = muhat3-3*sigma3:0.01:muhat3+3*sigma3;
% plot PDF over histogram
y11 = normpdf(x11,muhat3,sigma3);
%yyaxis right
plot(x11,y11,'y-o','linewidth',2);
hold on;

xlabel('Matching score');
ylabel('Frequency');

legend2 = sprintf('Pseudo-imposter(mean = %.3f)', mean(impo));
legend3 = sprintf('genuine(mean = %.01f)', mean(gen1));
legend4 = sprintf('imposter(mean = %.3f)', mean(impo1));
legend({legend2,legend3,legend4});