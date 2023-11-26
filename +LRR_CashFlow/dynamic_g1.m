function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
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
%   g1
%

if T_flag
    T = LRR_CashFlow.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(12, 26);
g1(1,1)=(-1);
g1(1,7)=1;
g1(1,24)=(-1);
g1(2,1)=(-params(7));
g1(2,8)=1;
g1(2,26)=(-1);
g1(3,1)=(-params(6));
g1(3,6)=1;
g1(3,25)=(-1);
g1(4,18)=(-((1-params(3))*exp((1-params(3))*(y(18)+y(20)))));
g1(4,20)=(-((1-params(3))*exp((1-params(3))*(y(18)+y(20)))));
g1(4,17)=1;
g1(5,9)=T(3);
g1(5,17)=(-(params(1)*getPowerDeriv(y(17),params(2),1)));
g1(6,7)=T(1)*T(2);
g1(6,9)=T(1)*(-((1-params(3))*(1-params(2))));
g1(6,10)=(-T(1));
g1(6,5)=(-1);
g1(7,13)=(-1);
g1(7,14)=1;
g1(7,4)=1;
g1(8,21)=(-exp(y(21)));
g1(8,15)=(-exp(y(15)))/(exp(y(15))*exp(y(15)));
g1(9,18)=(-(exp(y(18)+y(21))*(1+exp(y(23)))));
g1(9,21)=(-(exp(y(18)+y(21))*(1+exp(y(23)))));
g1(9,12)=exp(y(12));
g1(9,23)=(-(exp(y(18)+y(21))*exp(y(23))));
g1(10,19)=(-(exp(y(21)+y(19))*(1+exp(y(22)))));
g1(10,21)=(-(exp(y(21)+y(19))*(1+exp(y(22)))));
g1(10,11)=exp(y(11));
g1(10,22)=(-(exp(y(21)+y(19))*exp(y(22))));
g1(11,7)=(-exp(y(16)+y(3)-y(7)));
g1(11,3)=exp(y(16)+y(3)-y(7));
g1(11,12)=(-exp(y(12)));
g1(11,16)=exp(y(16)+y(3)-y(7));
g1(12,8)=(-exp(y(13)+y(2)-y(8)));
g1(12,2)=exp(y(13)+y(2)-y(8));
g1(12,11)=(-exp(y(11)));
g1(12,13)=exp(y(13)+y(2)-y(8));

end
