% Simple Linear Regression

% The dataset consists of CDC growth statistics for boys
%
% x= age (years)
% y= height (meters)
%

clear all; close all; clc;
x = load('linear_regressionx.dat'); y = load('linear_regressiony.dat');

m = length(y); % number of data points = 50


% Visualize the training data
figure;
plot(x, y, 'o');
title({'Training Data'})
ylabel('Y: Height (meters)')
xlabel('X: Age (years)')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% 1. Using 'fitlm' function: "fitlm(x,y)" uses intercept by default 2 
a1 = fitlm(x,y);
W=a1.Coefficients{:,1}

 
% Visualize results
figure
hold on
scatter(x,y)
plot(x, W(1)+W(2)*x, '-')
ylabel('Y: Height (meters)')
xlabel('X: Age (years)')
title({'Simple Linear Regression using fitlm(x,y) function'});
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% 2. Using 'regress' function: "regress(y,x)" uses no intercept by default. 
% We could add intercept by adding "ones" matrix.

a2 = 

% Visualize results
%figure
%hold on
%scatter(x,y)
%plot(x, a2(1)+a2(2)*x, '-')
%ylabel('Y: Height (meters)')
%xlabel('X: Age (years)')
%title({'Simple Linear Regression using regress(x,y) function'});
%hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% 3. Using Stochastic Gradient Descent
% alpha=0.07
% total number of iterations=1500

%theta = ... % initialize fitting parameters
%iterations = ...
%alpha = ...

%for num_iterations = 1:iterations
   
    %grad = ...   
    %theta = ...
    
%end

%theta

% Visualize results
%figure
%hold on
%scatter(x,y)
%plot(x2(:,2), x2*theta, '-')
%ylabel('Y: Height (meters)')
%xlabel('X: Age (years)')
%title({'Simple Linear Regression using SGD method'});
%hold off



