#!/usr/bin/octave
if (nargin!=5) printf("ge2.sh X xl Y yl a\n"); exit(1); end;
arg_list=argv(); a=str2num(arg_list{5});
fX=arg_list{1}; load(fX); fxl=arg_list{2}; load(fxl);
fY=arg_list{3}; load(fY); fyl=arg_list{4}; load(fyl);
[e]=gaussian(X,xl,Y,yl,a);
printf("\n alpha te-err\n------- ------\n");
printf("%.1e %6.3f\n",a,e);
