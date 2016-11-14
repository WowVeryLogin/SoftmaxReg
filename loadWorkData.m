#Загружает исследуемые данные из пути file
function X = loadWorkData(file)
  tFile = fopen(file, 'r');
  tData = dlmread(tFile);
  fclose(tFile);
  X = tData(2:end,:);
end