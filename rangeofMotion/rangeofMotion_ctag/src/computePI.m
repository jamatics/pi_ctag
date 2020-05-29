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
    % rangeofMotionLP.m                                                       %
    % Author(s): Jawad Masood						                                      %
    % ----------------------------------------------------------------------- %
clear; 
close all;
clc;

csv_file = "../tests/data/input/subject_03_trial_01_jointAngles.csv";
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
 
angles = csv2cell(csv_file, ',');
header = angles(1, :);
angles = cell2mat(angles(2:end, :));



joint_name = ["r_forearm/lumbar_x"];
joint = cell2mat(cellstr(joint_name))
joint_limits = [10, 140];
[limit_position_r_forearm, counter_r_forearm, maxVal_r_forearm, ...
minVal_r_forearm] = ... 
romCheck(header, angles, joint, joint_limits(1), joint_limits(2));

joint_name = ["l_forearm/lumbar_x"];
joint = cell2mat(cellstr(joint_name))
joint_limits = [10, 140];
[limit_position_l_forearm, counter_l_forearm, maxVal_l_forearm, ... 
minVal_l_forearm] = ...
romCheck(header, angles, joint, joint_limits(1), joint_limits(2));

joint_name = ["pelvis_x"];
joint = cell2mat(cellstr(joint_name))
joint_limits = [-30, 90];
[limit_position_pelvis_x, counter_pelvis_x, maxVal_pelvis, ... 
minVal_pelvis] = ... 
romCheck(header, angles, joint, joint_limits(1), joint_limits(2));

joint_name = ["r_hip_x"];
joint = cell2mat(cellstr(joint_name))
joint_limits = [-30, 100];
[limit_position_r_hip_x, counter_r_hip_x, maxVal_r_hip, ...
minVal_r_hip] = ...
romCheck(header, angles, joint, joint_limits(1), joint_limits(2));

joint_name = ["l_hip_x"];
joint = cell2mat(cellstr(joint_name))
joint_limits = [-30, 100];
[limit_position_l_hip_x, counter_l_hip_x, maxVal_l_hip, ...
minVal_l_hip] = ...
romCheck(header, angles, joint, joint_limits(1), joint_limits(2));

joint_name = ["r_knee_x"];
joint = cell2mat(cellstr(joint_name))
joint_limits = [-10, 140];
[limit_position_r_knee_x, counter_r_knee_x, maxVal_r_knee, ...
minVal_r_knee] = ...
romCheck(header, angles, joint, joint_limits(1), joint_limits(2));

joint_name = ["l_knee_x"];
joint = cell2mat(cellstr(joint_name))
joint_limits = [-10, 140];
[limit_position_l_knee_x, counter_l_knee_x, maxVal_l_knee, ...
minVal_l_knee] = ...
romCheck(header, angles, joint, joint_limits(1), joint_limits(2));

joint_name = ["r_ankle_x"];
joint = cell2mat(cellstr(joint_name))
joint_limits = [-20, 35];
[limit_position_r_ankle_x, counter_r_ankle_x, maxVal_r_ankle, ...
minVal_r_ankle] = ... 
romCheck(header, angles, joint, joint_limits(1), joint_limits(2));

joint_name = ["l_ankle_x"];
joint = cell2mat(cellstr(joint_name))
joint_limits = [-20, 35];
[limit_position_l_ankle_x, counter_l_ankle_x, maxVal_l_ankle, ...
minVal_l_ankle] = ... 
romCheck(header, angles, joint, joint_limits(1), joint_limits(2));


totalResult = [counter_r_forearm, maxVal_r_forearm, minVal_r_forearm,...
counter_l_forearm, maxVal_l_forearm, minVal_l_forearm,...
counter_r_hip_x, maxVal_r_hip, minVal_r_hip,... 
counter_l_hip_x, maxVal_l_hip, minVal_l_hip,...
counter_pelvis_x, maxVal_pelvis, minVal_pelvis, ...
counter_r_knee_x, maxVal_r_knee, minVal_r_knee,... 
counter_l_knee_x, maxVal_l_knee, minVal_l_knee,...
counter_r_ankle_x, maxVal_r_ankle, minVal_r_ankle,...
counter_l_ankle_x, maxVal_l_ankle, minVal_l_ankle]

% EB sop for saving the data to the output folder
% counter is producing erronious result require a thorough check in data 
[filepath, name, ext] = fileparts(csv_file);

    filename = strcat(result_dir, "/", "Local_Score", ".yaml");
    store_vector(filename, totalResult);

