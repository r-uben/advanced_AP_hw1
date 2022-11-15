var x, dc, dd, uc, m, pd, pc, rm, exr, rf, rc, Q;
varexo eps_c, eps_x, eps_d;

parameters delta, theta, gamma, psi, mu, rho, phi;//, k0, k1;

gamma = 10;
psi = 1.5;
delta = .999;
mu = .0015;
rho = .98;
phi = 2.0;
theta = (1-1/psi)/(1-gamma);                                                // Caution: this theta is not the same as in BY, it's 1-theta there.

mbar = log(delta) - mu/psi;  
pdbar = log(exp(mbar+mu)/(1-exp(mbar+mu)));
pcbar = log(exp(mbar+mu)/(1-exp(mbar+mu)));
ucbar = (1/(1 - 1/psi))*log((1-delta)*(exp(pcbar)+1));
rfbar = -mbar;  
Qbar = exp((1-gamma)*(ucbar+mu)); 


model;

// Cash Flows:
dc = mu + x(-1) + eps_c;
dd = mu + phi*x(-1) + eps_d;
x  = rho*x(-1) + eps_x;

// Utility-Consumption Ratio (log):
Q  = exp( ( 1-gamma ) * ( dc(+1) + uc(+1) ) );                              // I firstly define this auxiliar function, which is basically the
                                                                            // (conditional on t) expected value in the formula... 
exp( (1 - 1/psi) * uc ) =  1 + delta * (Q^theta - 1);                       // This uniquely defines the (log) Utility-Consumption Ratio

// Stochastic Discount Factor (log):
exp(log(delta) - m - 1/psi*dc - (1-theta)*(1-gamma)*(dc + uc)) = Q(-1);

// Rates:
exr = rm - rf(-1);
1/exp(rf) = exp(m(+1));

// Ratios:
exp(pc) = exp(m(+1) + dc(+1)) * (1+exp(pc(+1)));                           // Price-to-Consumption
exp(pd) = exp(m(+1) + dd(+1)) * (1+exp(pd(+1)));                           // Price-to-Dividend

// Return on consumption:
exp(rc + pc(-1) - dc) = 1 + exp(pc);                                         

// Return on the market portfolio:
exp(rm + pd(-1) - dd) = 1 + exp(pd);

end;



initval;

dc = mu;  
dd = mu;  
x = 0;  
Q = Qbar;    
m = mbar;  
pd = pdbar;  
rm = rfbar;  
exr = 0;  
rf = rfbar;  
pc = pcbar;  
uc = ucbar;  
rc = rfbar;  

end;  
  

//       SRS    LRS  Div_S

vcov =  [3.6e-5  0    0
          0   9e-8    0
          0      0  0.001296];

order = 2;




