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
