function [co,new_t] =MinSumCosts(cellCosts,prm,Weights)
% sums=cellCosts{1};
% sums=sums+(1-prm.gama)*cellCosts{prm.m};
sums=0;
for i=1:prm.m/2
sums=sums+Weights(i)*(cellCosts{i}+(1-prm.gama)*cellCosts{i+prm.m/2});
end
[co,new_t]=min(sums);
end
