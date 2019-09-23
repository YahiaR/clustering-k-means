function [CentroidsPositionMat,Jvect] = Kmeans(X,initialCentroidsPosition,MaxIter)

% Tiene tantas filas como iteraciones tiene nuestro algoritmo
CentroidPositionsMat(1,:) = zeros(size(MaxIter));
% Tiene 6 columnas
CentroidPositionsMat(2,:) = zeros(size(6));

for i=1:MaxIter

	y = findClosestCentroids(X,initialCentroidsPosition);
	centroids = computeCentroids(X,y,size(initialCentroidsPosition,1));
	Jvect(i) = ComputeCost(X, y ,centroids);

	CentroidsPositionMat(i,1) = centroids(1,1);
    CentroidsPositionMat(i,2) = centroids(1,2);
    CentroidsPositionMat(i,3) = centroids(2,1);
  	CentroidsPositionMat(i,4) = centroids(2,2);
    CentroidsPositionMat(i,5) = centroids(3,1);
    CentroidsPositionMat(i,6) = centroids(3,2);
    
    CentroidsPosition = centroids;
end

end
