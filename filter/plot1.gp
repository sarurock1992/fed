set datafile separator ','

#set xrange[-5:5]
#set yrange[0:6]
#set y2range[-5:5]

set label font "Times New Roman"
set terminal x11
set y2tics

set tics nomirror

set xlabel " time[ms] "
set ylabel " brain signal "
set y2label " Target signal "

const=0

plot "brain004_new.csv" u 1:2 w steps lc rgb "green" t "Output",\
     "brain004_new.csv" u 1:3 w steps lc rgb "red" t "Intput",\
     const
pause -1

#set terminal png
#set output 'fft.png'
#replot
