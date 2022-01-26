d2=load('cd_rca_iris1.mat');

key=[d2.cd_rca];
dt=key;
l=size(dt,2);
res=[];
for i=1:45
    for j=1:length(key)
      res(i,j)=test_pointssss(round(dt(i,j)*100),20);
    end
end
for i=1:5
    for j=6:45
     dist(i,j)=l-sum(res(i,1:l)==res(j,1:l));
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
