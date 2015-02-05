function J = computeCost(X, y, theta)

% J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
% parameter for linear regression to fit the data points in X and y

m = size(X, 1);

% First implementation
%hypothesis = X * theta;
%squaredErrors = (hypothesis - y) .^2;
%J = sum(squaredErrors)/(2*m)

% A Better implementation:
J = ((X*theta - y)' * (X*theta - y))/(2*m);
end
