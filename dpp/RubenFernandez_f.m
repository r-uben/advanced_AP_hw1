% Usage:
%       out = RubenFernandez_f(params, y)
%   where
%       out    is a (12,1) column vector of the residuals
%              of the static system
%       params is a (13,1) vector of parameter values
%              in the ordering as declared
%       y      is a (12,1) vector of endogenous variables
%              in the ordering as declared
%
% Created by Dynare++ v. 5.2

% params ordering
% =====================
% delta
% gamma
% mu
% psi
% theta
% phi
% rho
% ucbar
% pdbar
% pcbar
% rfbar
% Qbar
% mbar
%
% y ordering
% =====================
% dc
% dd
% x
% uc
% m
% pd
% pc
% rm
% exr
% rf
% rc
% Q

function out = RubenFernandez_f(params, y)
if size(y) ~= [12,1]
	error('Wrong size of y, must be [12,1]');
end
if size(params) ~= [13,1]
	error('Wrong size of params, must be [13,1]');
end

% hardwired constants
a0 = 0;
a1 = 1;
a2 = NaN;
a3 = 1.1283792;
% numerical constants
a25 = 1;
% parameter values
a40 = params(1); % delta
a26 = params(2); % gamma
a5 = params(3); % mu
a34 = params(4); % psi
a41 = params(5); % theta
a12 = params(6); % phi
a19 = params(7); % rho
% ucbar not used in the model
% pdbar not used in the model
% pcbar not used in the model
% rfbar not used in the model
% Qbar not used in the model
% mbar not used in the model
% exogenous variables to zeros
a8 = 0.0; % eps_c
a21 = 0.0; % eps_x
a15 = 0.0; % eps_d
% endogenous variables to y
a4 = y(1); % dc
a28 = y(1); % dc
a11 = y(2); % dd
a82 = y(2); % dd
a6 = y(3); % x
a18 = y(3); % x
a37 = y(4); % uc
a29 = y(4); % uc
a48 = y(5); % m
a68 = y(5); % m
a90 = y(6); % pd
a80 = y(6); % pd
a85 = y(6); % pd
a97 = y(7); % pc
a71 = y(7); % pc
a75 = y(7); % pc
a61 = y(8); % rm
a60 = y(9); % exr
a62 = y(10); % rf
a65 = y(10); % rf
a96 = y(11); % rc
a58 = y(12); % Q
a24 = y(12); % Q

t7 = a5 + a6;
t9 = t7 + a8;
t10 = a4 - t9;
t13 = a6 * a12;
t14 = a5 + t13;
t16 = t14 + a15;
t17 = a11 - t16;
t20 = a6 * a19;
t22 = t20 + a21;
t23 = a18 - t22;
t27 = a25 - a26;
t30 = a28 + a29;
t31 = t27 * t30;
t32 = exp(t31);
t33 = a24 - t32;
t35 = a25 / a34;
t36 = a25 - t35;
t38 = t36 * a37;
t39 = exp(t38);
t42 = a24 ^ a41;
t43 = t42 - a25;
t44 = a40 * t43;
t45 = a25 + t44;
t46 = t39 - t45;
t47 = log(a40);
t49 = t47 - a48;
t50 = a4 * t35;
t51 = t49 - t50;
t52 = a25 - a41;
t53 = t27 * t52;
t54 = a4 + a37;
t55 = t53 * t54;
t56 = t51 - t55;
t57 = exp(t56);
t59 = t57 - a58;
t63 = a61 - a62;
t64 = a60 - t63;
t66 = exp(a65);
t67 = a25 / t66;
t69 = exp(a68);
t70 = t67 - t69;
t72 = exp(a71);
t73 = a28 + a68;
t74 = exp(t73);
t76 = exp(a75);
t77 = a25 + t76;
t78 = t74 * t77;
t79 = t72 - t78;
t81 = exp(a80);
t83 = a68 + a82;
t84 = exp(t83);
t86 = exp(a85);
t87 = a25 + t86;
t88 = t84 * t87;
t89 = t81 - t88;
t91 = a61 + a90;
t92 = t91 - a11;
t93 = exp(t92);
t94 = a25 + t81;
t95 = t93 - t94;
t98 = a96 + a97;
t99 = t98 - a4;
t100 = exp(t99);
t101 = a25 + t72;
t102 = t100 - t101;
% setting the output variable
out = zeros(12, 1);
out(1) = t10;
out(2) = t17;
out(3) = t23;
out(4) = t33;
out(5) = t46;
out(6) = t59;
out(7) = t64;
out(8) = t70;
out(9) = t79;
out(10) = t89;
out(11) = t95;
out(12) = t102;
