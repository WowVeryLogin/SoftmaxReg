function [J, grad] = costFunctionReg(theta, X, Y, k, lambda)

 theta = reshape(theta, k, size(X,2));
#Размерность обучающей выборки
 hyp = (hyposis(X,theta))(1:k,:);
 m = length(Y);
 k = size(theta,1);
 grad = zeros(k, size(theta,2));
  
 #for i=1:k
  #Yr(i,:) = (Y+1 == i);
 #endfor

 Yr = full(sparse(Y+1,1:m,1));
Yr = Yr(1:k,:);
 
temp = theta;
temp(:,1) = 0;
J = -1/m*sum(sum(Yr.*log(hyp)))+lambda/(2*m)*sum(sum(temp .^ 2)); #попробовать убрать m 
grad = -1/m*(Yr-hyp)*X+lambda/m*temp;
 
 grad = [grad(:)]; #для случая обобщенной функции минимизации
end