% Usage:
%       out = RubenFernandez_ff(params, y)
%   where
%       out    is a (13,13) matrix of the first order
%              derivatives of the static system residuals
%              columns correspond to endo variables in
%              the ordering as declared
%       params is a (14,1) vector of parameter values
%              in the ordering as declared
%       y      is a (13,1) vector of endogenous variables
%              in the ordering as declared
%
% Created by Dynare++ v. 5.4

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

function out = RubenFernandez_ff(params, y)
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

t1 = a1;
t114 = -(a1);
t115 = -(a12);
t116 = -(a19);
t27 = a25 - a26;
t30 = a28 + a29;
t31 = t27 * t30;
t32 = exp(t31);
t117 = t27 * t32;
t118 = -(t117);
t121 = a1 / a24;
t122 = -(t121);
t46 = a34 * a45;
t47 = exp(t46);
t126 = a45 * t47;
t127 = a43 * t126;
t128 = -(t127);
t38 = a25 / a37;
t39 = a25 - t38;
t41 = t39 * a40;
t42 = exp(t41);
t129 = t39 * t42;
t52 = a4 * t38;
t53 = a51 + t52;
t54 = exp(t53);
t134 = t38 * t54;
t55 = a25 - a45;
t61 = -(t55);
t63 = t61 * a62;
t64 = exp(t63);
t56 = t27 * t55;
t57 = a4 + a40;
t58 = t56 * t57;
t59 = exp(t58);
t135 = t56 * t59;
t136 = a43 * t135;
t137 = t64 * t136;
t138 = t134 - t137;
t139 = -(t137);
t60 = a43 * t59;
t140 = t61 * t64;
t141 = t60 * t140;
t142 = -(t141);
t154 = -(t114);
t76 = exp(a75);
t155 = -(t76);
t73 = exp(a72);
t156 = a25 * t73;
t157 = -(t156);
t158 = t73 * t73;
t159 = t157 / t158;
t84 = exp(a28);
t81 = exp(a80);
t166 = t76 * t81;
t167 = t84 * t166;
t168 = -(t167);
t82 = a25 + t81;
t83 = t76 * t82;
t85 = t83 * t84;
t169 = -(t85);
t79 = exp(a78);
t94 = exp(a93);
t90 = exp(a89);
t170 = t76 * t90;
t171 = t94 * t170;
t172 = -(t171);
t91 = a25 + t90;
t92 = t76 * t91;
t95 = t92 * t94;
t173 = -(t95);
t88 = exp(a87);
t97 = exp(a68);
t102 = exp(a11);
t100 = exp(a99);
t174 = t88 / t100;
t175 = t102 * t174;
t176 = -(t175);
t98 = a25 + t88;
t101 = t98 / t100;
t103 = t101 * t102;
t177 = -(t103);
t178 = t98 * t100;
t179 = -(t178);
t180 = t100 * t100;
t181 = t179 / t180;
t182 = t102 * t181;
t183 = -(t182);
t106 = exp(a105);
t111 = exp(a4);
t109 = exp(a108);
t197 = t79 / t109;
t198 = t111 * t197;
t199 = -(t198);
t107 = a25 + t79;
t110 = t107 / t109;
t112 = t110 * t111;
t200 = -(t112);
t201 = t107 * t109;
t202 = -(t201);
t203 = t109 * t109;
t204 = t202 / t203;
t205 = t111 * t204;
t206 = -(t205);
% setting the output variable
out = zeros(13, 13);
out(1,1) = out(1,1) + t1; % dc(0)
out(1,3) = out(1,3) + t114; % x(-1)
out(2,2) = out(2,2) + t1; % dd(0)
out(2,3) = out(2,3) + t115; % x(-1)
out(3,3) = out(3,3) + t1; % x(0)
out(3,3) = out(3,3) + t116; % x(-1)
out(4,1) = out(4,1) + t118; % dc(1)
out(4,4) = out(4,4) + t118; % uc(1)
out(4,12) = out(4,12) + t1; % Q(0)
out(5,12) = out(5,12) + t122; % Q(0)
out(5,13) = out(5,13) + t1; % q(0)
out(6,13) = out(6,13) + t128; % q(0)
out(6,4) = out(6,4) + t129; % uc(0)
out(7,1) = out(7,1) + t138; % dc(0)
out(7,4) = out(7,4) + t139; % uc(0)
out(7,5) = out(7,5) + t54; % m(0)
out(7,13) = out(7,13) + t142; % q(-1)
out(8,8) = out(8,8) + t114; % rm(0)
out(8,9) = out(8,9) + t1; % exr(0)
out(8,10) = out(8,10) + t154; % rf(-1)
out(9,5) = out(9,5) + t155; % m(1)
out(9,10) = out(9,10) + t159; % rf(0)
out(10,7) = out(10,7) + t168; % pc(1)
out(10,1) = out(10,1) + t169; % dc(1)
out(10,5) = out(10,5) + t169; % m(1)
out(10,7) = out(10,7) + t79; % pc(0)
out(11,6) = out(11,6) + t172; % pd(1)
out(11,2) = out(11,2) + t173; % dd(1)
out(11,5) = out(11,5) + t173; % m(1)
out(11,6) = out(11,6) + t88; % pd(0)
out(12,8) = out(12,8) + t97; % rm(0)
out(12,6) = out(12,6) + t176; % pd(0)
out(12,2) = out(12,2) + t177; % dd(0)
out(12,6) = out(12,6) + t183; % pd(-1)
out(13,11) = out(13,11) + t106; % rc(0)
out(13,7) = out(13,7) + t199; % pc(0)
out(13,1) = out(13,1) + t200; % dc(0)
out(13,7) = out(13,7) + t206; % pc(-1)
