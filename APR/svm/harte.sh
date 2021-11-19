#!/usr/bin/octave
load("hart/tr.dat"); load("hart/trlabels.dat"); X1=X(xl==1,:); X2=X(xl==2,:);
res=svmtrain(xl,X,'-t 2 -c 1'); whos res; fieldnames(res)
for [val,key]=res
  printf("%s: %s ",key,typeinfo(val));
  if isscalar(val) val
  elseif ismatrix(val) printf("%d %d\n",rows(val),columns(val));
  else printf("\n"); end; end
