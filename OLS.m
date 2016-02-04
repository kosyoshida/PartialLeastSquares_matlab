function B=OLS(X,Y)
% this function performs ordinary least squerre regression 
%
% B=OLS(X,Y)
%
% X:predictor
% Y:responce

% size
p=size(X,2);

% regularization
lmbd=0.01;

B=(X'*X+lmbd*eye(p))\(X'*Y);