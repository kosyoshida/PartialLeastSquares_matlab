function [B,Coef,Res]=PLS(X,Y,k)
% this function performs partial least squerres regression 
%
% [B,Coef,Res]=PLS(X,Y,k,option)
%
% X:predictor
% Y:responce
% k:the number of components

if ~exist('k','var')
    k=1;
end

% size
[n,p]=size(X);
[~,q]=size(Y);

% set parameter
MaxItr=1000;
tol=1e-8;

T=zeros(n,k);
U=zeros(n,k);
C=zeros(q,k);
W=zeros(p,k);
P=zeros(p,k);
dX=X;
dY=Y;

for i=1:k
% initialize 
[w,~,~]=svds(dX'*dY,1);
t=zeros(n,1);
u=zeros(n,1);

% iteration
for j=1:MaxItr
new_t=dX*w/norm(dX*w,2);
c=dY'*new_t;
new_u=dY*c/norm(dY*c,2);
w=dX'*new_u;

% tolerance
if norm(new_u-u,2)<tol && norm(new_t-t)<tol 
    u=new_u;
    t=new_t;
    break;
else
    u=new_u;
    t=new_t;
end
end

U(:,i)=u;
T(:,i)=t;
C(:,i)=c;
W(:,i)=w;
P(:,i)=dX'*t;

% deflation
dX=dX-t*t'*dX;
dY=dY-t*t'*dY;
end

% store coefficients
Coef.U=U;
Coef.T=T;
Coef.C=C;
Coef.W=W;
Coef.P=P;

% store residuals
Res.X=dX;
Res.Y=dY;

% regression coefficients
B=X'*U*((T'*X*X'*U)\T'*Y);
    