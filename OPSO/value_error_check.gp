#粒子群最適化のgifアニメ

set xrange [0:0.4]
#set yrange [0:110]
#set y2range [0:100]

set xlabel font "Times New Roman, 25"
set ylabel font "Times New Roman, 25"
set y2label font "Times New Roman, 25"
set key font "Times New Roman, 15"

set tics font "Times New Roman, 15"
set terminal x11
set y2tics
set ytics nomirror
set xlabel " t "
#set nokey
set size ratio 0.5 1

set ylabel "value"

set y2label "error"

plot "errorcheck.dat" u ($1*0.001):5 w steps lw 1.5 lc rgb "forest-green" t "value",\
     "errorcheck.dat" u ($1*0.001):2 w steps lw 1.5 lc rgb "black" t "error[%]"axes x1y2

#pause -1 "hit"

set terminal svg
set output 'OPSO_value_error.svg'
replot

# set term png
# set output "OPSO_check.png"
# replot
# set term x11
