    % ----------------------------------------------------------------------- %
    % The tedSR  API is a toolkit for scalable performance metrics and        %
    % simulation. See http://eurobench2020.eu/ and the NOTICE file            %
    % for more information. TedSR is developed at Fundación para la Promoción %
    % de la Automoción en Galicia. CTAG, and supported by European Commission %
    % H2020 Programme under TestEd FTP Eurobench.			      %
    %                                                                         %
    % Copyright (c) 2019-2020 CTAG and the authors                            %
    % Author(s): Jawad Masood & Federico Macció    	                      %
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

function result = computePI(csv_file, testbed_file, result_dir)
 
clear; 
close all;
clc;
format longG;
fflush (stdout);

csv_file = "../tests/data/input/subject_01_run_01_chrono.csv";
testbed_file = "../tests/data/input/subject_01_testbed_lowAssist.yaml";
result_dir = "../tests/data/output";
addpath("/home/jawad/Downloads/yamlMATLAB");

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

testbed_data = read_simple_yaml(testbed_file);
bw = str2double(cell2mat(testbed_data.subject_weight(1,1)));
s = str2double(cell2mat(testbed_data.gender(1,1)));
l = str2double(cell2mat(testbed_data.load(1,1)));
h1 = str2double(cell2mat(testbed_data.height1(1,1)));
h2 = str2double(cell2mat(testbed_data.height2(1,1)));
f = str2double(cell2mat(testbed_data.force(1,1)));
v = str2double(cell2mat(testbed_data.velocity(1,1)));
x = str2double(cell2mat(testbed_data.horizontalMovement(1,1)));
g = str2double(cell2mat(testbed_data.slope(1,1)));
% Task and sub-task
opt1 = str2double(cell2mat(testbed_data.mainOption1(1,1)));
opt1a = str2double(cell2mat(testbed_data.subOption1(1,1)));
opt2 = str2double(cell2mat(testbed_data.mainOption2(1,1)));
opt2a = str2double(cell2mat(testbed_data.subOption2(1,1)));
opt3 = str2double(cell2mat(testbed_data.mainOption3(1,1)));
opt3a = str2double(cell2mat(testbed_data.subOption3(1,1)));

rawData = csv2cell(csv_file, ',');
header = rawData(1, :);
taskTime = cell2mat(rawData(2:end, 1));
entryTime = taskTime(1, 1);
exitTime = taskTime(length(taskTime), 1);
taskCompletionTime = (exitTime - entryTime)/(1000*60);
t = taskCompletionTime;

switch (opt1);
  case (1);
    [res1] = postureMaintain(bw,opt1a);
  case (2);
    [res1] = otherTask(bw,s,l,h1,h2,f,x,v,g,t,opt1a)       
endswitch

switch (opt2);
  case (1);
    [res2] = postureMaintain(bw,opt2a);
  case (2);
    [res2] = otherTask(bw,s,l,h1,h2,f,x,v,g,t,opt2a)       
endswitch

switch (opt3);
  case (1);
    [res3] = postureMaintain(bw,opt3a);
  case (2);
    [res3] = otherTask(bw,s,l,h1,h2,f,x,v,g,t,opt3a)       
endswitch

totalResult = [res1, res2, res3, res1+res2+res3];


% EB sop for saving the data to the output folders
[filepath, name, ext] = fileparts(csv_file);

filename = strcat(result_dir, "/", "Local_Score", ".yaml");
store_vector(filename, totalResult);

endfunction
