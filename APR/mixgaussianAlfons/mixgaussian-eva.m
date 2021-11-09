#!/usr/bin/octave -qf

if (nargin!=7)
printf("Usage: mixgaussian-eva.m <trdata> <trlabels> <tedata> <telabels> <alpha> <components> <proy> \n")
exit(1);
end;

arg_list=argv();
trdata=arg_list{1};
trlabs=arg_list{2};
tedata=arg_list{3};
telabs=arg_list{4};
alpha=str2num(arg_list{5});
K=str2num(arg_list{6});
D=str2num(arg_list{7});

% Loading data
load(trdata);
load(trlabs);
load(tedata);
load(telabs);

[m,W]=pca(X);

printf("\n  alpha K   te-err");
printf("\n------- --- ------\n");
for d=1:length(D)
Xpro=X*W(:,1:D(d) );
Ypro=Y*W(:,1:D(d) );
[ete] = mixgaussian(Xpro,xl,Ypro,yl,K,alpha);
printf("%.1e %6.3f\n",alpha,K, ete);
end;
