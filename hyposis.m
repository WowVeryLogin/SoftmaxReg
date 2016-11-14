#Расчитывает гипотезу
function res = hyposis(X, theta)
  
  p = theta*X';
  #p = p .- max(p);
  p = exp(p);
  res = p./(1+sum(p));
  lastRes = 1 - sum(res);
  #lastRes = 1./(1+sum(p));
  res = [res; lastRes];
end