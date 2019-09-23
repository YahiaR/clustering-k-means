clear all;
clc;
close all;

% Cargamos los datos
load('ex7data2.mat');

% Dividimos en columnas para poder pintar
x1 = X(:,1);
x2 = X(:,2);
plot(x1,x2, '*');
xlabel('x1');
ylabel('x2');

% Nos declaramos los centroides
CentroidPositions = [3 3 ; 6 2 ; 8 5];

% Guardamos el indice del cluster más cercano a cada dato
CentroidAssigned = findClosestCentroids(X, CentroidPositions);

% Calculamos los nuevos centroides mediante la media de los puntos asignados a cada cluster
Nuevos_Centroides = computeCentroids(X,CentroidAssigned,3);

% Ejecutamos Kmeans con la posicion inicial de los centroides
[CentroidsPositionMat,Jvect] = Kmeans(X, CentroidPositions, 10);

% Pintamos la evolución de la función de coste
figure
plot(Jvect)

% Para hallar la posición final de los centroides usamos lo que nos ha devuelto kmeans
CentroidsPositionFinal = zeros(size(CentroidPositions));

% Guardamos las ultimas seis posiciones de las 1500 de CentroidsPositionMat para tener la posicion de los centroides
CentroidsPositionFinal(1,1) = CentroidsPositionMat(end,1);
CentroidsPositionFinal(1,2) = CentroidsPositionMat(end,2);
CentroidsPositionFinal(2,1) = CentroidsPositionMat(end,3);
CentroidsPositionFinal(2,2) = CentroidsPositionMat(end,4);
CentroidsPositionFinal(3,1) = CentroidsPositionMat(end,5);
CentroidsPositionFinal(3,2) = CentroidsPositionMat(end,6);

% Hallamos a que centroide esta asignado cada dato sabiendo ya los centroides finales
[auxiliar] = findClosestCentroids(X,CentroidsPositionFinal);

figure

hold on

% Vamos pintando todos los datos asignados a cada centroide
for i = 1:size(CentroidsPositionFinal,1)
    
    plot(X((auxiliar == i),1),X((auxiliar == i),2),'o')
    
end

% Pintamos la evolucion de los centroides (primeros con x y luego la linea
% que las une
plot(CentroidsPositionMat(:,1),CentroidsPositionMat(:,2),'x')
plot(CentroidsPositionMat(:,3),CentroidsPositionMat(:,4),'x')
plot(CentroidsPositionMat(:,5),CentroidsPositionMat(:,6),'x')

plot(CentroidsPositionMat(:,1),CentroidsPositionMat(:,2))
plot(CentroidsPositionMat(:,3),CentroidsPositionMat(:,4))
plot(CentroidsPositionMat(:,5),CentroidsPositionMat(:,6))
     

% 
% for i = 1:MaxIter
%     plot(CentroidsPositionMat(i,1),CentroidsPositionMat(i,2),'blue')
%     plot(CentroidsPositionMat(i,3),CentroidsPositionMat(i,4),'green')
%     plot(CentroidsPositionMat(i,5),CentroidsPositionMat(i,6),'red')
%     
% end

hold off
