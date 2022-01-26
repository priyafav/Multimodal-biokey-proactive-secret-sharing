%Pseudo-genuniue scores:
function [gen,sequence]=pseudo_genuinue()
d2=load('DB2004.mat');
key=[d2.X];
d3=load('utiris_2004DB_1.mat');
key1=[d3.cd_rca];
gen=[];
sequence=[];
 for i = 1:9
    combination = nchoosek(1:5, 2);    
     for j = 1:length(combination)
        file1 = combination(j,:);
        sequence=[sequence;[(i-1)*5+file1(1) ,(i-1)*5+file1(2)]];
        template1=key((i-1)*5+file1(1),:);
      
        template2=key1((i-1)*5+file1(2),:);
       
        C2=template_match1(template1,template2);
        similiraty=C2;
        gen = [gen; similiraty];
     end
 end
end