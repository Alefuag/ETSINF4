#!/usr/bin/octave
if (nargin!=6) printf("mge.sh X xl Ks as tr%% dv%%\n"); exit(1);end
arg_list=argv(); fX=arg_list{1}; load(fX); fxl=arg_list{2};
load(fxl); K=str2num(arg_list{3}); a=str2num(arg_list{4});
tp=str2num(arg_list{5}); dp=str2num(arg_list{6});
N=rows(X); rand("seed",23); p=randperm(N); X=X(p,:); xl=xl(p,:);
Nt=round(tp/100*N); Nd=round(dp/100*N);
Xt=X(1:Nt,:); xlt=xl(1:Nt); Xd=X(N-Nd+1:N,:); xld=xl(N-Nd+1:N);
printf("\n  K   alpha dv-err\n--- ------- ------\n");
for i=1:length(a); for k=1:length(K)
  [ed]=mixgaussian(Xt,xlt,Xd,xld,K(k),a(i));
  printf("%3d %.1e %7.2f\n",K(k),a(i),ed);
end; end
