function g2 = dynamic_g2(T, y, x, params, steady_state, it_, T_flag)
% function g2 = dynamic_g2(T, y, x, params, steady_state, it_, T_flag)
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
%   g2
%

if T_flag
    T = LRR_CashFlow.dynamic_g2_tt(T, y, x, params, steady_state, it_);
end
g2_i = zeros(57,1);
g2_j = zeros(57,1);
g2_v = zeros(57,1);

g2_i(1)=4;
g2_i(2)=4;
g2_i(3)=4;
g2_i(4)=4;
g2_i(5)=5;
g2_i(6)=5;
g2_i(7)=6;
g2_i(8)=6;
g2_i(9)=6;
g2_i(10)=6;
g2_i(11)=6;
g2_i(12)=6;
g2_i(13)=6;
g2_i(14)=6;
g2_i(15)=6;
g2_i(16)=8;
g2_i(17)=8;
g2_i(18)=9;
g2_i(19)=9;
g2_i(20)=9;
g2_i(21)=9;
g2_i(22)=9;
g2_i(23)=9;
g2_i(24)=9;
g2_i(25)=9;
g2_i(26)=9;
g2_i(27)=9;
g2_i(28)=10;
g2_i(29)=10;
g2_i(30)=10;
g2_i(31)=10;
g2_i(32)=10;
g2_i(33)=10;
g2_i(34)=10;
g2_i(35)=10;
g2_i(36)=10;
g2_i(37)=10;
g2_i(38)=11;
g2_i(39)=11;
g2_i(40)=11;
g2_i(41)=11;
g2_i(42)=11;
g2_i(43)=11;
g2_i(44)=11;
g2_i(45)=11;
g2_i(46)=11;
g2_i(47)=11;
g2_i(48)=12;
g2_i(49)=12;
g2_i(50)=12;
g2_i(51)=12;
g2_i(52)=12;
g2_i(53)=12;
g2_i(54)=12;
g2_i(55)=12;
g2_i(56)=12;
g2_i(57)=12;
g2_j(1)=460;
g2_j(2)=462;
g2_j(3)=512;
g2_j(4)=514;
g2_j(5)=217;
g2_j(6)=433;
g2_j(7)=163;
g2_j(8)=165;
g2_j(9)=215;
g2_j(10)=166;
g2_j(11)=241;
g2_j(12)=217;
g2_j(13)=218;
g2_j(14)=243;
g2_j(15)=244;
g2_j(16)=541;
g2_j(17)=379;
g2_j(18)=460;
g2_j(19)=463;
g2_j(20)=538;
g2_j(21)=465;
g2_j(22)=590;
g2_j(23)=541;
g2_j(24)=543;
g2_j(25)=593;
g2_j(26)=298;
g2_j(27)=595;
g2_j(28)=487;
g2_j(29)=489;
g2_j(30)=539;
g2_j(31)=490;
g2_j(32)=565;
g2_j(33)=541;
g2_j(34)=542;
g2_j(35)=567;
g2_j(36)=271;
g2_j(37)=568;
g2_j(38)=163;
g2_j(39)=159;
g2_j(40)=59;
g2_j(41)=172;
g2_j(42)=397;
g2_j(43)=55;
g2_j(44)=68;
g2_j(45)=393;
g2_j(46)=298;
g2_j(47)=406;
g2_j(48)=190;
g2_j(49)=184;
g2_j(50)=34;
g2_j(51)=195;
g2_j(52)=320;
g2_j(53)=28;
g2_j(54)=39;
g2_j(55)=314;
g2_j(56)=271;
g2_j(57)=325;
g2_v(1)=(-((1-params(3))*(1-params(3))*exp((1-params(3))*(y(18)+y(20)))));
g2_v(2)=(-((1-params(3))*(1-params(3))*exp((1-params(3))*(y(18)+y(20)))));
g2_v(3)=g2_v(2);
g2_v(4)=(-((1-params(3))*(1-params(3))*exp((1-params(3))*(y(18)+y(20)))));
g2_v(5)=(1-1/params(4))*T(3);
g2_v(6)=(-(params(1)*getPowerDeriv(y(17),params(2),2)));
g2_v(7)=T(2)*T(1)*T(2);
g2_v(8)=T(2)*T(1)*(-((1-params(3))*(1-params(2))));
g2_v(9)=g2_v(8);
g2_v(10)=T(2)*(-T(1));
g2_v(11)=g2_v(10);
g2_v(12)=(-((1-params(3))*(1-params(2))))*T(1)*(-((1-params(3))*(1-params(2))));
g2_v(13)=(-((1-params(3))*(1-params(2))))*(-T(1));
g2_v(14)=g2_v(13);
g2_v(15)=T(1);
g2_v(16)=(-exp(y(21)));
g2_v(17)=((-exp(y(15)))*exp(y(15))*exp(y(15))-(-exp(y(15)))*(exp(y(15))*exp(y(15))+exp(y(15))*exp(y(15))))/(exp(y(15))*exp(y(15))*exp(y(15))*exp(y(15)));
g2_v(18)=(-(exp(y(18)+y(21))*(1+exp(y(23)))));
g2_v(19)=(-(exp(y(18)+y(21))*(1+exp(y(23)))));
g2_v(20)=g2_v(19);
g2_v(21)=(-(exp(y(18)+y(21))*exp(y(23))));
g2_v(22)=g2_v(21);
g2_v(23)=(-(exp(y(18)+y(21))*(1+exp(y(23)))));
g2_v(24)=(-(exp(y(18)+y(21))*exp(y(23))));
g2_v(25)=g2_v(24);
g2_v(26)=exp(y(12));
g2_v(27)=(-(exp(y(18)+y(21))*exp(y(23))));
g2_v(28)=(-(exp(y(21)+y(19))*(1+exp(y(22)))));
g2_v(29)=(-(exp(y(21)+y(19))*(1+exp(y(22)))));
g2_v(30)=g2_v(29);
g2_v(31)=(-(exp(y(21)+y(19))*exp(y(22))));
g2_v(32)=g2_v(31);
g2_v(33)=(-(exp(y(21)+y(19))*(1+exp(y(22)))));
g2_v(34)=(-(exp(y(21)+y(19))*exp(y(22))));
g2_v(35)=g2_v(34);
g2_v(36)=exp(y(11));
g2_v(37)=(-(exp(y(21)+y(19))*exp(y(22))));
g2_v(38)=exp(y(16)+y(3)-y(7));
g2_v(39)=(-exp(y(16)+y(3)-y(7)));
g2_v(40)=g2_v(39);
g2_v(41)=(-exp(y(16)+y(3)-y(7)));
g2_v(42)=g2_v(41);
g2_v(43)=exp(y(16)+y(3)-y(7));
g2_v(44)=exp(y(16)+y(3)-y(7));
g2_v(45)=g2_v(44);
g2_v(46)=(-exp(y(12)));
g2_v(47)=exp(y(16)+y(3)-y(7));
g2_v(48)=exp(y(13)+y(2)-y(8));
g2_v(49)=(-exp(y(13)+y(2)-y(8)));
g2_v(50)=g2_v(49);
g2_v(51)=(-exp(y(13)+y(2)-y(8)));
g2_v(52)=g2_v(51);
g2_v(53)=exp(y(13)+y(2)-y(8));
g2_v(54)=exp(y(13)+y(2)-y(8));
g2_v(55)=g2_v(54);
g2_v(56)=(-exp(y(11)));
g2_v(57)=exp(y(13)+y(2)-y(8));
g2 = sparse(g2_i,g2_j,g2_v,12,676);
end
