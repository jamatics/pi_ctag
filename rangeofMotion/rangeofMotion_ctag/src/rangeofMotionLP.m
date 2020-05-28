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
    % rangeofMotionLP.m                                                              %
    % Author(s): Jawad Masood						      %
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
    end


angles = csv2cell(csv_file, ',');
header = angles(1, :);
angles = cell2mat(angles(2:end, :));
l = size(angles);

for i = 2:l(2)
max_min_med_Data {1,i-1} = header(1,i);
max_min_med_Data {2,i-1} = max(angles(2:end,i));
max_min_med_Data {3,i-1} = min(angles(2:end,i));
max_min_med_Data {4,i-1} = median(angles(2:end,i));
endfor


counterflexion=0;
counterextension=0;
counter = 0;

for i = 1:length(header)
  % -----------------   for r_hip_x --------------------- %
  if strcmp(header{1,i},'r_hip_x')
    limit_position{1,1} = 'r_hip_x';
    fprintf('R HIP X --> Exist in the column: %d\n',i);
    for j = 1:length(angles(:,i))
      if angles(j,i) >= 100
        counter == counter + 1;
        limit_position{counter + 1, 1} = angles(j,i);
      end
      if angles(j,i) <= -30
        counter = counter + 1;
        limit_position{counter + 1,1} = angles(j,i);
      end
    end
    counterflexion=0;
    counterextension=0;
    counter = 0;   
  end
 % -----------------   para r_knee_x --------------------- %
 if strcmp(header{1,i}, 'r_knee_x')
   limit_position{1,2} = 'r_knee_x';
   fprintf('R KNEE X --> Exist in the column: %d\n',i);
   for j = 1:length(angles(:,i))
      if angles(j,i) >= 140
        counter == counter + 1;
        limit_position{counter + 1, 2} = angles(j,i);
      end
      if angles(j,i) <= -10
        counter = counter + 1;
        limit_position{counter + 1,2} = angles(j,i);
      end
    end
    counterflexion=0;
    counterextension=0;
    counter = 0;   
  end   
end




