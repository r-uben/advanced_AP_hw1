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
    T = RubenFernandez.static_g1_tt(T, y, x, params);
end
g1 = zeros(13, 13);
g1(1,1)=1;
g1(1,3)=(-1);
g1(2,2)=1;
g1(2,3)=(-params(7));
g1(3,3)=1-params(8);
g1(4,1)=(-((1-params(2))*exp((1-params(2))*(y(1)+y(4)))));
g1(4,4)=(-((1-params(2))*exp((1-params(2))*(y(1)+y(4)))));
g1(4,12)=1;
g1(5,12)=(-(1/y(12)));
g1(5,13)=1;
g1(6,4)=(1-1/params(4))*exp(y(4)*(1-1/params(4)));
g1(6,13)=(-(params(1)*params(5)*exp(y(13)*params(5))));
g1(7,1)=1/params(4)*T(1)-exp(y(13)*(-(1-params(5))))*params(1)*(1-params(2))*(1-params(5))*exp((y(1)+y(4))*(1-params(2))*(1-params(5)));
g1(7,4)=(-(exp(y(13)*(-(1-params(5))))*params(1)*(1-params(2))*(1-params(5))*exp((y(1)+y(4))*(1-params(2))*(1-params(5)))));
g1(7,5)=T(1);
g1(7,13)=(-(params(1)*exp((y(1)+y(4))*(1-params(2))*(1-params(5)))*(-(1-params(5)))*exp(y(13)*(-(1-params(5))))));
g1(8,8)=(-1);
g1(8,9)=1;
g1(8,10)=1;
g1(9,5)=(-exp(y(5)));
g1(9,10)=(-exp(y(10)))/(exp(y(10))*exp(y(10)));
g1(10,1)=(-(exp(y(5))*(1+exp(y(7)))*exp(y(1))));
g1(10,5)=(-(exp(y(5))*(1+exp(y(7)))*exp(y(1))));
g1(10,7)=exp(y(7))-exp(y(1))*exp(y(5))*exp(y(7));
g1(11,2)=(-(exp(y(5))*(1+exp(y(6)))*exp(y(2))));
g1(11,5)=(-(exp(y(5))*(1+exp(y(6)))*exp(y(2))));
g1(11,6)=exp(y(6))-exp(y(2))*exp(y(5))*exp(y(6));
g1(12,2)=(-(exp(y(2))*(1+exp(y(6)))/exp(y(6))));
g1(12,6)=(-(exp(y(2))*(exp(y(6))*exp(y(6))-exp(y(6))*(1+exp(y(6))))/(exp(y(6))*exp(y(6)))));
g1(12,8)=exp(y(8));
g1(13,1)=(-(exp(y(1))*(1+exp(y(7)))/exp(y(7))));
g1(13,7)=(-(exp(y(1))*(exp(y(7))*exp(y(7))-exp(y(7))*(1+exp(y(7))))/(exp(y(7))*exp(y(7)))));
g1(13,11)=exp(y(11));
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
