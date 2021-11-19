#!/usr/bin/octave
load("hart/tr.dat"); load("hart/trlabels.dat"); X1=X(xl==1,:); X2=X(xl==2,:);
res=svmtrain(xl,X,'-t 2 -c 1 -q'); Xsv=X(res.sv_indices,:);
xlsv=xl(res.sv_indices); Xsv1=Xsv(xlsv==1,:); Xsv2=Xsv(xlsv==2,:);
plot(X1(:,1),X1(:,2),"b.",Xsv1(:,1),Xsv1(:,2),"bo",
     X2(:,1),X2(:,2),"r.",Xsv2(:,1),Xsv2(:,2),"ro"); print -color hartep.eps
