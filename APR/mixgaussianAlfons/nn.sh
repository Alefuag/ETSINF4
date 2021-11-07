#!/usr/bin/octave
if (nargin!=2) printf("%s fX fxl\n",program_name()); exit; end
arg_list=argv(); fX=arg_list{1}; fxl=arg_list{2};
load(sprintf(fX)); load(sprintf(fxl));
N=rows(X); NTr=round(.7*N); NTe=N-NTr; rec=zeros(NTe,1);
for m=1:NTe
  x=X(NTr+m,:)'; nmin=1; min=inf;
  for n=1:NTr
    xn=X(n,:)'; a=x-xn; d=a'*a; if (d<min) min=d; nmin=n; endif
  end
  rec(m)=xl(nmin);
end
[Nerr m]=confus(xl(NTr+1:N),rec);
printf("%s %s %d %d %.1f\n",fX,fxl,Nerr,NTe,100.0*Nerr/NTe);
