function [theta, J_history] = gradientDescent(X, Y, theta, alpha, k, lambda, num_iters)
  J_history = zeros(num_iters, 1);
  for iter = 1:num_iters
    [J_history(iter), grad] = costFunctionReg(theta, X, Y, k, lambda);
    theta = theta - alpha*grad;
  endfor
end