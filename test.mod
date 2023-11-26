var dc, x, dd;
varexo ec, ex, ed;

parameters del, theta, gam, ies, mu, rho, phi;


gam=10;
ies=1.5;
del=.999;
//NOTE: my theta is the inverse of the BY's theta
theta = (1-1/ies)/(1-gam); 
mu=.0015;
rho = .98;
phi = 2.0;

model;
dc = mu + x(-1) + ec;
dd = mu + phi*x(-1) + ed;
x= rho*x(-1) + ex;
end;

initval;
dc=mu;
dd=mu;
x=0;
end;


//       SRS    LRS  Div_S

vcov =  [3.6e-5  0    0
          0   9e-8    0
          0      0  0.001296];

order = 2;


save_params_and_steady_state('test.mat');

