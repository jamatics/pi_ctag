    % ----------------------------------------------------------------------- %
    % The tedSR  API is a toolkit for scalable performance metrics and        %
    % simulation. See http://eurobench2020.eu/ and the NOTICE file            %
    % for more information. TedSR is developed at Fundación para la Promoción %
    % de la Automoción en Galicia. CTAG, and supported by European Comission  %
    % H2020 Progamme under TestEd FTP Eurobench.			                        %
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
    % borgScale10LP.m                                                         %
    % Author(s): Jawad Masood						      %
    % ----------------------------------------------------------------------- %
    
    
pkg load io;
pkg load signal;

clear; 
close all;
clc;

sqr = csv2cell('/home/osboxes/repo/pi_ctag/borgScale10/borgScale10_ctag/test_data/input/questionnaire5_narrow_1.csv', ';');
sumResult = sum(cell2mat(sqr(2:end,2)));

if (sumResult == 0)
  globalRes = ('None');
elseif (sumResult >= 1 && sumResult <= 16)
  globalRes = ('Annoying');
elseif (sumResult >= 17 && sumResult <= 32)
  globalRes = ('Uncomfortable');
elseif (sumResult >= 33 && sumResult <=48)
  globalRes = ('Dreadful');
elseif (sumResult >= 49 && sumResult <= 64)
  globalRes = ('Horrible');  
elseif (sumResult >= 65)
  globalRes = ('Agonizing');
endif

globalRes

