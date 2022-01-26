%genuniue scores:
function [genuine,sequence]=genuinue()
d2=load('DBubiris22006.mat');

key1=[d2.X];
genuine=[];
sequence=[];
 for i = 1:9
    combination = nchoosek(1:5, 2);    
     for j = 1:length(combination)
        file1 = combination(j,:);
        sequence=[sequence;[(i-1)*5+file1(1) ,(i-1)*5+file1(2)]];
        template1=key1((i-1)*5+file1(1),:);
      
        template2=key1((i-1)*5+file1(2),:);
       
        C2=template_match1(template1,template2);
        
        similiraty=C2;
        genuine = [genuine; similiraty];
     end
 end
end
