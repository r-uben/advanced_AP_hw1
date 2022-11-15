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
    T = RubenFernandez.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(13, 27);
g1(1,6)=1;
g1(1,1)=(-1);
g1(1,25)=(-1);
g1(2,7)=1;
g1(2,1)=(-params(6));
g1(2,27)=(-1);
g1(3,1)=(-params(7));
g1(3,8)=1;
g1(3,26)=(-1);
g1(4,19)=(-((1-params(2))*exp((1-params(2))*(y(19)+y(21)))));
g1(4,21)=(-((1-params(2))*exp((1-params(2))*(y(19)+y(21)))));
g1(4,17)=1;
g1(5,17)=(-(1/y(17)));
g1(5,18)=1;
g1(6,9)=T(5);
g1(6,18)=(-(params(1)*params(5)*exp(y(18)*params(5))));
g1(7,6)=T(1)*T(2)-exp((-(1-params(5)))*y(5))*params(1)*(1-params(2))*(1-params(5))*exp((1-params(2))*(1-params(5))*(y(6)+y(9)));
g1(7,9)=(-(exp((-(1-params(5)))*y(5))*params(1)*(1-params(2))*(1-params(5))*exp((1-params(2))*(1-params(5))*(y(6)+y(9)))));
g1(7,10)=T(2);
g1(7,5)=(-(params(1)*exp((1-params(2))*(1-params(5))*(y(6)+y(9)))*(-(1-params(5)))*exp((-(1-params(5)))*y(5))));
g1(8,13)=(-1);
g1(8,14)=1;
g1(8,4)=1;
g1(9,22)=(-exp(y(22)));
g1(9,15)=(-exp(y(15)))/(exp(y(15))*exp(y(15)));
g1(10,19)=T(3);
g1(10,22)=T(3);
g1(10,12)=exp(y(12));
g1(10,24)=(-(exp(y(19))*exp(y(22))*exp(y(24))));
g1(11,20)=T(4);
g1(11,22)=T(4);
g1(11,11)=exp(y(11));
g1(11,23)=(-(exp(y(20))*exp(y(22))*exp(y(23))));
g1(12,7)=(-((1+exp(y(11)))/exp(y(2))*exp(y(7))));
g1(12,2)=T(6);
g1(12,11)=T(7);
g1(12,13)=exp(y(13));
g1(13,6)=(-((1+exp(y(12)))/exp(y(3))*exp(y(6))));
g1(13,3)=T(8);
g1(13,12)=T(9);
g1(13,16)=exp(y(16));

end
