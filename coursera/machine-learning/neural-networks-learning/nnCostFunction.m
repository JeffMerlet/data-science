function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));





a1 = [ones(1,m); X'];
z2 = Theta1*a1;
a2 = [ones(1,m); sigmoid(z2)];
z3 = Theta2*a2;
a3 = sigmoid(z3);

nn_y = zeros(m,num_labels);
for i=1:m
    nn_y(i, y(i)) = 1;
end

for i=1:m
    for j=1:num_labels
        J += -nn_y(i,j)*log(a3(j,i))-(1-nn_y(i,j))*log(1-a3(j,i));
    end
end

J /= m;

% Regularization term
J += lambda * ( sum(sum(Theta1(:, 2:end).^2)) + sum(sum(Theta2(:, 2:end).^2)) )/(2*m);

% Gradient computation
d3 = a3 - nn_y';
d2 = Theta2'*d3;
d2 = d2(2:end,:) .* sigmoidGradient(z2);

Theta1_grad = d2*a1' ./ m;
Theta2_grad = d3*a2' ./ m;

Theta1_grad(:,2:end) = Theta1_grad(:,2:end) + lambda*Theta1(:,2:end)/m;
Theta2_grad(:,2:end) = Theta2_grad(:,2:end) + lambda*Theta2(:,2:end)/m;

% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
