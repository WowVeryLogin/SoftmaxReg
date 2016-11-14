#Загружает тренировочные данные из пути file и размером стороны pSize
function [X, Y] = loadData(file)
  tFile = fopen(file, 'r');
  tData = dlmread(tFile);
  fclose(tFile);

  tData = tData(2:end,:);
  Y = tData(:,1);
  X = tData(:,2:end);
end