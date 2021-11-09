#!/usr/bin/gnuplot -persist

set terminal postscript eps font "Helvetica,24"

set output "plotAlpha5.svg"
set term svg
set logscale xy

set xrange [0.9:130]
set yrange [0.2:300]

set ytics ("1" 1, "2" 2, "5" 5, "10" 10, "20" 20, "50" 50, "100" 100)
set xtics ("1" 1, "2" 2, "5" 5, "10" 10, "20" 20, "50" 50, "100" 100)

set label "K" at 115,1.0 right
set label "Error (%)" at 1.2,200 left
#set label "MNIST Mix-Gaussian" at 20,75 center font "HelveticaBold,30"

#plot "exp-1e-1.out" u 1:2 t "a=1e-1" w lp lw 2 lt 1 ps 2.0, "exp-1e-2.out" w u 1:2 t "a=1e-2" w lp lw 2 lt 2 ps 2.0, "exp-1e-3.out" u 1:2 t "a=1e-3" w lp lw 2 lt 3 ps 2.0, "exp-1e-4.out" u 1:2 t "a=1e-4" w lp lw 2 lt 4 ps 2.0, "exp-1e-5.out" u 1:2 t "a=1e-5" w lp lw 2 lt 5 ps 2.0, "exp-1e-6.out" u 1:2 t "a=1e-6" w lp lw 2 lt 6 ps 2.0, "exp-1e-7.out" u 1:2 t "a=1e-7" w lp lw 2 lt 7 ps 2.0, "exp-1e-8.out" u 1:2 t "a=1e-8" w lp lw 2 lt 8 ps 2.0, "exp-1e-9.out" u 1:2 t "a=1e-9" w lp lw 2 lt 1 ps 2.0

plot for[i = 1:7] "plotAlpha5D".i.".txt"  u 1:2 t "D = ".i w lp lw 2 lt i ps 0.5
