% Multivariate Linear Regression

% Data includes 47 datapoints of housing prices in Portland, Oregon.
%
% x=(x1,x2)=(area, number of bedrooms)
% y= house prices


clear all; close all; clc

x = load('mv_regressionx.dat'); 
y = load('mv_regressiony.dat');

m = length(y);


% Add intercept term to x
x = [ones(m, 1), x];

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% 1. Using 'mvregress' function: "mvregress(x,y)" returns the estimated coefficients for a multivariate normal regression of the d-dimensional responses in Y on the design matrices in X.
beta1=mvregress(x,y)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% 2. Using Stochastic Gradient Descent with different alphas
% alpha = [0.01, 0.03, 0.1, 0.3, 1, 1.3]
% total number of iterations = 100

% Scale features and set them to zero mean
mu = mean(x(:,2:3));
sigma = std(x(:,2:3));


x_unscaled = x; % Save unscaled features to calculate the parameters from the normal equation later
x(:,2:3) = (x(:,2:3) - mu ) ./ sigma;

% Initialize parameters
alpha = [0.01, 0.03, 0.1, 0.3, 1, 1.3];
iters = 100;
%theta_grad_descent =  % to store the values of theta of the best learning rate

a2 = regress(y,x) 

format longG

figure

for i = 1:length(alpha)
   theta = zeros(3,1); % initialize fitting parameters
   J = zeros(iters,1); % initialize J
    
   for num_iterations = 1:iters
        % Calculate the J term
        J(num_iterations) = (1/(2*m)) * (x*theta - y)' * (x*theta - y);

        temp = theta;

        for j=1:size(x,2)       
            temp(j) = theta(j) -  (alpha(i)/m)*sum((  (x*theta) - y ).*x(:,j)) ;       
        end

        for j=1:size(x,2)       
            theta(j) = temp(j) ;       
        end
   end
   
   if alpha(i)==1
       theta_grad_descent = theta;
   end
    
   subplot(2,3,i);
   plot(J)
   title(['a= ',num2str(alpha(i)) ])
   
   xlabel('iterations')
   ylabel('J')
   
end

% print gradient descent's result
theta_grad_descent

% Calculate the parameters from the normal equation
theta_normal = inv(x'*x)*x'*y;

theta_normal



for num_iterations = 1:iters
    % Calculate the J term
    J(num_iterations) = (1/(2*m)) * (x*theta - y)' * (x*theta - y);

    temp = theta;

    for j=1:size(x,2)       
        temp(j) = theta(j) -  (alpha(i)/m)*sum((  (x*theta) - y ).*x(:,j)) ;       
    end

    for j=1:size(x,2)       
        theta(j) = temp(j) ;       
    end
end
