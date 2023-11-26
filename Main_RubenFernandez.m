clc 
clear all

addpath /Applications/Dynare/5.4/matlab/
old_path = getenv("PATH");
new_path = [getenv('PATH') ':/Applications/Dynare/5.4/dynare++'];
setenv("PATH", new_path)

%% Options for this code
 N = 10000; % number of periods for simulations
 state_SIM = 17; % initialization of the random numbers generator

%% Making variables global
global delta gamma psi phi theta sigma_c sigma_x sigma_d rho mu

%% Input: Calibration
delta = .999;
gamma = 10;
psi   = 1.5;
phi   = 2.0;
%%% NOTE: my theta is the inverse of the BY's theta
alpha = 1-1/psi;
theta = (alpha/(1-gamma)); 

sigma_c = sqrt(3.6e-5);
sigma_x = sqrt(9e-8);
sigma_d = sqrt(1.296e-3);
SIGMA = [sigma_c^2 0 0; 0 sigma_x^2 0; 0 0 sigma_d^2];

rho     = .98;
mu      = .0015; 

order   = 2;

%% Output: dynare++
%%~~~~~~~~~~~~~~~~~~~~

% Write the Ruben.mod file
fid = fopen('RubenFernandez.mod', 'w+');

% Variables
fprintf(fid,'var dc, dd, x, uc, m, pd, pc, rm, exr, rf, rc, Q, q;  \n');
fprintf(fid,'varexo eps_c, eps_x, eps_d;  \n');
fprintf(fid,'\n');

% Parameters
fprintf(fid,'parameters delta, gamma, mu, psi, theta, alpha, phi, rho, ucbar, pdbar, pcbar, rfbar, Qbar, mbar;  \n');
fprintf(fid,'\n');
fprintf(fid,'psi   = %e;  \n', psi);
fprintf(fid,'theta = %e;  \n', theta);
fprintf(fid,'alpha = %e;  \n', alpha);
fprintf(fid,'phi   = %e;  \n', phi);
fprintf(fid,'gamma = %e;  \n', gamma);
fprintf(fid,'delta = %e;  \n', delta);
fprintf(fid,'mu    = %e;  \n', mu);
fprintf(fid,'rho   = %e;  \n', rho);

fprintf(fid,'mbar  = log(delta) - mu/psi;  \n');
fprintf(fid,'pdbar = log(exp(mbar+mu)/(1-exp(mbar+mu)));\n');
fprintf(fid,'pcbar = log(exp(mbar+mu)/(1-exp(mbar+mu)));\n');
fprintf(fid,'ucbar = (1/alpha)*(log(1-delta) - log(1-delta*exp(alpha*mu)));\n');
fprintf(fid,'rfbar = -mbar;  \n');
fprintf(fid,'Qbar = exp((1-gamma)*(ucbar+mu));  \n');
fprintf(fid,'\n');

% Model
fprintf(fid,'model;  \n');
% Cash Flows:
fprintf(fid,'dc = mu + x(-1) + eps_c;  \n');
fprintf(fid,'dd = mu + phi*x(-1) + eps_d;  \n');
fprintf(fid,'x  = rho*x(-1) + eps_x;  \n');
% Utility-Consumption Ratio (in logs):
fprintf(fid,'Q  = exp( ( 1-gamma ) * ( dc(+1) + uc(+1) ) );  \n');
fprintf(fid,'q  = log(Q);  \n');
fprintf(fid,'exp((1-(1/psi))*uc)=(1-delta)+delta*exp(theta*q);\n');
% Stochastic Discount Factor (in logs):
fprintf(fid,'exp(m+1/psi*dc) = delta*exp((1-theta)*(1-gamma)*(uc+dc))*exp(-(1-theta)*q(-1));\n');
% Excess return:
fprintf(fid,'exr = rm - rf(-1); \n');
% Risk-Free Rate
fprintf(fid,'1/exp(rf) = exp(m(+1));\n');
% Ratios: 
fprintf(fid,'exp(pc) = exp(m(+1))*(1+exp(pc(+1)))*exp(dc(+1)); \n');
fprintf(fid,'exp(pd) = exp(m(+1))*(1+exp(pd(+1)))*exp(dd(+1));\n');
% Return on the market portfolio
fprintf(fid,'exp(rm) = (1+exp(pd))/exp(pd(-1))*exp(dd);\n');
% Return on consumption
fprintf(fid,'exp(rc) = (1+exp(pc))/exp(pc(-1))*exp(dc); \n');

fprintf(fid,'end; \n');
fprintf(fid,'  \n');
fprintf(fid,'  \n');

% Steady-state
fprintf(fid, 'initval; \n');
fprintf(fid,'dc     = mu;       \n');
fprintf(fid,'dd     = mu;       \n');
fprintf(fid,'x      = 0;        \n');
fprintf(fid,'Q      = Qbar;     \n');
fprintf(fid,'q   = log(Qbar);  \n');
fprintf(fid,'m      = mbar;         \n');
fprintf(fid,'pd     = pdbar;        \n');
fprintf(fid,'rm     = rfbar;        \n');
fprintf(fid,'exr    = 0;            \n');
fprintf(fid,'rf     = rfbar;        \n');
fprintf(fid,'pc     = pcbar;        \n');
fprintf(fid,'uc     = ucbar;        \n');
fprintf(fid,'rc     = rfbar;        \n');
fprintf(fid,'end;  \n');
fprintf(fid,'  \n');

% Shocks 
fprintf(fid,'vcov = [%e 0 0  \n', sigma_c^2);
fprintf(fid,' 0 %e 0 \n', sigma_x^2);
fprintf(fid,' 0 0 %e];  \n', sigma_d^2);
fprintf(fid,'  \n');
fprintf(fid,'order   = 2;  \n');
%fprintf(fid, 'steady;\n');
%fprintf(fid, 'options_.steady.tol = 1e-10;\n'); %// Setting the tolerance level for steady-state computation
%fprintf(fid, 'stoch_simul(order=2, replic=3);'); %// Use order=1 or order=2, periods for simulation, and the number of replications
fclose(fid);

% Delete previous results from the folder
if exist('RubenFernandez.mat')==2
delete('RubenFernandez.mat');
end


% Solve and load the model
!dynare++ --per 15 --sim 3 --ss-tol 1e-10 RubenFernandez.mod
load RubenFernandez.mat
%dynare RubenFernandez.mod
%load RubenFernandez/Output/RubenFernandez_results.mat



% Print the output (to be improved)
disp('   --------------------------------   ')
disp('   -------- Dynare++ Output--------   ')
disp('   --------------------------------   ')
output = table;
output.Variable = dyn_vars;
output.Value =  num2str(dyn_ss,'%2.2f');
output.Steady_State = num2str(dyn_steady_states,'%2.2f');
disp(output)

% Plot just some values
% temp = num2str(dyn_ss(dyn_i_pc));
% disp([dyn_vars(dyn_i_pc,:) temp]);
% temp = num2str(dyn_ss(dyn_i_pd));
% disp([dyn_vars(dyn_i_pd,:) temp]);


%% Simulations
%%~~~~~~~~~~~~~~~~~~~~

% Volatilitpsi need to be computed by simulations
% Drawing (always the same) shocks
randn('state',state_SIM);
N = 12000; % number of periods for simulations
shocks = mvnrnd([0 0 0],SIGMA,N)';

%shocks = zeros(3,10);
%shocks(2,2) = 1*sqrt(SIGMA(2,2));

out_1 = dynare_simul('RubenFernandez.mat', shocks);

N_prime = 1200;
shocks = mvnrnd([0 0 0],SIGMA,N_prime)';

% Simulating 1200*500 (manual way)
rep = 500;
out_2 = zeros(length(dyn_vars),N_prime,rep);

for i=1:rep
    out_2(:,:,i) = dynare_simul('RubenFernandez.mat', shocks);
end


% Select variable of interest to construct the table
vars = [dyn_i_dc, dyn_i_dd, dyn_i_rc, dyn_i_rm, dyn_i_rf];

% Construct the table (this part is quite generale and can be easily used
% to write a function)
mean_vec_LS         = mean(out_1(vars,:,:),[2 3]);
std_vec_LS          = std(out_1(vars,:,:),0,[2 3]);
mean_vec_SS         = mean(out_2(vars,:,:),[2 3]);
std_vec_SS          = std(out_2(vars,:,:),0,[2 3]);

results             = table;
results.Variable    = dyn_vars(vars',:);
results.Mean_SS     = num2str(mean_vec_SS*1200,'%2.2f');
results.Std_SS      = num2str(std_vec_SS*sqrt(12)*100,'%2.2f');
results.Mean_LS     = num2str(mean_vec_LS*1200,'%2.2f');
results.Std_LS      = num2str(std_vec_LS*sqrt(12)*100,'%2.2f');

disp(results)



delta = .999;
gamma = 10;
psi   = 1.5;
phi   = 2.0;
%%% NOTE: my theta is the inverse of the BY's theta
alpha = 1-1/psi;
theta = (alpha/(1-gamma)); 

sigma_c = sqrt(3.6e-5);
sigma_x = sqrt(9e-8);
sigma_d = sqrt(1.296e-3);
SIGMA = [sigma_c^2 0 0; 0 sigma_x^2 0; 0 0 sigma_d^2];

rho     = .98;
mu      = .0015; 

order   = 2;
%% TABLE OF RESULTS

tab = fopen('tab/results.tex', 'w+');

caption = ['This table is supposed to replicate Bansal and Yaron (2004) results. They ' ...
    'have been obtained by running the model in \texttt{dynare++} using 1200 number of ' ...
    'periods of simulations repeated 500 times. The parameters of the model are fixed as' ...
    'in Bansal and Yaron (2004), i.e., $\delta = 0.999$, $\gamma = 10$, $\psi = 1.5$, ' ...
    '$\phi = 2$. The standard deviation of the shocks, $\varepsilon_t^c$, $\varepsilon_t^x$ and ' ...
    '$\varepsilon_t^d$ are, respectively, $\sigma_c = 0.0059$, $\sigma_x = 0.0003$, and $\sigma_d = 0.036$. ' ...
    'All the shocks are supposed to be uncorrelated. We set $\rho = 0.98$ and $\mu = 0.0015$. ' ...
    'All results are given in annualised percentage units.'];

fprintf(tab, '%s\n', '\begin{table}[h!]');
fprintf(tab, '%s\n', '\captionsetup{font=small, width=0.75\textwidth}');
fprintf(tab, '%s%s%s\n', '\caption{', caption, '} \vspace{0.25cm}');
fprintf(tab, '%s\n', '\centering');
fprintf(tab, '%s\n', '\def\arraystretch{1.5}');
fprintf(tab, '%s\n', '\begin{tabular}{l|cc}' );
fprintf(tab, '%s\n', '\hline');
fprintf(tab, '%s\n', ' & Bootsrapped Mean & Long sample Mean \\');
fprintf(tab, '%s\n', '\toprule');
for i=1:5
    if results.Variable(i,:) == 'dc '
        var = 'Consumption Growth, $\frac{C_{t+1}}{C_t}$';
    end
    if results.Variable(i,:) == 'dd '
        var = 'Dividend Growth, $\frac{D_{t+1}}{D_t}$';
    end
    if results.Variable(i,:) == 'rc '
        var = 'Return on Consumption, $R_t^{C}$';
    end
    if results.Variable(i,:) == 'rm '
        var = 'Return on Dividends, $R_t^D$';
    end
    if results.Variable(i,:) == 'df '
        var = '$Risk-free Rate, $R_t^f$';
    end
    fprintf(tab, '%s %s %s %s %s %s %s %s %s %s \n', var, '& $' ,results.Mean_SS(i,:), ')$ & $(', results.Mean_LS(i,:),')$ \\ ');
    fprintf(tab, '%s %s %s %s %s %s %s %s %s %s \n', ' ', '& $(' ,results.Std_SS(i,:), ')$ & $(', results.Std_LS(i,:),')$ \\ ');
     if i==5
    fprintf(tab,'%s\n','\bottomrule');
    end
end
fprintf(tab,'%s\n', '\end{tabular}');
fprintf(tab, '%s\n','\end{table}');

%% PDF LATEX
% Here you should put the appropriate directory where pdflatex executable
% is located.
[status, cmdout] = system('/usr/local/texlive/2022/bin/universal-darwin/pdflatex Main_RubenFernandez.tex > /dev/null');

if status == 0
    fprintf('Compilation successful.\n');
else
    fprintf('Compilation failed.\n');
    disp(cmdout); % This will display the error output from LaTeX
end
system('open Main_RubenFernandez.pdf');

