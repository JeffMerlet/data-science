function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters
    % Calculate the gradient
    delta = (1/m) * (X' * (X * theta - y));
    theta = theta - alpha * delta;

    % Calculate the cost function
    J = computeCostMulti(X, y, theta);

    % debug print to screen
    %fprintf('Iteration %d - J = %f - theta(0,1)) = (%f, %f)\n', iter, J, theta(1), theta(2));

    % Save the cost J in every iteration    
    J_history(iter) = J;

end

end
