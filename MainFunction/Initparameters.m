function [prm] = Initparameters(m,Tsize,beta,gama, Restarts, UniformPrior, CentroidFigs)
 %UNTITLED Summary of this function goes here
 %Detailed explanation goes here

prm.m=m;
prm.Tsize = Tsize; 
prm.inv_beta=1/beta;
prm.gama=gama;
prm.Restarts = Restarts;  
prm.UniformPrior = UniformPrior;
prm.CentroidFigs= CentroidFigs;

% Default values - change when necessary...
prm.LoopLimit =100;  
prm.SmallChange =0;
prm.CalcI = 0;  % Turn to 1 to record information values after each assignment update (at cost of speed!)
prm.run_index = datestr(now);
prm.RunSeed = 0; 

% use 'sum(100*clock)' for "random" seed
% prm.RunSeed =sum(100*clock) ; 

rand('state',prm.RunSeed);
end

