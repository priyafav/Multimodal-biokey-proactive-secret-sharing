D=[];
for i=1
  im=(imread('35-fused.bmp'));
  T = otsurec(im,35);
  I = im2bw(im,T(end));
  figure;
  imshow(I);
  [D,ib]  =sfta(im,30);
  figure;
  imshow(ib);
end