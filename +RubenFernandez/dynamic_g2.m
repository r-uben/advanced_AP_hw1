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
    T = RubenFernandez.dynamic_g2_tt(T, y, x, params, steady_state, it_);
end
g2_i = zeros(61,1);
g2_j = zeros(61,1);
g2_v = zeros(61,1);

g2_i(1)=4;
g2_i(2)=4;
g2_i(3)=4;
g2_i(4)=4;
g2_i(5)=5;
g2_i(6)=6;
g2_i(7)=6;
g2_i(8)=7;
g2_i(9)=7;
g2_i(10)=7;
g2_i(11)=7;
g2_i(12)=7;
g2_i(13)=7;
g2_i(14)=7;
g2_i(15)=7;
g2_i(16)=7;
g2_i(17)=7;
g2_i(18)=7;
g2_i(19)=7;
g2_i(20)=9;
g2_i(21)=9;
g2_i(22)=10;
g2_i(23)=10;
g2_i(24)=10;
g2_i(25)=10;
g2_i(26)=10;
g2_i(27)=10;
g2_i(28)=10;
g2_i(29)=10;
g2_i(30)=10;
g2_i(31)=10;
g2_i(32)=11;
g2_i(33)=11;
g2_i(34)=11;
g2_i(35)=11;
g2_i(36)=11;
g2_i(37)=11;
g2_i(38)=11;
g2_i(39)=11;
g2_i(40)=11;
g2_i(41)=11;
g2_i(42)=12;
g2_i(43)=12;
g2_i(44)=12;
g2_i(45)=12;
g2_i(46)=12;
g2_i(47)=12;
g2_i(48)=12;
g2_i(49)=12;
g2_i(50)=12;
g2_i(51)=12;
g2_i(52)=13;
g2_i(53)=13;
g2_i(54)=13;
g2_i(55)=13;
g2_i(56)=13;
g2_i(57)=13;
g2_i(58)=13;
g2_i(59)=13;
g2_i(60)=13;
g2_i(61)=13;
g2_j(1)=505;
g2_j(2)=507;
g2_j(3)=559;
g2_j(4)=561;
g2_j(5)=449;
g2_j(6)=225;
g2_j(7)=477;
g2_j(8)=141;
g2_j(9)=144;
g2_j(10)=222;
g2_j(11)=145;
g2_j(12)=249;
g2_j(13)=140;
g2_j(14)=114;
g2_j(15)=225;
g2_j(16)=221;
g2_j(17)=117;
g2_j(18)=253;
g2_j(19)=113;
g2_j(20)=589;
g2_j(21)=393;
g2_j(22)=505;
g2_j(23)=508;
g2_j(24)=586;
g2_j(25)=510;
g2_j(26)=640;
g2_j(27)=589;
g2_j(28)=591;
g2_j(29)=643;
g2_j(30)=309;
g2_j(31)=645;
g2_j(32)=533;
g2_j(33)=535;
g2_j(34)=587;
g2_j(35)=536;
g2_j(36)=614;
g2_j(37)=589;
g2_j(38)=590;
g2_j(39)=616;
g2_j(40)=281;
g2_j(41)=617;
g2_j(42)=169;
g2_j(43)=164;
g2_j(44)=34;
g2_j(45)=173;
g2_j(46)=277;
g2_j(47)=29;
g2_j(48)=38;
g2_j(49)=272;
g2_j(50)=281;
g2_j(51)=337;
g2_j(52)=141;
g2_j(53)=138;
g2_j(54)=60;
g2_j(55)=147;
g2_j(56)=303;
g2_j(57)=57;
g2_j(58)=66;
g2_j(59)=300;
g2_j(60)=309;
g2_j(61)=421;
g2_v(1)=(-((1-params(2))*(1-params(2))*exp((1-params(2))*(y(19)+y(21)))));
g2_v(2)=(-((1-params(2))*(1-params(2))*exp((1-params(2))*(y(19)+y(21)))));
g2_v(3)=g2_v(2);
g2_v(4)=(-((1-params(2))*(1-params(2))*exp((1-params(2))*(y(19)+y(21)))));
g2_v(5)=(-((-1)/(y(17)*y(17))));
g2_v(6)=(1-T(1))*T(5);
g2_v(7)=(-(params(1)*params(5)*params(5)*exp(y(18)*params(5))));
g2_v(8)=T(1)*T(1)*T(2)-T(10);
g2_v(9)=(-T(10));
g2_v(10)=g2_v(9);
g2_v(11)=T(1)*T(2);
g2_v(12)=g2_v(11);
g2_v(13)=T(11);
g2_v(14)=g2_v(13);
g2_v(15)=(-T(10));
g2_v(16)=T(11);
g2_v(17)=g2_v(16);
g2_v(18)=T(2);
g2_v(19)=(-(params(1)*exp((1-params(2))*(1-params(5))*(y(6)+y(9)))*(-(1-params(5)))*(-(1-params(5)))*exp((-(1-params(5)))*y(5))));
g2_v(20)=(-exp(y(22)));
g2_v(21)=((-exp(y(15)))*exp(y(15))*exp(y(15))-(-exp(y(15)))*(exp(y(15))*exp(y(15))+exp(y(15))*exp(y(15))))/(exp(y(15))*exp(y(15))*exp(y(15))*exp(y(15)));
g2_v(22)=T(3);
g2_v(23)=T(3);
g2_v(24)=g2_v(23);
g2_v(25)=(-(exp(y(19))*exp(y(22))*exp(y(24))));
g2_v(26)=g2_v(25);
g2_v(27)=T(3);
g2_v(28)=(-(exp(y(19))*exp(y(22))*exp(y(24))));
g2_v(29)=g2_v(28);
g2_v(30)=exp(y(12));
g2_v(31)=(-(exp(y(19))*exp(y(22))*exp(y(24))));
g2_v(32)=T(4);
g2_v(33)=T(4);
g2_v(34)=g2_v(33);
g2_v(35)=(-(exp(y(20))*exp(y(22))*exp(y(23))));
g2_v(36)=g2_v(35);
g2_v(37)=T(4);
g2_v(38)=(-(exp(y(20))*exp(y(22))*exp(y(23))));
g2_v(39)=g2_v(38);
g2_v(40)=exp(y(11));
g2_v(41)=(-(exp(y(20))*exp(y(22))*exp(y(23))));
g2_v(42)=(-((1+exp(y(11)))/exp(y(2))*exp(y(7))));
g2_v(43)=T(6);
g2_v(44)=g2_v(43);
g2_v(45)=T(7);
g2_v(46)=g2_v(45);
g2_v(47)=(-(exp(y(7))*((-((1+exp(y(11)))*exp(y(2))))*exp(y(2))*exp(y(2))-(-((1+exp(y(11)))*exp(y(2))))*(exp(y(2))*exp(y(2))+exp(y(2))*exp(y(2))))/(exp(y(2))*exp(y(2))*exp(y(2))*exp(y(2)))));
g2_v(48)=(-(exp(y(7))*(-(exp(y(11))*exp(y(2))))/(exp(y(2))*exp(y(2)))));
g2_v(49)=g2_v(48);
g2_v(50)=T(7);
g2_v(51)=exp(y(13));
g2_v(52)=(-((1+exp(y(12)))/exp(y(3))*exp(y(6))));
g2_v(53)=T(8);
g2_v(54)=g2_v(53);
g2_v(55)=T(9);
g2_v(56)=g2_v(55);
g2_v(57)=(-(exp(y(6))*((-((1+exp(y(12)))*exp(y(3))))*exp(y(3))*exp(y(3))-(-((1+exp(y(12)))*exp(y(3))))*(exp(y(3))*exp(y(3))+exp(y(3))*exp(y(3))))/(exp(y(3))*exp(y(3))*exp(y(3))*exp(y(3)))));
g2_v(58)=(-(exp(y(6))*(-(exp(y(12))*exp(y(3))))/(exp(y(3))*exp(y(3)))));
g2_v(59)=g2_v(58);
g2_v(60)=T(9);
g2_v(61)=exp(y(16));
g2 = sparse(g2_i,g2_j,g2_v,13,729);
end
