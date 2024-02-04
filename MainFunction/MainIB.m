function [CR,T] = MainIB(cellX, label, m,Tsize, beta, gama, Restarts, UniformPrior, CentroidFigs)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

format compact

%init function
[prm]=Initparameters(m,Tsize, beta, gama, Restarts, UniformPrior, CentroidFigs);
[cellInp]=ProcessInput(cellX,prm);


%main loop
CR=zeros(Restarts,size(cellX{1},1)); %clustering result
ari_values =zeros(1,Restarts); 
T_result = []; 
% bestL=-inf;

for RS=1:prm.Restarts
%     fprintf ('Restart number %d....\n',RS);
    [tmpT]= RandomPartition(cellX,cellInp,prm);
    [tmpT] = OptimizeT (tmpT,cellX,cellInp,prm);
    
    CR(RS,:)=tmpT{1}.Pt_x;
    T_result = [T_result,tmpT]; 
    ari_values(RS) = func_ari(label,tmpT{1}.Pt_x);
end

% produce centroid figures (optional)

%  Last updates
% for i=1:prm.m
% cellT{i}.Ity_div_Ixy = cellT{i}.Ity(end)/cellInp{i}.Ixy;
% cellT{i}.Ht_div_Hx = cellT{i}.Ht(end)/cellInp{i}.Hx;
% end

% return the best result
[M ,I] = max(ari_values);
T = T_result(:,I);

end

