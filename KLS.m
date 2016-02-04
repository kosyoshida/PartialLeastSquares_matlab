function alpha=KLS(K,y)
% this function perform kernel least squares regression 
%
% alpha=KLS(X,Y)
%
% X:predictor
% Y:responce

% size
n=length(y);

% regularization
lmbd=0.01;

alpha=(K+lmbd*eye(n))\y;