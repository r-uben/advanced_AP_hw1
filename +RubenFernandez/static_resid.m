function residual = static_resid(T, y, x, params, T_flag)
% function residual = static_resid(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = RubenFernandez.static_resid_tt(T, y, x, params);
end
residual = zeros(13, 1);
lhs = y(1);
rhs = params(3)+y(3)+x(1);
residual(1) = lhs - rhs;
lhs = y(2);
rhs = params(3)+y(3)*params(7)+x(3);
residual(2) = lhs - rhs;
lhs = y(3);
rhs = y(3)*params(8)+x(2);
residual(3) = lhs - rhs;
lhs = y(12);
rhs = exp((1-params(2))*(y(1)+y(4)));
residual(4) = lhs - rhs;
lhs = y(13);
rhs = log(y(12));
residual(5) = lhs - rhs;
lhs = exp(y(4)*(1-1/params(4)));
rhs = 1-params(1)+params(1)*exp(y(13)*params(5));
residual(6) = lhs - rhs;
lhs = T(1);
rhs = params(1)*exp((y(1)+y(4))*(1-params(2))*(1-params(5)))*exp(y(13)*(-(1-params(5))));
residual(7) = lhs - rhs;
lhs = y(9);
rhs = y(8)-y(10);
residual(8) = lhs - rhs;
lhs = 1/exp(y(10));
rhs = exp(y(5));
residual(9) = lhs - rhs;
lhs = exp(y(7));
rhs = exp(y(5))*(1+exp(y(7)))*exp(y(1));
residual(10) = lhs - rhs;
lhs = exp(y(6));
rhs = exp(y(5))*(1+exp(y(6)))*exp(y(2));
residual(11) = lhs - rhs;
lhs = exp(y(8));
rhs = exp(y(2))*(1+exp(y(6)))/exp(y(6));
residual(12) = lhs - rhs;
lhs = exp(y(11));
rhs = exp(y(1))*(1+exp(y(7)))/exp(y(7));
residual(13) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
