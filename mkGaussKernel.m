function [K,H,gamma]=mkGaussKernel(X,varargin)
% this function returns gaussian kernel
% 
% [K,H,gamma]=mkGaussKernel(X,varargin)

[n,p]=size(X);
H=zeros(n);

if isempty(X)
    K=zeros(n);
else
    d=X*X';
    H=repmat(diag(d),1,n)-2*d+repmat(diag(d)',n,1);
    % get gamma
    if ischar(varargin{1})
        if strcmp('median',varargin{1})
            gamma=median_trick(H);
        elseif strcmp('scale',varargin{1})
            gamma=1/(2*p);
        else
            error('Unknown argment')
        end
    else
        gamma=varargin{1};
    end
    % get kernel matrix
    if gamma==Inf
        K=zeros(n);
    else
        K=exp(-gamma.*H);
    end
end
end

function gamma=median_trick(H)
% this function returns median of all entries of H
[n,p]=size(H);
H=reshape(H,[n*p,1]);
gamma=1/(2*median(H));
end