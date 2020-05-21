    % ----------------------------------------------------------------------- %
    % The tedSR  API is a toolkit for scalable performance metrics and        %
    % simulation. See http://eurobench2020.eu/ and the NOTICE file            %
    % for more information. TedSR is developed at Fundación para la Promoción %
    % de la Automoción en Galicia. CTAG, and supported by European Comission  %
    % H2020 Progamme under TestEd FTP Eurobench.			%
    %                                                                         %
    % Copyright (c) 2019-2020 CTAG and the authors                            %
    % Author(s): Jawad Masood                                                 %
    %                                                                         %
    % Licensed under the Apache License, Version 2.0 (the "License");         %
    % you may not use this file except in compliance with the License.        %
    % You may obtain a copy of the License at                                 %
    % http://www.apache.org/licenses/LICENSE-2.0.                             %
    %                                                                         %
    % Unless required by applicable law or agreed to in writing, software     %
    % distributed under the License is distributed on an "AS IS" BASIS,       %
    % WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or         %
    % implied. See the License for the specific language governing            %
    % permissions and limitations under the License.                          %
    % ----------------------------------------------------------------------- %
    %                                                                         %
    % hrMonitoringLP.m                                                              %
    % Author(s): Jawad Masood						      %
    % ----------------------------------------------------------------------- %

clear; 
close all;
clc;

data = textread('/home/jawad/repo/pi_ctag/hrMonitoring/hrMonitoring_ctag/tests/data/input/subject_01_run_01_hrv.txt');
%% RMSSD Root Mean Square of 
% the Successive Differences
% msec 
RMSSD = sqrt(mean(diff(data).*diff(data)))
  
%% Standard deviation of RR

SDNN = std(data); %msec

%% NN50

alpha = 50; %ms

NN50 = sum(abs(diff(data)) >= alpha)

%% PNNAlpha PNN50
alpha = 50; %ms

pNN50 = sum(abs(diff(data)) >= alpha)/length(diff(data))
    

