%Очищаем все данные до начала работы
clear ; close all; clc
%Размер стороны изображений в пикселях
pSize = 28;
%Количество классов в задаче
k = 10;
%Размерность вектора входных данных
n = pSize*pSize;

%Загружаем обучающую выборку
[X, Y] = loadData('mnist_train.csv');
#Xtest = loadWorkData('test.csv');
#X = [X; Xtest];
#Ytest = loadTest('mnist-pred.csv');
#Y = [Y; Ytest];
%Размерность обучающей выборки
m = length(Y);

%Проводим масштабирование и нормализирование входных данных
X = featureScaling(X);
[X mu sigma] = featureNormalize(X);
%Добавление единичного вектора
X = [ones(m,1) X];

%Создаем матрицу параметров модели
initial_theta = 0.0005*randn(k-1,n+1);

%Обучаем модель на обучающей выборке
lambda = 1e-4;

%Задаем свойства функции минимизации
alpha = 0.5; #используется, если применяется градиентный спуск
num_iters = 100;
options = optimset('GradObj', 'on', 'MaxIter', num_iters);


[cost, grad] = costFunctionReg(initial_theta, X, Y, k-1, lambda);
cost

[theta, J_history, exit_flag] = ...
	fmincg(@(t)(costFunctionReg(t,X,Y,k-1,lambda)), [initial_theta(:)], options);
theta = reshape(theta, k-1, n+1);


# [theta, J_history] = ...
#  gradientDescent(X, Y, initial_theta, alpha, k-1, lambda, num_iters);
  
%Строим график функции потерь от кол-ва итераций
figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');  
hold on; 
  
%Печатаем значение функции потерь и часть матрицы параметров
fprintf('Cost at theta found by fminunc: %f\n', J_history(end));
fprintf('theta: \n');

%Загружаем тестовые данные
[X, Y] = loadData('mnist_test.csv');

%Загружаем исследуемые данные
#X = loadWorkData('test.csv');

%Нормализируем входные данные
X = featureScaling(X);
X = (X - mu)./sigma;
X = [ones(length(X),1) X];

%Запускаем модель на тестовых данных
[p Ym] = predict(X,theta);
Ym -= 1;

%Загружаем результаты для расчета точности
#Y = loadTest('mnist-pred.csv');
succ_count = sum(Ym' == Y);
succ_count
(succ_count/size(Y,1)*100)

%Сохраняем результаты в выходной файл
rFile = fopen('result.csv', 'w');
dlmwrite('result.csv', [[1:length(Ym)]' Ym'], ',' , 1);
fclose(rFile);