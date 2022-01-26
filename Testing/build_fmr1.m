% GENERATING FMR AND FNMR DATA
function  build_fmr1( )
    load('casia_2002_db_1.mat');
    resl_rt_two=cd_rca;
    P=45;
    fmr=zeros(100,P); fnmr=zeros(100,P);
    for p=1:P
        ffnew=resl_rt_two(p,:);
        S=zeros(100,1);
        for i=1:45
            %second=['10' num2str(fix((i-1)/8)+1) '_' num2str(mod(i-1,8)+1)];
            S(i)=template_match1(ffnew,resl_rt_two(i,:));
           % fprintf(['\b\b' num2str(i)]);
        end
        gt=[1 2 3 4 5]+(fix((p-1)/5)*5); k=0;
        for a=0.01:.001651:1
            k=k+1; s=0;
            g=find(S>a);
            for i=1:length(gt)
                s=s+sum(g==gt(i));
            end
            fmr(k,p)=(length(g)-s)/100;
            fnmr(k,p)=1-s/5;
        end
    end
    save('fmr1.mat','fmr');
    save('fnmr1.mat','fnmr');
end