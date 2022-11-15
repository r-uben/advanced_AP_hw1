% Usage:
%       out = RubenFernandez_ff(params, y)
%   where
%       out    is a (12,12) matrix of the first order
%              derivatives of the static system residuals
%              columns correspond to endo variables in
%              the ordering as declared
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

function out = RubenFernandez_ff(params, y)
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

t1 = a1;
t103 = -(a1);
t104 = -(a12);
t105 = -(a19);
t27 = a25 - a26;
t30 = a28 + a29;
t31 = t27 * t30;
t32 = exp(t31);
t106 = t27 * t32;
t107 = -(t106);
t112 = a41 - a1;
t113 = a24 ^ t112;
t114 = a41 * t113;
t115 = a40 * t114;
t116 = -(t115);
t35 = a25 / a34;
t36 = a25 - t35;
t38 = t36 * a37;
t39 = exp(t38);
t117 = t36 * t39;
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
t126 = -(t35);
t127 = t126 - t53;
t128 = t57 * t127;
t129 = -(t53);
t130 = t57 * t129;
t131 = t57 * t103;
t138 = -(t103);
t69 = exp(a68);
t139 = -(t69);
t66 = exp(a65);
t140 = a25 * t66;
t141 = -(t140);
t142 = t66 * t66;
t143 = t141 / t142;
t73 = a28 + a68;
t74 = exp(t73);
t76 = exp(a75);
t150 = t74 * t76;
t151 = -(t150);
t77 = a25 + t76;
t78 = t74 * t77;
t152 = -(t78);
t72 = exp(a71);
t83 = a68 + a82;
t84 = exp(t83);
t86 = exp(a85);
t153 = t84 * t86;
t154 = -(t153);
t87 = a25 + t86;
t88 = t84 * t87;
t155 = -(t88);
t81 = exp(a80);
t91 = a61 + a90;
t92 = t91 - a11;
t93 = exp(t92);
t156 = -(t81);
t157 = t93 * t103;
t98 = a96 + a97;
t99 = t98 - a4;
t100 = exp(t99);
t159 = -(t72);
t160 = t100 * t103;
% setting the output variable
out = zeros(12, 12);
out(1,1) = out(1,1) + t1; % dc(0)
out(1,3) = out(1,3) + t103; % x(-1)
out(2,2) = out(2,2) + t1; % dd(0)
out(2,3) = out(2,3) + t104; % x(-1)
out(3,3) = out(3,3) + t1; % x(0)
out(3,3) = out(3,3) + t105; % x(-1)
out(4,1) = out(4,1) + t107; % dc(1)
out(4,4) = out(4,4) + t107; % uc(1)
out(4,12) = out(4,12) + t1; % Q(0)
out(5,12) = out(5,12) + t116; % Q(0)
out(5,4) = out(5,4) + t117; % uc(0)
out(6,1) = out(6,1) + t128; % dc(0)
out(6,4) = out(6,4) + t130; % uc(0)
out(6,5) = out(6,5) + t131; % m(0)
out(6,12) = out(6,12) + t103; % Q(-1)
out(7,8) = out(7,8) + t103; % rm(0)
out(7,9) = out(7,9) + t1; % exr(0)
out(7,10) = out(7,10) + t138; % rf(-1)
out(8,5) = out(8,5) + t139; % m(1)
out(8,10) = out(8,10) + t143; % rf(0)
out(9,7) = out(9,7) + t151; % pc(1)
out(9,1) = out(9,1) + t152; % dc(1)
out(9,5) = out(9,5) + t152; % m(1)
out(9,7) = out(9,7) + t72; % pc(0)
out(10,6) = out(10,6) + t154; % pd(1)
out(10,2) = out(10,2) + t155; % dd(1)
out(10,5) = out(10,5) + t155; % m(1)
out(10,6) = out(10,6) + t81; % pd(0)
out(11,8) = out(11,8) + t93; % rm(0)
out(11,6) = out(11,6) + t156; % pd(0)
out(11,2) = out(11,2) + t157; % dd(0)
out(11,6) = out(11,6) + t93; % pd(-1)
out(12,11) = out(12,11) + t100; % rc(0)
out(12,7) = out(12,7) + t159; % pc(0)
out(12,1) = out(12,1) + t160; % dc(0)
out(12,7) = out(12,7) + t100; % pc(-1)
