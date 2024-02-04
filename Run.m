clear all
path1='MainFunction';
path2='BasicFunction';
path3='clustering performance';
addpath(path1,path2,path3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% auto-weighted multi-view C2IB method.
dataset_str = 'Yan';
Tsize=6;
m = 2;                  % double the input view:      [1,m] content view       and   [m+1,2m] context view.
Restarts=10;
data_path = append('./data/',dataset_str, '/',dataset_str,'_Normalized.tsv');
label_path = append('./data/',dataset_str,'/label.tsv'); % subtype.ann
% graph_path = append('./data/',dataset_str, '/',dataset_str,'_graph.txt');
graph_path = append('C:/Users/魏小娇/Desktop/NE/',dataset_str,'_graph.txt');

Select_alpha=0.7;  % \apha I(T:Y) + (1-\alpha) -inv_betaI(T, X)
Select_beta=8;  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cellX = cell(m,1);     %input data
UniformPrior=1;
CentroidFigs=0;

% 构造input data
expr_matrix = importfile_tsv(data_path);
sum_values = sum(expr_matrix,2);
index = find(sum_values ~= 0);
expr_matrix = expr_matrix(index,:);
expr_matrix = sparse(expr_matrix');
cellX{1} = expr_matrix;

graph_matrix= readmatrix(graph_path); 
I = eye(size(graph_matrix,1));
graph_matrix = graph_matrix + I; 
graph_matrix = sparse(graph_matrix'); 
cellX{2} = graph_matrix;

% label files:
label = import_label(label_path);  % load label
k_num = length(unique(label));  % cluster num
label = grp2idx(label);  % label: char to double % 字符型标签转数值型标签
gnd = label;

[CR,cellT]=MainIB (cellX,gnd', m,Tsize, Select_beta ,Select_alpha, Restarts, UniformPrior, CentroidFigs);
ari = func_ari(gnd',cellT{1}.Pt_x);
nmi =func_nmi(gnd',cellT{1}.Pt_x);
disp([' ARI is:  ' num2str(ari)]);
disp([' NMI is:  ' num2str(nmi)]);
