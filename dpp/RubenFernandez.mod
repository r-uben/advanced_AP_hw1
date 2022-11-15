var dc, dd, x, uc, m, pd, pc, rm, exr, rf, rc, Q;  
varexo eps_c, eps_x, eps_d;  

parameters delta, gamma, mu, psi, theta, phi, rho, ucbar, pdbar, pcbar, rfbar, Qbar, mbar;  

psi   = 1.500000e+00;  
theta = -3.703704e-02;  
phi   = 2.000000e+00;  
gamma = 1.000000e+01;  
delta = 9.990000e-01;  
mu    = 1.500000e-03;  
rho   = 9.800000e-01;  
mbar  = log(delta) - mu/psi;  
pdbar = log(exp(mbar+mu)/(1-exp(mbar+mu)));
pcbar = log(exp(mbar+mu)/(1-exp(mbar+mu)));
ucbar = (1/(1 - 1/psi))*log((1-delta)*(exp(pcbar)+1));
rfbar = -mbar;  
qbar = exp((1-gamma)*(ucbar+mu));  

model;  
dc = mu + x(-1) + eps_c;  
dd = mu + phi*x(-1) + eps_d;  
x  = rho*x(-1) + eps_x;  
Q  = exp( ( 1-gamma ) * ( dc(+1) + uc(+1) ) );  
exp( (1 - 1/psi) * uc ) =  1 + delta * (Q^theta - 1) ;
exp(log(delta) - m - 1/psi*dc - (1-theta)*(1-gamma)*(dc + uc)) = Q(-1);
exr = rm - rf(-1); 
1/exp(rf) = exp(m(+1));
exp(pc) = exp(m(+1) + dc(+1)) * (1+exp(pc(+1))); 
exp(pd) = exp(m(+1) + dd(+1)) * (1+exp(pd(+1)));
exp(rm + pd(-1) - dd) = 1 + exp(pd);
exp(rc + pc(-1) - dc) = 1 + exp(pc); 
end; 
  
  
initval; 
dc = mu;  
dd = mu;  
x  = 0;  
Q  = Qbar;  
m  = mbar;  
pd = pdbar;  
rm = rfbar;  
exr = 0;  
rf = rfbar;  
pc = pcbar;  
uc = ucbar;  
rc = rfbar;  
end;  
  
vcov = [5.208333e-05 0 0  
 0 1.008333e-07 0 
 0 0 8.333333e-04];  
  
order   = 2;  
