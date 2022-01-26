feature1=[];
feature=[];
temp=[];
quan_th=0;
d1=load('ubiris1_2006DB_1.mat');
l=1; u=468;
feature_vector=[];
for k=1:5:45
%load(['1' '_'  '4.mat']);%reference 1_4/2_4
feature(:,1)=d1.cd_rca(k,1:u);
temp(:,1)=feature(:,1);
j=1;th=0.7;
for i=k+1:k+4
   %load(['1' '_' num2str(i) '.mat']); %1_5,1_6,1_7,1_8/2_5,2_6,2_7,2_8
   temp(:,2)=d1.cd_rca(i,1:u);
  %for k=1:299
      temp(:,3)=norm((temp(:,1)-temp(:,2)))/(norm(temp(:,1))+norm(temp(:,2)));
      %abs((temp(k,1)-temp(k,2))/2);         
  %end
  max_val=max(temp(:,3));
  if (max_val < th)     
     j=j+1;
     feature(:,j)=temp(1:u,2);
  end
end
for k=1:u
    feature1(k)=mean(feature(k,:));
    temp(k,4)=max(feature(k,:));
    temp(k,5)=min(feature(k,:));
    temp(k,6)=mean(feature(k,:));
    mx_me=temp(k,4)-temp(k,6);
    me_mn=temp(k,6)-temp(k,5);
    quan_th=max(mx_me,me_mn);
end
feature_vector=[feature_vector;feature1];
quant_th_r(l)=quan_th;
l=l+1;
end



