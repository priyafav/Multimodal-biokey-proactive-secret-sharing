function [impo1]=brute_force()
r1=0;
r2=1;
d2=load('ubiris1_2004DB_1.mat');
key1=[d2.cd_rca];
impo1=[];
sequence=[];
for i = 1:45
    similiraty=[];
    template1=key1(i,:);
    for j=1:100
     rng(j)
     template2=double(rand(1,length(key1))>0.5);
     C2=template_match1(template1,template2);
     similiraty=[similiraty,C2];
    end
     impo1 = [impo1; max(similiraty)];
 end
end