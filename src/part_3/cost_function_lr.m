function [J, grad] = cost_function_lr(theta, X, y)

m = length(y); % number of training examples

J = 0;
grad = zeros(size(theta));

temp = 1 / m;

J = temp * sum( -y'*log(sigmoid(X*theta)) - (1-y')*log(1-sigmoid(X*theta)));

grad = temp * (sigmoid(X*theta) - y)' * X;


end