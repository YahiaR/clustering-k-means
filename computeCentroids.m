function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returs the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);


% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.

    % Para cada centroide
    for j=1:K
        cont=0;
        % Para cada dato
        for i=1:size(X,1)
            % Para cada posicion de nuestra X, si su cluster más cercano es
            % j            
            if idx(i)==j
                % Vamos sumando la posicion de esa x
                centroids(j,:)=centroids(j,:)+X(i,:);
                % Aumentamos un contador
                cont=cont+1;
            end
        end
        % La nueva posicion del centroide es la media aritmetica de las
        % posiciones sumadas 
        centroids(j,:)=centroids(j,:)./cont;
    end



end

