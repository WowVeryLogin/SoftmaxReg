#Выводит картинку заданных данных X, с размером стороны pSize, и номером numPic
function showData(X, pSize, numPic)
figure;
  imagesc(reshape(uint8(X)(numPic,:),pSize,pSize)',  [0 255]);  colormap(gray);
  hold on; 
end