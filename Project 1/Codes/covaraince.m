function [cov_y] = covaraince(error, X)
shape_X = size(X);
N = shape_X(1);
n = shape_X(2);
e = error;
sigma = transpose(e)*e/(N-n);
cov_theta = sigma^2*inv(transpose(X)*X);
cov_y = X*cov_theta*transpose(X);
end

