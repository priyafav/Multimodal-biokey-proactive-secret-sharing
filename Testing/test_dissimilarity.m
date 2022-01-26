d2=load('casia_2002_db_1.mat');

key1=[d2.cd_rca];
%key=[d.cd4(:,1:333);d1.cd4(:,1:333);d2.cd4(:,1:333);d3.cd4(:,1:333);d4.cd4(:,1:333)];
% d=load('cd3db2_b.mat');
% d1=load('delunay1.mat');
% d2=load('cd3.mat');
% dt=[cd3,d.cd3,d1.cd3,d2.cd3];
dt=key1;
l=size(dt,2);
for i=1:5
    for j=6:45
     dist(i,j)=l-sum(dt(i,1:l)==dt(j,1:l));
    end
end

% for i=9:18
%     for j=19:72
%      dist(i,j)=sum(cd3(i,:)==cd3(j,:));
%     end
% end

ds=dist(find(dist~=0));
histfit(ds); hold on
xlabel('Hamming distance(inter-class)');
ylabel('Frequency');
title('Dissimilarity analysis');
% [f,xi] = ksdensity(ds);
% hold on
% plot(xi,f)
% hist(dist,452);
% yourChargeArray=dist;
% histogram(yourChargeArray); % Display histogram
% countOfCharges = sum(yourChargeArray(:) ~= 0)
% totalCharges = sum(yourChargeArray(:))
% averageChargeValue = mean(yourChargeArray(:));
% maxChargeValue = max(yourChargeArray(:));