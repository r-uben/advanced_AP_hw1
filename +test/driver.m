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
M_.fname = 'test';
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
M_.exo_names(1) = {'ec'};
M_.exo_names_tex(1) = {'ec'};
M_.exo_names_long(1) = {'ec'};
M_.exo_names(2) = {'ex'};
M_.exo_names_tex(2) = {'ex'};
M_.exo_names_long(2) = {'ex'};
M_.exo_names(3) = {'ed'};
M_.exo_names_tex(3) = {'ed'};
M_.exo_names_long(3) = {'ed'};
M_.endo_names = cell(3,1);
M_.endo_names_tex = cell(3,1);
M_.endo_names_long = cell(3,1);
M_.endo_names(1) = {'dc'};
M_.endo_names_tex(1) = {'dc'};
M_.endo_names_long(1) = {'dc'};
M_.endo_names(2) = {'x'};
M_.endo_names_tex(2) = {'x'};
M_.endo_names_long(2) = {'x'};
M_.endo_names(3) = {'dd'};
M_.endo_names_tex(3) = {'dd'};
M_.endo_names_long(3) = {'dd'};
M_.endo_partitions = struct();
M_.param_names = cell(7,1);
M_.param_names_tex = cell(7,1);
M_.param_names_long = cell(7,1);
M_.param_names(1) = {'del'};
M_.param_names_tex(1) = {'del'};
M_.param_names_long(1) = {'del'};
M_.param_names(2) = {'theta'};
M_.param_names_tex(2) = {'theta'};
M_.param_names_long(2) = {'theta'};
M_.param_names(3) = {'gam'};
M_.param_names_tex(3) = {'gam'};
M_.param_names_long(3) = {'gam'};
M_.param_names(4) = {'ies'};
M_.param_names_tex(4) = {'ies'};
M_.param_names_long(4) = {'ies'};
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
M_.endo_nbr = 3;
M_.param_nbr = 7;
M_.orig_endo_nbr = 3;
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
M_.nonzero_hessian_eqs = [];
M_.hessian_eq_zero = isempty(M_.nonzero_hessian_eqs);
M_.orig_eq_nbr = 3;
M_.eq_nbr = 3;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 0;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 0;
M_.orig_maximum_lag_with_diffs_expanded = 1;
M_.lead_lag_incidence = [
 0 2;
 1 3;
 0 4;]';
M_.nstatic = 2;
M_.nfwrd   = 0;
M_.npred   = 1;
M_.nboth   = 0;
M_.nsfwrd   = 0;
M_.nspred   = 1;
M_.ndynamic   = 1;
M_.dynamic_tmp_nbr = [0; 0; 0; 0; ];
M_.model_local_variables_dynamic_tt_idxs = {
};
M_.equations_tags = {
  1 , 'name' , 'dc' ;
  2 , 'name' , 'dd' ;
  3 , 'name' , 'x' ;
};
M_.mapping.dc.eqidx = [1 ];
M_.mapping.x.eqidx = [1 2 3 ];
M_.mapping.dd.eqidx = [2 ];
M_.mapping.ec.eqidx = [1 ];
M_.mapping.ex.eqidx = [3 ];
M_.mapping.ed.eqidx = [2 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [2 ];
M_.exo_names_orig_ord = [1:3];
M_.maximum_lag = 1;
M_.maximum_lead = 0;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 0;
oo_.steady_state = zeros(3, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(3, 1);
M_.params = NaN(7, 1);
M_.endo_trends = struct('deflator', cell(3, 1), 'log_deflator', cell(3, 1), 'growth_factor', cell(3, 1), 'log_growth_factor', cell(3, 1));
M_.NNZDerivatives = [9; 0; -1; ];
M_.static_tmp_nbr = [0; 0; 0; 0; ];
M_.model_local_variables_static_tt_idxs = {
};
M_.params(3) = 10;
gam = M_.params(3);
M_.params(4) = 1.5;
ies = M_.params(4);
M_.params(1) = .999;
del = M_.params(1);
M_.params(2) = (1-1/M_.params(4))/(1-M_.params(3));
theta = M_.params(2);
M_.params(5) = .0015;
mu = M_.params(5);
M_.params(6) = .98;
rho = M_.params(6);
M_.params(7) = 2.0;
phi = M_.params(7);
%
% INITVAL instructions
%
options_.initval_file = false;
oo_.steady_state(1) = M_.params(5);
oo_.steady_state(3) = M_.params(5);
oo_.steady_state(2) = 0;
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
save_params_and_steady_state('test.mat');


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'test_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'test_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'test_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'test_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'test_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'test_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'test_results.mat'], 'oo_recursive_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
