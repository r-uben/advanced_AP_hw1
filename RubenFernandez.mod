var dc, dd, x, uc, m, pd, pc, rm, exr, rf, rc, Q, q;  
varexo eps_c, eps_x, eps_d;  

parameters delta, gamma, mu, psi, theta, alpha, phi, rho, ucbar, pdbar, pcbar, rfbar, Qbar, mbar;  

psi   = 1.500000e+00;  
theta = -3.703704e-02;  
alpha = 3.333333e-01;  
phi   = 2.000000e+00;  
gamma = 1.000000e+01;  
delta = 9.990000e-01;  
mu    = 1.500000e-03;  
rho   = 9.800000e-01;  
mbar  = log(delta) - mu/psi;  
pdbar = log(exp(mbar+mu)/(1-exp(mbar+mu)));
pcbar = log(exp(mbar+mu)/(1-exp(mbar+mu)));
ucbar = (1/alpha)*(log(1-delta) - log(1-delta*exp(alpha*mu)));
rfbar = -mbar;  
Qbar = exp((1-gamma)*(ucbar+mu));  

model;  
dc = mu + x(-1) + eps_c;  
dd = mu + phi*x(-1) + eps_d;  
x  = rho*x(-1) + eps_x;  
Q  = exp( ( 1-gamma ) * ( dc(+1) + uc(+1) ) );  
q  = log(Q);  
exp((1-(1/psi))*uc)=(1-delta)+delta*exp(theta*q);
exp(m+1/psi*dc) = delta*exp((1-theta)*(1-gamma)*(uc+dc))*exp(-(1-theta)*q(-1));
exr = rm - rf(-1); 
1/exp(rf) = exp(m(+1));
exp(pc) = exp(m(+1))*(1+exp(pc(+1)))*exp(dc(+1)); 
exp(pd) = exp(m(+1))*(1+exp(pd(+1)))*exp(dd(+1));
exp(rm) = (1+exp(pd))/exp(pd(-1))*exp(dd);
exp(rc) = (1+exp(pc))/exp(pc(-1))*exp(dc); 
end; 
  
  
initval; 
dc     = mu;       
dd     = mu;       
x      = 0;        
Q      = Qbar;     
q   = log(Qbar);  
m      = mbar;         
pd     = pdbar;        
rm     = rfbar;        
exr    = 0;            
rf     = rfbar;        
pc     = pcbar;        
uc     = ucbar;        
rc     = rfbar;        
end;  
  
vcov = [3.600000e-05 0 0  
 0 9.000000e-08 0 
 0 0 1.296000e-03];  
  
order   = 2;  
