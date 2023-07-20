function [obj, grad] = stateFcnJacobianAD(inputVariables, extraParams, params)
%stateFcnJacobianAD Compute objective function value and gradient
%
%   OBJ = stateFcnJacobianAD(INPUTVARIABLES, EXTRAPARAMS, PARAMS) computes
%   the objective value OBJ at the point INPUTVARIABLES, using the extra
%   parameters in EXTRAPARAMS and parameters in PARAMS.
%
%   [OBJ, GRAD] = stateFcnJacobianAD(INPUTVARIABLES, EXTRAPARAMS, PARAMS)
%   additionally computes the objective gradient value GRAD at the current
%   point.
%
%   Auto-generated by prob2struct on 20-Jul-2023 10:14:54

%#codegen
%#internal
%% Variable indices.
uidx = 2:3;
xidx = 1;

%% Map solver-based variables to problem-based.
u = inputVariables(uidx);
u = u(:);
x = inputVariables(xidx);

%% Compute objective function.
arg2 = extraParams{1};
arg5 = extraParams{3};
arg8 = extraParams{5};
arg1 = zeros(3, 1);
arg1(1) = x;
arg1(2:3) = u;
arg3 = arg1(:);
arg4 = ((arg2 * arg3) + extraParams{2});
arg6 = tanh(arg4);
arg7 = ((arg5 * arg6) + extraParams{4});
arg9 = tanh(arg7);
obj = (x + ((arg8 * arg9) + extraParams{6}));

if nargout > 1
    %% Compute objective gradient.
    % To call the gradient code, notify the solver by setting the
    % SpecifyObjectiveGradient option to true.
    arg14 = zeros(3, 1);
    ujac = zeros(2, 1);
    xjac = 0;
    arg10 = 1;
    xjac = xjac + arg10;
    arg11 = (optim.coder.problemdef.gradients.mtimes.MtimesRightAdjoint(arg8, [32 1], arg10).*(sech(arg7(:)).^2));
    arg12 = (optim.coder.problemdef.gradients.mtimes.MtimesRightAdjoint(arg5, [32 1], arg11).*(sech(arg4(:)).^2));
    arg13 = optim.coder.problemdef.gradients.mtimes.MtimesRightAdjoint(arg2, [3 1], arg12);
    ujac = ujac + arg13(2:3,:);
    xjac = xjac + arg13(1,:);
    arg14(uidx,:) = ujac;
    arg14(xidx,:) = xjac;
    grad = (arg14(:))';
end
end