# Linear Regression
Series of exercise to compute gradient descent for one and multiple variables (including feature normalization), and also Normal Equations for multiples variables.

## Univariate Linear Regression
Implementation of a linear regression with one variable to predict profits for a food truck for future cities where the company wants to open a new outlet. The chain has trucks in various cities and you have data for profits and populations from the cities. You would like to use this data to help you select which city to expand to next.

```
function J = computeCost(X, y, theta)
    J = ((X*theta - y)' * (X*theta - y))/(2*m);
end;

function [theta, J_history] = gradientDescent(X, y, theta, alpha, iterations)
    m = length(y); % number of training examples
    J_history = zeros(num_iters, 1);

    for iter = 1:num_iters
        % Calculate the gradient
        delta = (1/m) * (X' * (X * theta - y));
        theta = theta - alpha * delta;

        % Calculate the cost function
        J = computeCost(X, y, theta);

        % Save the cost J in every iteration
        J_history(iter) = J;
    end
end;

%
% Univariate Linear Regression Main Code (see ex1.m)
%
% Loads data
% first column is city population; second column is the profit that could be negative.
data = load('ex1data1.txt');
X = data(:, 1); y = data(:, 2);

% number of training examples
m = length(y);

% Add a column of ones to x
X = [ones(m, 1), data(:,1)]; 

% initialize fitting parameters
theta = zeros(2, 1); 

% Some gradient descent settings
iterations = 1500;
alpha = 0.01;

% compute and display initial cost
computeCost(X, y, theta)

% run gradient descent
[theta, J_history] = gradientDescent(X, y, theta, alpha, iterations);

% Predict values for population sizes of 35,000 and 70,000
prediction1 = [1, 3.5] * theta;
prediction2 = [1, 7] * theta;
```

## Multivariate Linear Regression
Implementation of a linear regression with multiple variables to predict the prices of houses. Suppose you are selling your house and you want to know what a good market price would be. One way to do this is to first collect information on recent houses sold and make a model of housing prices.

```
function [X_norm, mu, sigma] = featureNormalize(X)
    X_norm = X;
    mu = zeros(1, size(X, 2));
    sigma = zeros(1, size(X, 2));

    n = size(X, 2);
    for i = 1:size(X,2)
        mu(1,i) = mean(X(:, i));
        sigma(1,i) = std(X(:,i));
        X_norm(:,i) = (X(:,i) - mu(1,i)) ./ sigma(1,i);
    end
end

function J = computeCostMulti(X, y, theta)
    m = length(y); % number of training examples
    J = ((X*theta - y)' * (X*theta - y))/(2*m);
end

function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
    % Initialize some useful values
    m = length(y); % number of training examples
    J_history = zeros(num_iters, 1);

    for iter = 1:num_iters
        % Calculate the gradient
        delta = (1/m) * (X' * (X * theta - y));
        theta = theta - alpha * delta;

        % Calculate the cost function
        J = computeCostMulti(X, y, theta);

        % Save the cost J in every iteration
        J_history(iter) = J;
    end
end

function [theta] = normalEqn(X, y)
    theta = pinv(X'*X)*X'*y;
end

%
% Multivariate Linear Regression Main Code (see ex1_multi.m)
%
% Loads data
data = load('ex1data2.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);

% Feature Normalization
[X mu sigma] = featureNormalize(X);

% Add intercept term to X
X = [ones(m, 1) X];

% Choose some alpha value
alpha = 0.1;
num_iters = 50;

% Init Theta and Run Gradient Descent
theta = zeros(3, 1);
[theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters);

% Estimate the price of a 1650 sq-ft, 3 br house
H(2) = (H(2) - mu(1)) ./ sigma(1);
H(3) = (H(3) - mu(2)) ./ sigma(2);
price = H * theta;

% Calculating theta using Normal Equation
theta = normalEqn(X, y);

% Estimate the price of a 1650 sq-ft, 3 br house
H = [1, 1650, 3];
price = H * theta;
```
