function [obj, grad] = myCostFcnwSlackStageFirstJacobianAD(inputVariables, extraParams, params)
%myCostFcnwSlackStageFirstJacobianAD Compute objective function value and
%gradient
%
%   OBJ = myCostFcnwSlackStageFirstJacobianAD(INPUTVARIABLES, EXTRAPARAMS,
%   PARAMS) computes the objective value OBJ at the point INPUTVARIABLES,
%   using the extra parameters in EXTRAPARAMS and parameters in PARAMS.
%
%   [OBJ, GRAD] = myCostFcnwSlackStageFirstJacobianAD(INPUTVARIABLES,
%   EXTRAPARAMS, PARAMS) additionally computes the objective gradient
%   value GRAD at the current point.
%
%   Auto-generated by prob2struct on 10-Jul-2023 16:12:19

%#codegen
%#internal
%% Variable indices.
uidx = 2:3;
dmvidx = 4;

%% Map solver-based variables to problem-based.
u = inputVariables(uidx);
u = u(:);
dmv = inputVariables(dmvidx);

%% Extract parameters.
p = params.p;

%% Compute objective function.
arg1 = 10000;
arg5 = extraParams{1};
arg3 = (arg1 .* p);
arg4 = u(2);
arg6 = dmv.^2;
obj = ((arg3 .* arg4) + (arg5 .* arg6));

if nargout > 1
    %% Compute objective gradient.
    % To call the gradient code, notify the solver by setting the
    % SpecifyObjectiveGradient option to true.
    arg11 = zeros(4, 1);
    ujac = zeros(2, 1);
    dmvjac = 0;
    arg7 = 1;
    dmvjac = dmvjac + ((arg7.*arg5(:)).*2.*(dmv(:)));
    arg8 = (arg7.*arg3(:));
    arg9 = zeros(2, 1);
    arg9(2,:) = arg8;
    ujac = ujac + arg9;
    arg10 = (arg7.*arg4(:));
    arg11(uidx,:) = ujac;
    arg11(dmvidx,:) = dmvjac;
    grad = arg11(:);
end
end