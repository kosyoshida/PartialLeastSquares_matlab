function K=mkPoly3Kernel(X,param)
% this function returns third order polynomial kernel 
%
% K=mkPoly3Kernel(X,param)
N=size(X,1);
H=X*X'+param*ones(N);
K=H.^3;