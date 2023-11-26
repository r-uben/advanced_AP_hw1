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
M_.fname = 'RubenFernandez';
M_.dynare_version = '5.4';
oo_.dynare_version = '5.4';
options_.dynare_version = '5.4';
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
M_.endo_names = cell(13,1);
M_.endo_names_tex = cell(13,1);
M_.endo_names_long = cell(13,1);
M_.endo_names(1) = {'dc'};
M_.endo_names_tex(1) = {'dc'};
M_.endo_names_long(1) = {'dc'};
M_.endo_names(2) = {'dd'};
M_.endo_names_tex(2) = {'dd'};
M_.endo_names_long(2) = {'dd'};
M_.endo_names(3) = {'x'};
M_.endo_names_tex(3) = {'x'};
M_.endo_names_long(3) = {'x'};
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
M_.endo_names(13) = {'q'};
M_.endo_names_tex(13) = {'q'};
M_.endo_names_long(13) = {'q'};
M_.endo_partitions = struct();
M_.param_names = cell(14,1);
M_.param_names_tex = cell(14,1);
M_.param_names_long = cell(14,1);
M_.param_names(1) = {'delta'};
M_.param_names_tex(1) = {'delta'};
M_.param_names_long(1) = {'delta'};
M_.param_names(2) = {'gamma'};
M_.param_names_tex(2) = {'gamma'};
M_.param_names_long(2) = {'gamma'};
M_.param_names(3) = {'mu'};
M_.param_names_tex(3) = {'mu'};
M_.param_names_long(3) = {'mu'};
M_.param_names(4) = {'psi'};
M_.param_names_tex(4) = {'psi'};
M_.param_names_long(4) = {'psi'};
M_.param_names(5) = {'theta'};
M_.param_names_tex(5) = {'theta'};
M_.param_names_long(5) = {'theta'};
M_.param_names(6) = {'alpha'};
M_.param_names_tex(6) = {'alpha'};
M_.param_names_long(6) = {'alpha'};
M_.param_names(7) = {'phi'};
M_.param_names_tex(7) = {'phi'};
M_.param_names_long(7) = {'phi'};
M_.param_names(8) = {'rho'};
M_.param_names_tex(8) = {'rho'};
M_.param_names_long(8) = {'rho'};
M_.param_names(9) = {'ucbar'};
M_.param_names_tex(9) = {'ucbar'};
M_.param_names_long(9) = {'ucbar'};
M_.param_names(10) = {'pdbar'};
M_.param_names_tex(10) = {'pdbar'};
M_.param_names_long(10) = {'pdbar'};
M_.param_names(11) = {'pcbar'};
M_.param_names_tex(11) = {'pcbar'};
M_.param_names_long(11) = {'pcbar'};
M_.param_names(12) = {'rfbar'};
M_.param_names_tex(12) = {'rfbar'};
M_.param_names_long(12) = {'rfbar'};
M_.param_names(13) = {'Qbar'};
M_.param_names_tex(13) = {'Qbar'};
M_.param_names_long(13) = {'Qbar'};
M_.param_names(14) = {'mbar'};
M_.param_names_tex(14) = {'mbar'};
M_.param_names_long(14) = {'mbar'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 3;
M_.endo_nbr = 13;
M_.param_nbr = 14;
M_.orig_endo_nbr = 13;
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
M_.nonzero_hessian_eqs = [4 5 6 7 9 10 11 12 13];
M_.hessian_eq_zero = isempty(M_.nonzero_hessian_eqs);
M_.orig_eq_nbr = 13;
M_.eq_nbr = 13;
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
 0 6 19;
 0 7 20;
 1 8 0;
 0 9 21;
 0 10 22;
 2 11 23;
 3 12 24;
 0 13 0;
 0 14 0;
 4 15 0;
 0 16 0;
 0 17 0;
 5 18 0;]';
M_.nstatic = 4;
M_.nfwrd   = 4;
M_.npred   = 3;
M_.nboth   = 2;
M_.nsfwrd   = 6;
M_.nspred   = 5;
M_.ndynamic   = 9;
M_.dynamic_tmp_nbr = [2; 7; 2; 0; ];
M_.model_local_variables_dynamic_tt_idxs = {
};
M_.equations_tags = {
  1 , 'name' , 'dc' ;
  2 , 'name' , 'dd' ;
  3 , 'name' , 'x' ;
  4 , 'name' , 'Q' ;
  5 , 'name' , 'q' ;
  6 , 'name' , '6' ;
  7 , 'name' , '7' ;
  8 , 'name' , 'exr' ;
  9 , 'name' , '9' ;
  10 , 'name' , '10' ;
  11 , 'name' , '11' ;
  12 , 'name' , '12' ;
  13 , 'name' , '13' ;
};
M_.mapping.dc.eqidx = [1 4 7 10 13 ];
M_.mapping.dd.eqidx = [2 11 12 ];
M_.mapping.x.eqidx = [1 2 3 ];
M_.mapping.uc.eqidx = [4 6 7 ];
M_.mapping.m.eqidx = [7 9 10 11 ];
M_.mapping.pd.eqidx = [11 12 ];
M_.mapping.pc.eqidx = [10 13 ];
M_.mapping.rm.eqidx = [8 12 ];
M_.mapping.exr.eqidx = [8 ];
M_.mapping.rf.eqidx = [8 9 ];
M_.mapping.rc.eqidx = [13 ];
M_.mapping.Q.eqidx = [4 5 ];
M_.mapping.q.eqidx = [5 6 7 ];
M_.mapping.eps_c.eqidx = [1 ];
M_.mapping.eps_x.eqidx = [3 ];
M_.mapping.eps_d.eqidx = [2 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [3 6 7 10 13 ];
M_.exo_names_orig_ord = [1:3];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(13, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(3, 1);
M_.params = NaN(14, 1);
M_.endo_trends = struct('deflator', cell(13, 1), 'log_deflator', cell(13, 1), 'growth_factor', cell(13, 1), 'log_growth_factor', cell(13, 1));
M_.NNZDerivatives = [41; 61; -1; ];
M_.static_tmp_nbr = [1; 0; 0; 0; ];
M_.model_local_variables_static_tt_idxs = {
};
M_.params(4) = 1.500000e+00;
psi = M_.params(4);
M_.params(5) = (-3.703704e-02);
theta = M_.params(5);
M_.params(6) = 3.333333e-01;
alpha = M_.params(6);
M_.params(7) = 2.000000e+00;
phi = M_.params(7);
M_.params(2) = 1.000000e+01;
gamma = M_.params(2);
M_.params(1) = 9.990000e-01;
delta = M_.params(1);
M_.params(3) = 1.500000e-03;
mu = M_.params(3);
M_.params(8) = 9.800000e-01;
rho = M_.params(8);
M_.params(14) = log(M_.params(1))-M_.params(3)/M_.params(4);
mbar = M_.params(14);
M_.params(10) = log(exp(M_.params(3)+M_.params(14))/(1-exp(M_.params(3)+M_.params(14))));
pdbar = M_.params(10);
M_.params(11) = log(exp(M_.params(3)+M_.params(14))/(1-exp(M_.params(3)+M_.params(14))));
pcbar = M_.params(11);
M_.params(9) = 1/M_.params(6)*(log(1-M_.params(1))-log(1-M_.params(1)*exp(M_.params(3)*M_.params(6))));
ucbar = M_.params(9);
M_.params(12) = (-M_.params(14));
rfbar = M_.params(12);
M_.params(13) = exp((1-M_.params(2))*(M_.params(3)+M_.params(9)));
Qbar = M_.params(13);
%
% INITVAL instructions
%
options_.initval_file = false;
oo_.steady_state(1) = M_.params(3);
oo_.steady_state(2) = M_.params(3);
oo_.steady_state(3) = 0;
oo_.steady_state(12) = M_.params(13);
oo_.steady_state(13) = log(M_.params(13));
oo_.steady_state(5) = M_.params(14);
oo_.steady_state(6) = M_.params(10);
oo_.steady_state(8) = M_.params(12);
oo_.steady_state(9) = 0;
oo_.steady_state(10) = M_.params(12);
oo_.steady_state(7) = M_.params(11);
oo_.steady_state(4) = M_.params(9);
oo_.steady_state(11) = M_.params(12);
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
vcov = [3.600000e-05 0 0  
0 9.000000e-08 0 
0 0 1.296000e-03];  
steady;
options_.steady.tol = 1e-10;
options_.order = 2;
options_.replic = 3;
var_list_ = {};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'RubenFernandez_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RubenFernandez_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RubenFernandez_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RubenFernandez_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RubenFernandez_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RubenFernandez_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RubenFernandez_results.mat'], 'oo_recursive_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
