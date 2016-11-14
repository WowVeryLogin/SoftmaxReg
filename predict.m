function [res, index] = predict(X, theta)
  tmpRes = hyposis(X, theta);
  res = tmpRes;
  [res, index] = max(res);
end