#Загружает результаты из пути file и размером стороны pSize
function Y = loadTest(file)
  tFile = fopen(file, 'r');
  tData = dlmread(tFile,',',1,1);
  fclose(tFile);
  Y = (tData);
end