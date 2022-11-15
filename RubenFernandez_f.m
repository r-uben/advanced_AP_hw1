% Usage:
%       out = RubenFernandez_f(params, y)
%   where
%       out    is a (13,1) column vector of the residuals
%              of the static system
%       params is a (14,1) vector of parameter values
%              in the ordering as declared
%       y      is a (13,1) vector of endogenous variables
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
% alpha
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
% q

function out = RubenFernandez_f(params, y)
if size(y) ~= [13,1]
	error('Wrong size of y, must be [13,1]');
end
if size(params) ~= [14,1]
	error('Wrong size of params, must be [14,1]');
end

% hardwired constants
a0 = 0;
a1 = 1;
a2 = NaN;
a3 = 1.1283792;
% numerical constants
a25 = 1;
% parameter values
a43 = params(1); % delta
a26 = params(2); % gamma
a5 = params(3); % mu
a37 = params(4); % psi
a45 = params(5); % theta
% alpha not used in the model
a12 = params(7); % phi
a19 = params(8); % rho
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
a93 = y(2); % dd
a6 = y(3); % x
a18 = y(3); % x
a40 = y(4); % uc
a29 = y(4); % uc
a51 = y(5); % m
a75 = y(5); % m
a99 = y(6); % pd
a87 = y(6); % pd
a89 = y(6); % pd
a108 = y(7); % pc
a78 = y(7); % pc
a80 = y(7); % pc
a68 = y(8); % rm
a67 = y(9); % exr
a69 = y(10); % rf
a72 = y(10); % rf
a105 = y(11); % rc
a24 = y(12); % Q
a62 = y(13); % q
a34 = y(13); % q

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
t35 = log(a24);
t36 = a34 - t35;
t38 = a25 / a37;
t39 = a25 - t38;
t41 = t39 * a40;
t42 = exp(t41);
t44 = a25 - a43;
t46 = a34 * a45;
t47 = exp(t46);
t48 = a43 * t47;
t49 = t44 + t48;
t50 = t42 - t49;
t52 = a4 * t38;
t53 = a51 + t52;
t54 = exp(t53);
t55 = a25 - a45;
t56 = t27 * t55;
t57 = a4 + a40;
t58 = t56 * t57;
t59 = exp(t58);
t60 = a43 * t59;
t61 = -(t55);
t63 = t61 * a62;
t64 = exp(t63);
t65 = t60 * t64;
t66 = t54 - t65;
t70 = a68 - a69;
t71 = a67 - t70;
t73 = exp(a72);
t74 = a25 / t73;
t76 = exp(a75);
t77 = t74 - t76;
t79 = exp(a78);
t81 = exp(a80);
t82 = a25 + t81;
t83 = t76 * t82;
t84 = exp(a28);
t85 = t83 * t84;
t86 = t79 - t85;
t88 = exp(a87);
t90 = exp(a89);
t91 = a25 + t90;
t92 = t76 * t91;
t94 = exp(a93);
t95 = t92 * t94;
t96 = t88 - t95;
t97 = exp(a68);
t98 = a25 + t88;
t100 = exp(a99);
t101 = t98 / t100;
t102 = exp(a11);
t103 = t101 * t102;
t104 = t97 - t103;
t106 = exp(a105);
t107 = a25 + t79;
t109 = exp(a108);
t110 = t107 / t109;
t111 = exp(a4);
t112 = t110 * t111;
t113 = t106 - t112;
% setting the output variable
out = zeros(13, 1);
out(1) = t10;
out(2) = t17;
out(3) = t23;
out(4) = t33;
out(5) = t36;
out(6) = t50;
out(7) = t66;
out(8) = t71;
out(9) = t77;
out(10) = t86;
out(11) = t96;
out(12) = t104;
out(13) = t113;
