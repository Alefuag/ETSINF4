#!/usr/bin/octave
if (nargin!=5) printf("ge.sh X xl as tr%% dev%%\n"); exit(1); end
arg_list=argv(); fX=arg_list{1}; load(fX);
fxl=arg_list{2}; load(fxl); a=str2num(arg_list{3});
tp=str2num(arg_list{4}); dp=str2num(arg_list{5});
N=rows(X); rand("seed",23); p=randperm(N); X=X(p,:); xl=xl(p,:);
Nt=round(tp/100*N); Nd=round(dp/100*N);
Xt=X(1:Nt,:); xlt=xl(1:Nt); Xd=X(N-Nd+1:N,:); xld=xl(N-Nd+1:N);
[ed]=gaussian(Xt,xlt,Xd,xld,a);
printf("\n  alpha dv-err\n------- ------\n");
for i=1:length(a); printf("%.1e %6.3f\n",a(i),ed(i)); end
