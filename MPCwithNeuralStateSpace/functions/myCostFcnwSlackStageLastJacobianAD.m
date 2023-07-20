function [obj, grad] = myCostFcnwSlackStageLastJacobianAD(inputVariables, extraParams, params)
%myCostFcnwSlackStageLastJacobianAD Compute objective function value and
%gradient
%
%   OBJ = myCostFcnwSlackStageLastJacobianAD(INPUTVARIABLES, EXTRAPARAMS,
%   PARAMS) computes the objective value OBJ at the point INPUTVARIABLES,
%   using the extra parameters in EXTRAPARAMS and parameters in PARAMS.
%
%   [OBJ, GRAD] = myCostFcnwSlackStageLastJacobianAD(INPUTVARIABLES,
%   EXTRAPARAMS, PARAMS) additionally computes the objective gradient
%   value GRAD at the current point.
%
%   Auto-generated by prob2struct on 20-Jul-2023 10:14:55

%#codegen
%#internal
%% Variable indices.
eidx = 5:6;

%% Map solver-based variables to problem-based.
e = inputVariables(eidx);
e = e(:);

%% Compute objective function.
arg3 = 100000;
arg4 = (e(1) + e(2));
obj = (arg3 .* arg4);

if nargout > 1
    %% Compute objective gradient.
    % To call the gradient code, notify the solver by setting the
    % SpecifyObjectiveGradient option to true.
    arg9 = zeros(6, 1);
    ejac = zeros(2, 1);
    arg5 = 1;
    arg6 = (arg5.*arg3(:));
    arg7 = zeros(2, 1);
    arg7(2,:) = arg6;
    ejac = ejac + arg7;
    arg8 = zeros(2, 1);
    arg8(1,:) = arg6;
    ejac = ejac + arg8;
    arg9(eidx,:) = ejac;
    grad = arg9(:);
end
end