function K=mkCosKernel(X)
% this function returns cosine kernel
% K=mkCosKernel(X)
%
% X:nxp (n:sample,p:feature)
num=X*X';
den=sqrt(diag(num));
K=num./(den*den');
