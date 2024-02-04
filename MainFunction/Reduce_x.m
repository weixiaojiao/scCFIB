function [tmp] =Reduce_x (tmp,t,inds_t,x,cellInp,prm)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

for i=1:prm.m           
tmp{i}.Pt(t) = tmp{i}.Pt(t)-tmp{i}.Px;
inds_t = inds_t(find(inds_t~=x)); % inds_t = setdiff(inds_t,x);      
tmp{i}.Py_t(:,t) = sum(cellInp{i}.Pyx(:,inds_t),2)./tmp{i}.Pt(t);
end

end

