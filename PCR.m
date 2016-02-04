function B=PCR(X,Y,k)
% this function perform principal component regression 
%
% B=PCR(X,Y)
%
% X:predictor
% Y:responce
% k:# of components

[~,~,V]=pca(X,k);
Xscore=X*V;
Q=(Xscore'*Xscore)\(Xscore'*Y);

% B=W*Q
B=V*Q;