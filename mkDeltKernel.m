function K=mkDeltKernel(y)
% this function returns delta kernel 
%
% K=mkDeltKernel(y)
% definition
% K(y,y')=1/n if y=y'
%        =0   if y~=y'
n=length(y);

yapp=unique(y);
if length(yapp)~=2
    error('y should be binary !')
end

np=sum(y==yapp(1));
nn=sum(y==yapp(2));

yp=zeros(n,1);
yp(y==yapp(1))=1;
Kp=yp*yp'./np;

yn=zeros(n,1);
yn(y==yapp(2))=1;
Kn=yn*yn'./nn;

K=Kp+Kn;