function plotData(x, y)

% PLOTDATA(x,y) plots the data points and gives the figure axes labels of
% population and profit.
%  
% Plot the training data into a figure. Set the axes labels using the 
% "xlabel" and "ylabel" commands. 
% Assume the population and revenue data have been passed in as the 
% x and y arguments of this function.

figure; % open a new figure window

plot(x, y, 'rx', 'MarkerSize', 10);   % plot the data with red cross of size 10
ylabel('Profits in $10,000s');        
xlabel('Population of city in 10,000s');

end
