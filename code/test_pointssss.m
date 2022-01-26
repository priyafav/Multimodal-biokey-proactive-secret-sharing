% x=156;
% D=10;
function r=test_pointssss(x,D)
flag=1;
i=0;
while(flag)
    t1=[];
    t2=[];
    t1=((D+1)*i); 
    t2=(((D+1)*i)+D); 
    
    if((t2 >= x)==1)
       if((t1 <= x)==1)
          r=((D/2)+t1);
          flag=0;
       end
    end
    i=i+1;
end
end


