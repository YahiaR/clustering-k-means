function [idx] = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%  

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);


% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
    % Para todos los datos que tenemos
    for i = 1: size(X,1)
        d=[];
        % Para cada uno de los centroides
        for j = 1: size(centroids)
            % Calculamos la distancia desde nuestro punto X hasta cada uno
            % de los centroides
            d(j)=sqrt(sum((X(i,:) - centroids(j,:)).^2));
        end
        % Nos quedamos con el valor más pequeño de las distancias ademas de
        % en que fila esta que será nuestro cluster
        [M,P] = min(d);
        idx(i) = P;
    end


end

