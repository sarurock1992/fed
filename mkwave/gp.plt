set datafile separator ','
#set yrange [-1.5:1.5]
#set xrange [0:0.4]
#set y2range [-1.5:1.5]

set terminal x11 

set xlabel " t "
set ylabel " target signal " 
set nokey

set xlabel font "Times New Roman, 25"
set ylabel font "Times New Roman, 25"

set tics font "Times New Roman, 15"
set terminal x11

set size ratio 0.5 1

const = 0

#plot "o05pi_5pi_01pi_1000hz.csv" u 1:2 w p t " target signal "
plot "o05pi_3pi_02pi_1000hz.csv" u ($1*0.001):2 w steps t " target signal "
pause -1 "hit"

#set terminal svg
#set output 'wave.svg'
#replot

#set ter post enhanced "Times" 18
#set terminal tgif
#set output "coswave.obj"
#replot 



