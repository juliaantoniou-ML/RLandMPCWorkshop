function [Jx, Ju, Jdmv, Je] = myCostFcnwSlackJacobian(stage, x, u, dmv, e, p)
% This function was generated by Model Predictive Control Toolbox (Version 8.1).
% 14-Jul-2023 10:09:05
%# codegen
persistent ADdata
if isempty(ADdata)
    ADdata = coder.load('myCostFcnwSlackJacobianADdata','constants');
end
params.stage = stage;
params.p = p;
[~,J] = myCostFcnwSlackJacobianAD([x;u;dmv;e],ADdata.constants,params);
Jx = J(1:1,:);
Ju = J(3,:);
Jdmv = J(4:4,:);
Je = J(5:6,:);
