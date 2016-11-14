function [X_norm] = featureScaling(X)
  mx = max(X);
  mx(mx==0) = 1;
  X_norm=(X-min(X))./(mx-min(X));
end