function K=mkDeltKernel(y)
% this function returns delta kernel 
%
% K=mkDeltKernel(y)
% definition
% K(y,y')=1/n if y=y'
%        =0   if y~=y'
flag=ismember(y,[1,0]);
if all(flag)
   y(y==0)=-1;
end

np=sum(y==1);
nn=sum(y==-1);

yp=y;
yp(y==-1)=0;
Kp=yp*yp'./np;

yn=y;
yn(y==1)=0;
Kn=yn*yn'./nn;

K=Kp+Kn;