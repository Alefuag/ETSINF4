#!/usr/bin/octave
load("hart/tr.dat"); load("hart/trlabels.dat");
X1=X(xl==1,:); X2=X(xl==2,:);
plot(X1(:,1),X1(:,2),"x",X2(:,1),X2(:,2),"s"); print -color hart.eps
