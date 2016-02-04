function B=OLS(X,Y)
% this function perform ordinary least squerre 
%
% B=OLS(X,Y)
%
% X:predictor
% Y:responce

B=(X'*X)\(X'*Y);