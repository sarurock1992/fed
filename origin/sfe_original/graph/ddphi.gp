set terminal x11 
set samples 1000
set xrange [0:0.2]
#set yrange [-450:200]
set xlabel "time  [s]" 
set ylabel "angle [rad]" 
pi=3.14159265
N=20
T=0.01
mu=N*T/2
sig=((N-20)/2+20)*T/16
#plot ((x-mu)**2-sig**2)/sig**4*1/sqrt(2*pi*sig**2)*exp(-0.5*(x-mu)**2/sig**2)
plot ((x-mu)**2)/sqrt(2*pi*sig**2)*exp(-0.5*(x-mu)**2/sig**2)
replot "ddatp.dat" pt 7 ps 2
pause -1 "hit"
set terminal tgif
set output "ddphi.obj"
#plot ((x-mu)**2-sig**2)/sig**4*1/sqrt(2*pi*sig**2)*exp(-0.5*(x-mu)**2/sig**2)
plot ((x-mu)**2)/sqrt(2*pi*sig**2)*exp(-0.5*(x-mu)**2/sig**2)
replot "ddatp.dat" pt 7 ps 2