function alpha=KLS(K,y,lmbd)
% this function perform kernel ridge regression 
%
% [B,Coef,Res]=KLS(X,Y,k,option)
%
% X:predictor
% Y:responce
n=length(y);
alpha=(K+lmbd*eye(n))\y;