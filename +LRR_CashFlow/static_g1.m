function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
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
%   g1
%

if T_flag
    T = LRR_CashFlow.static_g1_tt(T, y, x, params);
end
g1 = zeros(12, 12);
g1(1,1)=(-1);
g1(1,2)=1;
g1(2,1)=(-params(7));
g1(2,3)=1;
g1(3,1)=1-params(6);
g1(4,2)=(-((1-params(3))*exp((1-params(3))*(y(2)+y(4)))));
g1(4,4)=(-((1-params(3))*exp((1-params(3))*(y(2)+y(4)))));
g1(4,12)=1;
g1(5,4)=(1-1/params(4))*exp(y(4)*(1-1/params(4)));
g1(5,12)=(-(params(1)*getPowerDeriv(y(12),params(2),1)));
g1(6,2)=T(1)*((-(1/params(4)))-(1-params(3))*(1-params(2)));
g1(6,4)=T(1)*(-((1-params(3))*(1-params(2))));
g1(6,5)=(-T(1));
g1(6,12)=(-1);
g1(7,8)=(-1);
g1(7,9)=1;
g1(7,10)=1;
g1(8,5)=(-exp(y(5)));
g1(8,10)=(-exp(y(10)))/(exp(y(10))*exp(y(10)));
g1(9,2)=(-(exp(y(2)+y(5))*(1+exp(y(7)))));
g1(9,5)=(-(exp(y(2)+y(5))*(1+exp(y(7)))));
g1(9,7)=exp(y(7))-exp(y(7))*exp(y(2)+y(5));
g1(10,3)=(-(exp(y(3)+y(5))*(1+exp(y(6)))));
g1(10,5)=(-(exp(y(3)+y(5))*(1+exp(y(6)))));
g1(10,6)=exp(y(6))-exp(y(6))*exp(y(3)+y(5));
g1(11,2)=(-exp(y(7)+y(11)-y(2)));
g1(11,7)=exp(y(7)+y(11)-y(2))-exp(y(7));
g1(11,11)=exp(y(7)+y(11)-y(2));
g1(12,3)=(-exp(y(8)+y(6)-y(3)));
g1(12,6)=exp(y(8)+y(6)-y(3))-exp(y(6));
g1(12,8)=exp(y(8)+y(6)-y(3));
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
