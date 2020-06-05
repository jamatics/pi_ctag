    % ----------------------------------------------------------------------- %
    % The tedSR  API is a toolkit for scalable performance metrics and        %
    % simulation. See http://eurobench2020.eu/ and the NOTICE file            %
    % for more information. TedSR is developed at Fundación para la Promoción %
    % de la Automoción en Galicia. CTAG, and supported by European Commission %
    % H2020 Progamme under TestEd FTP Eurobench.			      %
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
    
clear; 
close all;
clc;

%csv_file = '../tests/data/input/subject_01_questionnaire_borgScale10.csv';
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
sumResult = sum(cell2mat(sqr(2:end,2)));

if (sumResult == 0)
  localRes = ('None');
elseif (sumResult >= 1 && sumResult <= 16)
  localRes = ('Annoying');
elseif (sumResult >= 17 && sumResult <= 32)
  localRes = ('Uncomfortable');
elseif (sumResult >= 33 && sumResult <=48)
  localRes = ('Dreadful');
elseif (sumResult >= 49 && sumResult <= 64)
  localRes = ('Horrible');  
elseif (sumResult >= 65)
  localRes = ('Agonizing');
endif

localRes
localScore = (sumResult);
neckScore = cell2mat(sqr(2,2));
upperBackScore = cell2mat(sqr(3,2));
shoulderScore = cell2mat(sqr(4,2));
midBackScore = cell2mat(sqr(5,2));
elbowScore = cell2mat(sqr(6,2));
lowBackScore = cell2mat(sqr(7,2));
wristHandsScore = cell2mat(sqr(8,2));
buttocksHipsThighsScore = cell2mat(sqr(9,2));

totalResult = [localScore, neckScore, upperBackScore,shoulderScore, midBackScore, elbowScore,lowBackScore, wristHandsScore, buttocksHipsThighsScore]

[filepath, name, ext] = fileparts(csv_file);

filename = strcat(result_dir, "/", "Local_Score", ".yaml");
store_vector(filename, totalResult);

endfunction