#!/usr/bin/octave
load("train-images-idx3-ubyte.mat.gz"); T=X;
load("train-labels-idx1-ubyte.mat.gz"); Tl=xl;
for N=[2000 20000]
  X=T(1:N,:); save("-z",sprintf("train%d-images.gz",N),"X");
  xl=Tl(1:N); save("-z",sprintf("train%d-labels.gz",N),"xl");
end
