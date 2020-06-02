    % ----------------------------------------------------------------------- %
    % The tedSR  API is a toolkit for scalable performance metrics and        %
    % simulation. See http://eurobench2020.eu/ and the NOTICE file            %
    % for more information. TedSR is developed at Fundación para la Promoción %
    % de la Automoción en Galicia. CTAG, and supported by European Comission  %
    % H2020 Progamme under TestEd FTP Eurobench.			%
    %                                                                         %
    % Copyright (c) 2019-2020 CTAG and the authors                            %
    % Author(s): Jawad Masood & Federico Macció                               %
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
    % balanceLP.m                                                             %
    % Author(s): Jawad Masood                                                 %
    % ----------------------------------------------------------------------- %
    % ----------------------------------------------------------------------- %
    % ABSTRACT: This code developed in Octave demonstrates how to predict the %
    % metabolic rate in kilocalories (kcal) of a human being performing       %
    % different tasks.                                                        %
    % ----------------------------------------------------------------------- %
 
 
    % ----------------------------------------------------------------------- %
    % Dependencies with licence information as comments:                      %
    %                                                                         %
    % GNU Octave, version 5.1.0 Copyright (C) 2018 John W. Eaton and others.  %
    % This is free software; see the source code for copying conditions.      %
    % There is ABSOLUTELY NO WARRANTY; not even for MERCHANTABILITY or        %
    % FITNESS FOR A PARTICULAR PURPOSE.                                       %
    % Octave was configured for "x86_64-w64-mingw32".                         %
    % Additional information about Octave is available at                     %
    % https://www.octave.org                                                  %
    % Please contribute if you find this software useful.                     %
    % For more information, visit https://www.octave.org/get-involved.html    %
    % Read https://www.octave.org/bugs.html to learn how to submit bug        %
    % reports.                                                                %
    % ----------------------------------------------------------------------- %
 
 
    % ----------------------------------------------------------------------- %
    % All parameters and variables:                                           %
    %                                                                         %
    %                                                                         %
    % clear: clears all variables values from symbol table.                   %
    %                                                                         %
    % close all: close all the opened figures.                                %
    %                                                                         %
    % clc: clears the terminal screen and moves the cursor to the upper left  %
    %      corner.                                                            %
    %                                                                         %
    % rawDataA || rawDataD:                                                   %
    % matrices with the raw data from 2 forceplates time (in hundreths of     %
    % seconds), Fx (ground medial-lateral forces), Fy (ground anterior-       %
    % posterior forces), Fz (ground vertical reaction forces),Mx,My,Mz        %
    % (momentums of the forces).                                              %
    %                                                                         %
    % BWa || BWb: Body weights of the subjects 1 and 2.                       %
    %                                                                         %
    % rowsA || rowsB: number of rows of the rawData matrices.                 %
    %                                                                         %
    % ax1 || bx1: first column of Fx of both forceplates.                     %
    %                                                                         %
    % ax2 || bx2: second column of Fx of both forceplates.                    %
    %                                                                         %
    % ay1 || by1: first column of Fy of both forceplates.                     %
    %                                                                         %
    % ay2 || by2: second column of Fy of both forceplates.                    %
    %                                                                         %
    % az1 || bz1: first column of Fz of both forceplates.                     %
    %                                                                         %
    % az2 || bz2: second column of Fy of both forceplates.                    %
    %                                                                         %
    % DPSI_a || DPSI_b: Dynamic Postural Stability Index.                     %
    %                                                                         %
    % maxDPSI_a || maxDPSI_b: maximum value of DPSI matrices.                 %
    %                                                                         %
    % minDPSI_a || minDPSI_b: minimum value of DPSI matrices.                 %
    %                                                                         %
    % DPSI_aMEAN || DPSI_bMEAN: mean value of DPSI matrices.                  %
    %                                                                         %
    % DPSI_aArea || DPSI_bArea: sum of the values of DPSI matrices.           %
    %                                                                         %
    % DPSI_aEnergyVStime || DPSI_bEnergyVStime:                               %
    % This value is the DPSI_xArea value divided by the time (25 seconds).    %
    % This value is scaled in the next line: it is divided by 100.            %
    %                                                                         %
    % [Maxat, rowMaxat] || [Maxbt, rowMaxbt] || [minat, rowMinat] ||          %
    % [minat, rowMinat]:                                                      %
    % Matrices created to find the matching time value of the maximum DPSI    %
    % value.                                                                  %
    %                                                                         %
    % rowMaxatValue || rowMaxbtValue || rowMinatValue || rowMinatValue:       %
    % Time values of the maximum and minimum of both DPSI matrices            %
    % ----------------------------------------------------------------------- %
 
 
    % ----------------------------------------------------------------------- %
    % Calculating commands:                                                   %

clear; 
close all;
clc;

csv_file = "../tests/data/input/subject_01_run_01_balance.csv";
testbed_file = "../tests/data/input/subject_01_testbed_lowAssist.yaml";
result_dir = "../tests/data/output";

disp(["Input parameters: ", csv_file, " ", result_dir])
    isOctave = exist('OCTAVE_VERSION', 'builtin') ~= 0;

if isOctave
  disp('Using Octave')
  pkg load signal;
  pkg load mapping;
  pkg load statistics;
  pkg load io;
else
  disp('Using Matlab')
  endif

reactForces = csv2cell(csv_file, ',');
%header = reactForces(1, :);
reactForces = cell2mat(reactForces(1:end,:));

testbed_data = read_simple_yaml(testbed_file);
BWs1 = testbed_data.subject_weight;
l = length(reactForces);

time = reactForces(1:l,1);
reactForce_x_l = reactForces(1:l,2);
reactForce_y_l = reactForces(1:l,3); 
reactForce_z_l = reactForces(1:l,4);
reactForce_x_r = reactForces(1:l,8); 
reactForce_y_r = reactForces(1:l,9); 
reactForce_z_r = reactForces(1:l,10);

reactForce_x = (reactForce_x_l+reactForce_x_r)/2;
reactForce_y = (reactForce_y_l+reactForce_y_r)/2;
reactForce_z = (reactForce_z_l+reactForce_z_r)/2;

DPSI = 10^-2*[((0-reactForce_x).^2+(0-reactForce_y).^2 ...
+(BWs1-reactForce_z).^2)/100]/BWs1;

maxDPSI = max(DPSI);

minDPSI = min(DPSI);

medDPSI = mean(DPSI);

areaDPSI = sum (DPSI);

areaDPSIvsTime = areaDPSI/((length(time))/100);

areaDPSIvsTime = areaDPSIvsTime/100;

[maxat, maxTime] = max(max(DPSI,[],2));

[minat, minTime] = min(min(DPSI,[],2));

totalResult = [areaDPSI, areaDPSIvsTime, ...
maxat, maxTime/100, minat, minTime/100];

% EB sop for saving the data to the output folders
[filepath, name, ext] = fileparts(csv_file);

filename = strcat(result_dir, "/", "Local_Score", ".yaml");
store_vector(filename, totalResult);
