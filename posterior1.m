function [outputArg1,outputArg2] = posterior1(test,model) %∫Û—Èπ¿º∆

plugin=test;
if model==1
    DREAMPar.d = 2;                         % Dimension of the problem
else
    DREAMPar.d = 3;                         % Dimension of the problem
end

DREAMPar.lik = 1;                       % Model output is likelihood
% if model==1
%     DREAMPar.N = 2;                          % Dimension of the problem
% else
%     DREAMPar.N = 3;                          % Dimension of the problem
% end
DREAMPar.N = 2;
DREAMPar.T = 10000;
Par_info.initial = 'prior';           % multinormal initial sampling distribution
% Par_info.mu = zeros(1,DREAMPar.d);     % if 'normal', define mean of distribution
% Par_info.cov = 10 * eye(DREAMPar.d);   % if 'normal', define covariance matrix
% if model==1
%     Par_info.min = [0,0];   % If 'latin', min values
%     Par_info.max = [ 10000,10000 ];
% else
%     Par_info.min = [0,0,0];   % If 'latin', min values
%     Par_info.max = [ 10000,10000,10000];
% end

%Par_info.steps = 250*ones(1,DREAMPar.d);
Par_info.prior={'gampdf( 1.2304,0.3868)','gampdf(1.5959,40.5741)'};
if model==1
    Func_name = 'likelihood1';
else
    Func_name = 'likelihood2';
end

method = 'dream_zs'; %_zs'; %_dzs';
Meas_info=[];
options.modout = 'yes';                % Return model (function) simulations of samples (yes/no)?
options.parallel = 'no';               % Run each chain on a different core
options.save = 'no';                  % Save workspace DREAM during run
 
[chain,output,FX,Z,logL] = DREAM_package(method,Func_name,DREAMPar,Par_info,Meas_info,options,plugin);

end

