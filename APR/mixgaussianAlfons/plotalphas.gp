#!/usr/bin/gnuplot
set print "-"
set term svg enhanced linewidth 2
set output "example.svg"
#Titulo del eje de las Y
set ylabel "Error(%)"
#Titulo del eje de las X
set xlabel "Componentes por mixtura"

stats filename using 3 name "A"

set key outside
set title "MNIST mixturas Gaussianas + PCA evaluación\ α = ".filename
set xrange[1:100]
set yrange[1:15]
set xtics (1, 2, 5, 10, 20, 50, 100)
set ytics (1,2,3,4,5,6,7)
set ytics add (15 "15")
set logscale yx 2

plot for [i=0:*] filename index i using 1:3  with lp  title columnheader(1) ps 1

