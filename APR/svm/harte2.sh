#!/usr/bin/octave
load("hart/tr.dat"); load("hart/trlabels.dat");
res=svmtrain(xl,X,'-t 2 -c 1 -q');
load("hart/ts.dat"); load("hart/tslabels.dat");
svmpredict(yl,Y,res,' ');
