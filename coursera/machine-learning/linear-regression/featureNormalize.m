function [X_norm, mu, sigma] = featureNormalize(X)
% FEATURENORMALIZE(X) returns a normalized version of X where
% the mean value of each feature is 0 and the standard deviation
% is 1. This is often a good preprocessing step to do when
% working with learning algorithms.

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
