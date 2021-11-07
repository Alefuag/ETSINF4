#!/usr/bin/octave
load("train-images-idx3-ubyte.mat.gz");
for n=1:50
  x=reshape(X(n,:),28,28); imshow((255-x)',[]); pause(.5);
end
