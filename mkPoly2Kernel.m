function K=mkPoly2Kernel(X,param)
% this function returns second order polynomial kernel
%
% K=mkPoly2Kernel(X,param)
N=size(X,1);
H=X*X'+param*ones(N);
K=H.^2;