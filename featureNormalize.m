function [X_norm mu sigma] = featureNormalize(X)
  mu = mean(X);
  sigma = std(X);
  sigma(sigma==0) = 1;  
  X_norm = (X - mu)./sigma;
end