a = 100
b = 1
c = 1e+44
set xr[0:2*b]
#set yr[0:1]

#f(x) = exp(-10/(1-(x-1)*(x-1)))
#f(x) = exp(-1/(0.1*0.1-(x-0.1)*(x-0.1)))#隆起関数
#f(x) = -2*x/(1-x*x)*exp(-1/(1-x*x))
#f(x) = (60*(x-1)*(x-1)*(x-1)*(x-1)+360*(x-1)*(x-1)-20)/((1-(x-1)*(x-1))*(1-(x-1)*(x-1))*(1-(x-1)*(x-1))*(1-(x-1)*(x-1)))*exp(-10/(1-(x-1)*(x-1)))

p(x)=c*exp(-a/(b*b-(x-b)*(x-b)))
q(x)=c*c*(6*a*(x-b)*(x-b)*(x-b)*(x-b)+4*a*(a-b*b)*(x-b)*(x-b)-2*a*b*b)/((b*b-(x-b)*(x-b))*(b*b-(x-b)*(x-b))*(b*b-(x-b)*(x-b))*(b*b-(x-b)*(x-b)))*p(x)

plot q(x)
pause -1



#set table "ryuki.csv"
#plot p(x)
#unset table
