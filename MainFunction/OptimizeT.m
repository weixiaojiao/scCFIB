function  [T] = OptimizeT (T,cellX,cellInp,prm)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

LoopCounter = 1;
NoChange =0;
done=0;

%% intial weights
Weights=ones(prm.m/2,1)*(1/(prm.m/2));

while ~done
    change=0;
    %% updating T
    for x=1:size(cellX{1},1)                % documents in every dataset should be same
        [tmp,t,inds_t]=ProcessTmp(cellInp,T,prm,x);
        if length(inds_t)>1,
            [tmp] =Reduce_x (tmp,t,inds_t,x,cellInp,prm);  %change every Pt and P(y,t)
            [cellCosts] =MergeCosts (tmp,prm);
            [~,new_t] =MinSumCosts(cellCosts,prm,Weights);
            if new_t==t
                NoChange= NoChange+1;
            else
                NoChange= 0;
                change= change+1;
                [T] =UpdateAssignment (T,x,new_t,tmp,prm);
            end
        end  %end if length
    end %end for x=1:
    [T, done] =CheckConvergence (T,prm,LoopCounter,change);
    LoopCounter= LoopCounter+1;
 
    for i=1:prm.m/2
       Weights(i)=1;
    end
% this also needed to be changed!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
for i=1:prm.m
    dd=T{i}.Pt ;
    PPt = repmat(dd,size(cellX{i},2),1);   % PPT is used to calculate P(t,y) in the next step
    Pty = T{i}.Py_t.*PPt;
    [aa,bb,cc] = MTC_local_MI (Pty,dd);
    T{i}.Ity=aa;
    T{i}.Hy=bb;
    T{i}.Ht=cc;
    T{i}.L = T{i}.Ity;
end

end
