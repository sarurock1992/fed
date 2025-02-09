function [fd] = c2d_rk4(fc,h)

	function x_new = fproto(t, x)
	k1 = fc(t,x);
	k2 = fc(t+h/2, x+h/2*k1);
	k3 = fc(t+h/2, x+h/2*k2);
	k4 = fc(t+h/2, x+h/2*k3);
x_new = x + h/6*(k1 + 2*k2 + 2*k3 + k4);
end
fd = @fproto;
end
