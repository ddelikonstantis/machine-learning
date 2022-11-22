% Logistic Regression

% The dataset consists of 80 students: 40 who admitted to college and 40 who did not
%
% x = student's score in two exams = (results1, results2)
% y = label of whether the student admitted to college
%


clear all; close all; clc

x = load('log_regressionx.dat'); 
y = load('log_regressiony.dat');

[m, n] = size(x);

% Add intercept term to x
x = [ones(m, 1), x]; 

% Visualize the datapoints
figure
plot(x(find(y), 2), x(find(y),3), '+')
hold on
plot(x(find(y == 0), 2), x(find(y == 0), 3), 'o')
xlabel('Result 1')
ylabel('Result 2')
legend('Admitted', 'Not admitted')
title({'Training Data'})

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% 1. Using 'fitglm' function: "fitglm(x,y)" returns a generalized linear model of the responses y, fit to the data matrix X.
B = fitglm(x,y,'linear', 'distr', 'binomial' )
coeffs=B.Coefficients.Estimate;


% Only need 2 points to define a line, so choose two endpoints
plot_x = [min(x(:,2))-2,  max(x(:,2))+2];
% Calculate the decision boundary line
plot_y = (-1./coeffs(4)).*(coeffs(3).*plot_x +coeffs(2));
figure
plot(x(find(y), 2), x(find(y),3), '+')
hold on
plot(x(find(y == 0), 2), x(find(y == 0), 3), 'o')
hold on
xlabel('Result 1')
ylabel('Result 2')
plot(plot_x, plot_y)
legend('Admitted', 'Not admitted', 'Decision Boundary')
title({'Using fitglm function'})
hold off



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% 2. Using Stochastic Gradient Descent

iters = 700000;
alpha = 0.001;
% % Initialize fitting parameters
theta = zeros(3,1);

theta_old = zeros(3,1);

% SGD IMPLEMENTATION HERE
% J = zeros(iters,1);

for num_iterations = 1:iters
  
      theta_old = theta;
      [J(num_iterations),grad  ] = cost_function_lr(theta,x,y);
     

      theta = theta -  alpha*grad' ; 

     
     if J(num_iterations) < 0.45
        break;
     end
     
     if abs( theta_old - theta ) < 0.00000001
         break;
     end
 
    
end

 
theta
figure
plot(J)
% Plot SGD method result

% Calculate the decision boundary line
plot_y = (-1./theta(3)).*(theta(2).*plot_x +theta(1));
figure
plot(x(find(y), 2), x(find(y),3), '+')
hold on
plot(x(find(y == 0), 2), x(find(y == 0), 3), 'o')
hold on
xlabel('Result 1')
ylabel('Result 2')
plot(plot_x, plot_y)
legend('Admitted', 'Not admitted', 'Decision Boundary')
title({'Using SGD method'})
hold off


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% 3. Using Newton's method
iters = 15;

% Initialize fitting parameters
theta = zeros(3,1);

% Define the sigmoid function
g = @(z) (1.0 ./(1.0 + exp (-z))); 
 
theta_old = ones (n + 1, 1);
% Newton's method
 
for i = 1:iters
    theta_old = theta;
    % Calculate the hypothesis function
    z = x * theta;
    h = g (z);
     
    % Calculate gradient and hessian.
    grad = x' * (h-y);
    H = x' * diag (h) * diag (1-h) * x;
    
    % Calculate J (for testing convergence)
    [J(i), ] = cost_function_lr(theta,x,y);
     
    theta = theta-H\grad;          
end

% Display theta
theta


% Vizualize Newton's method
%Calculate the decision boundary line
plot_y = (-1./theta(3)).*(theta(2).*plot_x +theta(1));
figure
plot(x(find(y), 2), x(find(y),3), '+')
hold on
plot(x(find(y == 0), 2), x(find(y == 0), 3), 'o')
hold on
xlabel('Result 1')
ylabel('Result 2')
plot(plot_x, plot_y)
legend('Admitted', 'Not admitted', 'Decision Boundary')
title({'Using Newton method'})
hold off
