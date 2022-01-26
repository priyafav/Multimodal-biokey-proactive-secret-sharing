function [impo,sequence]=pseudo_imposter()
d2=load('DB2004.mat');
key=[d2.X];
d3=load('utiris_2004DB_1.mat');
key1=[d3.cd_rca];
impo=[];
sequence=[];
combination = nchoosek(1:9, 2);
for i = 1:5
    for j = 1:length(combination)
        file1 = combination(j,:);
        sequence=[sequence;[5*(file1(1)-1)+i ,5*(file1(2)-1)+i]];
        template1=key(5*(file1(1)-1)+i,:);
        template2=key1(5*(file1(2)-1)+i,:);
        C2=template_match1(template1,template2);
        similiraty=C2;
        impo = [impo; similiraty];
    end
end
end