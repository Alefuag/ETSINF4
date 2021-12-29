#!/usr/bin/octave
if (nargin!=8) printf("Usage: svm-exp.sh X xl D t c g tr%% dv%%\n"); exit(1);end;
arg_list=argv();
fX=arg_list{1}; load(fX);
fxl=arg_list{2}; load(fxl);
D=str2num(arg_list{3});
t=str2num(arg_list{4});
C=str2num(arg_list{5});
G=str2num(arg_list{6});
tp=str2num(arg_list{7});
dp=str2num(arg_list{8});


### DIMENSIONES PCA

N=rows(X); rand("seed",23);
p=randperm(N); X=X(p,:); xl=xl(p,:); X=X/255.0;
Nt=round(tp/100*N); Nd=round(dp/100*N);
Xt=X(1:Nt,:); xlt=xl(1:Nt); Xd=X(N-Nd+1:N,:); xld=xl(N-Nd+1:N);

# Xt=Xt/255; Xd=Xd/255; # Normalizamos
[~,L,W] = eig(cov(Xt,1)); [L,p] = sort(diag(L),"descend"); W = W(:,p);


if (t==0)
printf("\n  t \t D \t  c \t  g \t\t acc\n  ---\t----- \t ----- \t ----------- \t -----\n");
for d=D
  proyM = W( :, 1:d );
  Xtpro = Xt*proyM;
  Xdpro = Xd*proyM;
  for c=C; for g=G;
  res = svmtrain(xlt, Xtpro, sprintf("-t %d -c %d -q", t, c) );
  [~,a,~] = svmpredict(xld, Xdpro, res, '-q');
  printf("  %d \t %d \t %d  \t  %1.e  \t %5.2f\n", t, d, c, g, a(1) );
  end; end;
end;
endif;

if (t==1)
printf("\n  t \t D \t  c \t  d \t acc\n  ---\t----- \t ----- \t ----- \t -----\n");
for d=D
  proyM = W( :, 1:d );
  Xtpro = Xt*proyM;
  Xdpro = Xd*proyM;
  for c=C; for g=G;
  res = svmtrain(xlt, Xtpro, sprintf("-t %d -c %d -d %d -q", t, c, g) );
  [~,a,~] = svmpredict(xld, Xdpro, res, '-q');
  printf("  %d \t %d \t %d  \t  %d  \t %5.2f\n", t, d, c, g, a(1) );
  end;printf("\n"); end; printf("\n");
end;
endif;

if (t==2 || t==3)
printf("\n  t \t D \t  c \t  g \t\t acc\n  ---\t----- \t ----- \t ----------- \t -----\n");
for d=D
  proyM = W( :, 1:d );
  Xtpro = Xt*proyM;
  Xdpro = Xd*proyM;
  for c=C; for g=G;
  res = svmtrain(xlt, Xtpro, sprintf("-t %d -c %d -g %f -q", t, c, g) );
  [~,a,~] = svmpredict(xld, Xdpro, res, '-q');
  printf("  %d \t %d \t %d  \t  %1.e  \t %5.2f\n", t, d, c, g, a(1) );
  end;printf("\n"); end; printf("\n");
end;
endif;

