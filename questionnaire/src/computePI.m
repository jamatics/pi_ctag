    % ----------------------------------------------------------------------- %
    % The tedSR  API is a toolkit for scalable performance metrics and        %
    % simulation. See http://eurobench2020.eu/ and the NOTICE file            %
    % for more information. TedSR is developed at Fundación para la Promoción %
    % de la Automoción en Galicia. CTAG, and supported by European Commission %
    % H2020 Progamme under TestEd FTP Eurobench.			      %
    %                                                                         %
    % Copyright (c) 2019-2020 CTAG and the authors                            %
    % Author(s): Jawad Masood      	                                      %
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
    % computePI.m                                                             %
    %                                                                         %
    % ----------------------------------------------------------------------- %
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

function result = computePI(csv_file, result_dir)


%csv_file = '../tests/data/input/subject_01_questionnaire_medAssist.csv';
%csv_file = '../tests/data/input/subject_xx_questionnaire_medAssist.csv';
%csv_file = '../tests/data/input/subject_xx_questionnaire_highAssist.csv';
%csv_file = '../tests/data/input/subject_xx_questionnaire_noAssist.csv';
%result_dir = '../tests/data/output';

  disp(["Input parameters: ", csv_file, " ", result_dir])
    isOctave = exist('OCTAVE_VERSION', 'builtin') ~= 0;

if isOctave
  disp('Using Octave')
  pkg load signal
  pkg load mapping
  pkg load statistics
  pkg load io;
else
  disp('Using Matlab')
end

sqr = csv2cell(csv_file, ';');

% To detect the correct assistance level from file name
[filepath, name, ext] = fileparts(csv_file);
indices = strfind(name, '_');
str = {"lowAssist","medAssist","highAssist","noAssist"};
%disp ("Loop over a matrix")
for i = [1,2,3,4]
  assistLevel = strfind(name, str (i));
  a = cell2mat(assistLevel);
    if (a > 1)
      z = i;
    endif
endfor

% Main algorithmn to sum scores collected from the questionnaires
if (z == 1)
usability = sum(cell2mat(sqr(2:6,2)));
utility = sum(cell2mat(sqr(7:11,2)));
impact = sum(cell2mat(sqr(12:15,2))) + sum(cell2mat(sqr(18:19,2)));
elseif (z > 1 && z <= 3)
usability = sum(cell2mat(sqr(2:5,2)));
utility = sum(cell2mat(sqr(6:10,2)));
impact = sum(cell2mat(sqr(11:14,2))) + sum(cell2mat(sqr(17:18,2)));
elseif (z == 4)
usability = sum(cell2mat(sqr(2:16,2)));
utility = 0;
impact = 0;
endif

% Main results based on usability, utility and impact
totalResult = [usability, utility, impact];

% EB sop for saving the data to the output folder
[filepath, name, ext] = fileparts(csv_file);

    filename = strcat(result_dir, "/", "pi_questionnaire", ".yaml");
    store_vector(filename, totalResult);

% Tested with low assist and medium assist. Require verification for high ...
% assist and no assist.

endfunction
