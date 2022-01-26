%%%%%%Quantisation%%%%%%%%%%%%%
function feature2=quantisation(feature1,quan_th)
feature2=[];
quanti=[];
u=468;
for i=1:u
    found=1; j=1;
    while (found && j)
        if((j-1)*quan_th <=abs(feature1(i)) && abs(feature1(i))<= j*quan_th)
            feature2(i)=j;
            
            quanti=[quanti,dec2bin((mod((feature2(i)-1),4)),2)];
            
            %quanti=[quanti,dec2bin((mod((feature2(i)-1),4)),2)];
            found=0;
        end
        j=j+1;
    end
end

end