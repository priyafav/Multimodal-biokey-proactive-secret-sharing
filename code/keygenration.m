%%%%key_generation%%%%%%%%%%
d1=load('ubiris1_2006DB_1.mat');

feature_new=[];
u=468;
l=1;
for k=1:5:45
 quan_th =quant_th_r(l);
 feature2=quantisation(feature_vector(l,:),quan_th);
for i=k:k+4
   feature_new2=[];
   
   v=[];
   temp1=[];
  % load(['1' '_' num2str(i) '.mat']);
   temp1(:,1)=d1.cd_rca(i,1:u);
   feature_new2=quantisation(temp1(:,1),quan_th);
   for j=1:u
       if(mod((feature_new2(j)-1),4)==mod((mod((feature2(j)-1),4))-1,4))
          v(j)=0;
          temp1(j,2)=abs(temp1(j,1))+quan_th;
       elseif(mod((feature_new2(j)-1),4)==mod((mod((feature2(j)-1),4))+1,4))
          v(j)=1;
          temp1(j,2)=abs(temp1(j,1))-quan_th;
       else
          v(j)=2;
          temp1(j,2)=abs(temp1(j,1));
       end
   end
  % feature_final(:,i)=round(abs(temp1(:,2)),0);
   feature_new(:,i)=quantisation(temp1(:,2),quan_th);
end
l=l+1;
%feature_final=[feature_final,feature_new];
end
X=feature_new';
for i=1:45
    for j=1:45
         diste(i,j)=1-norm(X(i,:)-X(j,:))/(norm(X(i,:))+norm(X(j,:)));
    end
end