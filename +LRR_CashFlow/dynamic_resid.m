function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
% function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = LRR_CashFlow.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(12, 1);
lhs = y(7);
rhs = params(5)+y(1)+x(it_, 1);
residual(1) = lhs - rhs;
lhs = y(8);
rhs = params(5)+y(1)*params(7)+x(it_, 3);
residual(2) = lhs - rhs;
lhs = y(6);
rhs = y(1)*params(6)+x(it_, 2);
residual(3) = lhs - rhs;
lhs = y(17);
rhs = exp((1-params(3))*(y(18)+y(20)));
residual(4) = lhs - rhs;
lhs = exp((1-1/params(4))*y(9));
rhs = 1+params(1)*(y(17)^params(2)-1);
residual(5) = lhs - rhs;
lhs = T(1);
rhs = y(5);
residual(6) = lhs - rhs;
lhs = y(14);
rhs = y(13)-y(4);
residual(7) = lhs - rhs;
lhs = 1/exp(y(15));
rhs = exp(y(21));
residual(8) = lhs - rhs;
lhs = exp(y(12));
rhs = exp(y(18)+y(21))*(1+exp(y(23)));
residual(9) = lhs - rhs;
lhs = exp(y(11));
rhs = exp(y(21)+y(19))*(1+exp(y(22)));
residual(10) = lhs - rhs;
lhs = exp(y(16)+y(3)-y(7));
rhs = 1+exp(y(12));
residual(11) = lhs - rhs;
lhs = exp(y(13)+y(2)-y(8));
rhs = 1+exp(y(11));
residual(12) = lhs - rhs;

end
