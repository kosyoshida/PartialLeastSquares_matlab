function K=mkLinKernel(X)
% this function returns linear kernel
[n,~]=size(X);
if isempty(X)
    K=zeros(n);
else
    K=X*X';
end