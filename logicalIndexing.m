close all
clear all

%% Using logical indexing to filter data
data = rand(5,5)
data>0.5
data(data>0.5) = 0

%% Using logical indexing to filter NaN data
data = rand(5,5);
data(data>0.3) = NaN
data(~isnan(data)) % Notice that we lose the structure of data here
mean(data(~isnan(data)))

%% Mixing logical and regular indexing to find rows
data = rand(5,5)
sum(data,2)
sum(data,2)>2.6
data( sum(data,2)>2.6, : )

%% Mixing multiple matricies of equal size
xp = -1:0.1:1;
yp = -1:0.1:1;

% Make a 2d grid. Note that meshgrid and ndgrid treat coordinate 2
% differently, so it's important to be consistent and careful or you will
% get mirror images.
[x,y] = meshgrid(xp, yp)

%% 

% Make a map of zeros. Everywhere we turn to "1" will be part of the shape.
shapeMap = zeros(size(x));

shapeMap( abs(x)<0.5 ) = 1;

figure; 
imagesc(shapeMap)

shapeMap( abs(y)<0.5 ) = 1;

figure; 
imagesc(shapeMap)

%% 
% There are functions for converting to cylindrical coordinates, but I am
% going to ignore them and just calculate the projected r coordinate for
% our shape
s = sqrt(x.^2 + y.^2);
bodyR = 0.6;

% Make a map of zeros. Everywhere we turn to "1" will be part of the shape.
shapeMap = zeros(size(x));

% Now we use logical indexing to mark the areas we want to mess with. Read
% this section as set any area less than MaxZ AND greater than MinZ AND
% with a radius less than bodyR to 1. 
shapeMap( s < bodyR ) = 1;

figure; 
imagesc(shapeMap)

%% Boolean operations let you make more complicated logic

mapX = abs(x)<0.25;
mapY = abs(y)<0.25;

figure; 
imagesc(mapX)

figure; 
imagesc(mapY)

shapeMap = zeros(size(x));
shapeMap( mapX & mapY ) = 1;
figure;
imagesc(shapeMap);

shapeMap = zeros(size(x));
shapeMap( mapX | mapY ) = 1;
figure;
imagesc(shapeMap);


%% Using logical indexing to make masks

data = rand(size(shapeMap));
figure;
imagesc(data);
data(shapeMap==0) = 0;
figure;
imagesc(data);
mean(data( shapeMap~=0))

%%

