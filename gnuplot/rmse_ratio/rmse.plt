##--------------------------------
## This script for Ogata.
##--------------------------------

# グリッド線を描くかどうか
#set grid

# x軸の設定
set xtics ("1/10" 0, "1/5" 1, "3/10" 2, "2/5" 3, "1/2" 4, "3/5" 5, "7/10" 6, "4/5" 7, "9/10" 8,"1" 9)

set format y "%3.2f"
set tics font "Times,20"
set key font 'Times,15'
set xlabel font 'Times,29'
set ylabel font 'Times,29'
set xlabel 'Ratio of a Cycle' offset 0,-3
set ylabel 'RMSE' offset -4,0
set size ratio 0.75
set bmargin 7

set terminal postscript enhanced eps

set output "rmse_ratio.eps"
plot "250hz%.csv" w lp lw 3 pt 7 lc 3 t "250Hz", "500hz%.csv" w lp lw 4 pt 7 lc 1 t "500Hz", "1000hz%.csv" w lp lw 4 pt 7 lc 0 t"1000Hz"
reset
