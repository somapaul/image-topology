function [IDX, fiber] = createFiber(K,y,Y,p)
% function to create a fiber over patch p
%   param K the grid of points on the klein bottle
%   param y the base space of points to compare to K
%   param Y the total space Y, with indices corresponding to their mapping
%       in y
%   param p the point in K over which the fiber is extracted

    % find nearest neighbor on the klein bottle for each point in y
    %[IDX, D] = knnsearch(K,y,'K',1);
    dNormDistFun = @(x,Z)dNormDist(x,Z)';
    [IDX, D] = knnsearch(K,y,'K',1,'Distance',dNormDistFun);
    
    % get index of e1 in K as locb
    [~, locb] = ismembertol(p,K,0.000001,'ByRows',true);

    fiber = Y((IDX == locb),:);
end