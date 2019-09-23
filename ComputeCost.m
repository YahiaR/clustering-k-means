function J = computeCentroids(X,CentroidsAssigned,CentroidsPosition)
    J = 0;
    for i = 1:size(X,1)
        J = J + sum(sqrt(sum((X(i,:) - CentroidsPosition(CentroidsAssigned(i),:)).^2)));
    end
    
    J = J / size(X,1);

end