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
%mu = ...
%sigma = ...

%x_unscaled = ... % Save unscaled features to calculate the parameters from the normal equation later

% Initialize parameters
%alpha = ...
%iters = ...
%theta_grad_descent = ... % to store the values of theta of the best learning rate

%figure;

%for i = 1:length(alpha)
    %theta =... % initialize fitting parameters
    %J = .. % initialize J
   % for num_iterations = 1:iters
        % Calculate the J term
        %J(num_iterations) = ...
        
        % The gradient
        %grad = 
        
        % Here is the actual update
        %theta = 
    %end
    
%end

% print gradient descent's result
%theta_grad_descent

% Calculate the parameters from the normal equation
%theta_normal = ...

