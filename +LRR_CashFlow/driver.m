%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'LRR_CashFlow';
M_.dynare_version = '5.3';
oo_.dynare_version = '5.3';
options_.dynare_version = '5.3';
%
% Some global variables initialization
%
global_initialization;
M_.exo_names = cell(3,1);
M_.exo_names_tex = cell(3,1);
M_.exo_names_long = cell(3,1);
M_.exo_names(1) = {'eps_c'};
M_.exo_names_tex(1) = {'eps\_c'};
M_.exo_names_long(1) = {'eps_c'};
M_.exo_names(2) = {'eps_x'};
M_.exo_names_tex(2) = {'eps\_x'};
M_.exo_names_long(2) = {'eps_x'};
M_.exo_names(3) = {'eps_d'};
M_.exo_names_tex(3) = {'eps\_d'};
M_.exo_names_long(3) = {'eps_d'};
M_.endo_names = cell(12,1);
M_.endo_names_tex = cell(12,1);
M_.endo_names_long = cell(12,1);
M_.endo_names(1) = {'x'};
M_.endo_names_tex(1) = {'x'};
M_.endo_names_long(1) = {'x'};
M_.endo_names(2) = {'dc'};
M_.endo_names_tex(2) = {'dc'};
M_.endo_names_long(2) = {'dc'};
M_.endo_names(3) = {'dd'};
M_.endo_names_tex(3) = {'dd'};
M_.endo_names_long(3) = {'dd'};
M_.endo_names(4) = {'uc'};
M_.endo_names_tex(4) = {'uc'};
M_.endo_names_long(4) = {'uc'};
M_.endo_names(5) = {'m'};
M_.endo_names_tex(5) = {'m'};
M_.endo_names_long(5) = {'m'};
M_.endo_names(6) = {'pd'};
M_.endo_names_tex(6) = {'pd'};
M_.endo_names_long(6) = {'pd'};
M_.endo_names(7) = {'pc'};
M_.endo_names_tex(7) = {'pc'};
M_.endo_names_long(7) = {'pc'};
M_.endo_names(8) = {'rm'};
M_.endo_names_tex(8) = {'rm'};
M_.endo_names_long(8) = {'rm'};
M_.endo_names(9) = {'exr'};
M_.endo_names_tex(9) = {'exr'};
M_.endo_names_long(9) = {'exr'};
M_.endo_names(10) = {'rf'};
M_.endo_names_tex(10) = {'rf'};
M_.endo_names_long(10) = {'rf'};
M_.endo_names(11) = {'rc'};
M_.endo_names_tex(11) = {'rc'};
M_.endo_names_long(11) = {'rc'};
M_.endo_names(12) = {'Q'};
M_.endo_names_tex(12) = {'Q'};
M_.endo_names_long(12) = {'Q'};
M_.endo_partitions = struct();
M_.param_names = cell(7,1);
M_.param_names_tex = cell(7,1);
M_.param_names_long = cell(7,1);
M_.param_names(1) = {'delta'};
M_.param_names_tex(1) = {'delta'};
M_.param_names_long(1) = {'delta'};
M_.param_names(2) = {'theta'};
M_.param_names_tex(2) = {'theta'};
M_.param_names_long(2) = {'theta'};
M_.param_names(3) = {'gamma'};
M_.param_names_tex(3) = {'gamma'};
M_.param_names_long(3) = {'gamma'};
M_.param_names(4) = {'psi'};
M_.param_names_tex(4) = {'psi'};
M_.param_names_long(4) = {'psi'};
M_.param_names(5) = {'mu'};
M_.param_names_tex(5) = {'mu'};
M_.param_names_long(5) = {'mu'};
M_.param_names(6) = {'rho'};
M_.param_names_tex(6) = {'rho'};
M_.param_names_long(6) = {'rho'};
M_.param_names(7) = {'phi'};
M_.param_names_tex(7) = {'phi'};
M_.param_names_long(7) = {'phi'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 3;
M_.endo_nbr = 12;
M_.param_nbr = 7;
M_.orig_endo_nbr = 12;
M_.aux_vars = [];
M_ = setup_solvers(M_);
M_.Sigma_e = zeros(3, 3);
M_.Correlation_matrix = eye(3, 3);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
M_.surprise_shocks = [];
M_.heteroskedastic_shocks.Qvalue_orig = [];
M_.heteroskedastic_shocks.Qscale_orig = [];
options_.linear = false;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
M_.nonzero_hessian_eqs = [4 5 6 8 9 10 11 12];
M_.hessian_eq_zero = isempty(M_.nonzero_hessian_eqs);
M_.orig_eq_nbr = 12;
M_.eq_nbr = 12;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 1;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 1;
M_.orig_maximum_lag_with_diffs_expanded = 1;
M_.lead_lag_incidence = [
 1 6 0;
 0 7 18;
 0 8 19;
 0 9 20;
 0 10 21;
 2 11 22;
 3 12 23;
 0 13 0;
 0 14 0;
 4 15 0;
 0 16 0;
 5 17 0;]';
M_.nstatic = 3;
M_.nfwrd   = 4;
M_.npred   = 3;
M_.nboth   = 2;
M_.nsfwrd   = 6;
M_.nspred   = 5;
M_.ndynamic   = 9;
M_.dynamic_tmp_nbr = [1; 2; 0; 0; ];
M_.model_local_variables_dynamic_tt_idxs = {
};
M_.equations_tags = {
  1 , 'name' , 'dc' ;
  2 , 'name' , 'dd' ;
  3 , 'name' , 'x' ;
  4 , 'name' , 'Q' ;
  5 , 'name' , '5' ;
  6 , 'name' , '6' ;
  7 , 'name' , 'exr' ;
  8 , 'name' , '8' ;
  9 , 'name' , '9' ;
  10 , 'name' , '10' ;
  11 , 'name' , '11' ;
  12 , 'name' , '12' ;
};
M_.mapping.x.eqidx = [1 2 3 ];
M_.mapping.dc.eqidx = [1 4 6 9 11 ];
M_.mapping.dd.eqidx = [2 10 12 ];
M_.mapping.uc.eqidx = [4 5 6 ];
M_.mapping.m.eqidx = [6 8 9 10 ];
M_.mapping.pd.eqidx = [10 12 ];
M_.mapping.pc.eqidx = [9 11 ];
M_.mapping.rm.eqidx = [7 12 ];
M_.mapping.exr.eqidx = [7 ];
M_.mapping.rf.eqidx = [7 8 ];
M_.mapping.rc.eqidx = [11 ];
M_.mapping.Q.eqidx = [4 5 6 ];
M_.mapping.eps_c.eqidx = [1 ];
M_.mapping.eps_x.eqidx = [3 ];
M_.mapping.eps_d.eqidx = [2 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [1 6 7 10 12 ];
M_.exo_names_orig_ord = [1:3];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(12, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(3, 1);
M_.params = NaN(7, 1);
M_.endo_trends = struct('deflator', cell(12, 1), 'log_deflator', cell(12, 1), 'growth_factor', cell(12, 1), 'log_growth_factor', cell(12, 1));
M_.NNZDerivatives = [39; 57; -1; ];
M_.static_tmp_nbr = [1; 0; 0; 0; ];
M_.model_local_variables_static_tt_idxs = {
};
M_.params(3) = 10;
gamma = M_.params(3);
M_.params(4) = 1.5;
psi = M_.params(4);
M_.params(1) = .999;
delta = M_.params(1);
M_.params(5) = .0015;
mu = M_.params(5);
M_.params(6) = .98;
rho = M_.params(6);
M_.params(7) = 2.0;
phi = M_.params(7);
M_.params(2) = (1-1/M_.params(4))/(1-M_.params(3));
theta = M_.params(2);
mbar = log(delta) - mu/psi;  
pdbar = log(exp(mbar+mu)/(1-exp(mbar+mu)));
pcbar = log(exp(mbar+mu)/(1-exp(mbar+mu)));
ucbar = (1/(1 - 1/psi))*log((1-delta)*(exp(pcbar)+1));
rfbar = -mbar;  
Qbar = exp((1-gamma)*(ucbar+mu)); 
%
% INITVAL instructions
%
options_.initval_file = false;
oo_.steady_state(2) = M_.params(5);
oo_.steady_state(3) = M_.params(5);
oo_.steady_state(1) = 0;
oo_.steady_state(12) = Qbar;
oo_.steady_state(5) = mbar;
oo_.steady_state(6) = pdbar;
oo_.steady_state(8) = rfbar;
oo_.steady_state(9) = 0;
oo_.steady_state(10) = rfbar;
oo_.steady_state(7) = pcbar;
oo_.steady_state(4) = ucbar;
oo_.steady_state(11) = rfbar;
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
vcov =  [3.6e-5  0    0
0   9e-8    0
0      0  0.001296];
order = 2;


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'LRR_CashFlow_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'LRR_CashFlow_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'LRR_CashFlow_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'LRR_CashFlow_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'LRR_CashFlow_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'LRR_CashFlow_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'LRR_CashFlow_results.mat'], 'oo_recursive_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
