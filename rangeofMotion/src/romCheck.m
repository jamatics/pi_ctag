    % ----------------------------------------------------------------------- %
    % The tedSR  API is a toolkit for scalable performance metrics and        %
    % simulation. See http://eurobench2020.eu/ and the NOTICE file            %
    % for more information. TedSR is developed at Fundación para la Promoción %
    % de la Automoción en Galicia. CTAG, and supported by European Commission %
    % H2020 Programme under TestEd FTP Eurobench.			      %
    %                                                                         %
    % Copyright (c) 2019-2020 CTAG and the authors                            %
    % Author(s): Erika Trivino  & Jawad Masood      	                      %
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


%function [limit_position, counter_comply, maxVal, minVal] = romCheck(header,angles,joint,lL,uL)
function [limit_position, counter_noncomply_extension, maxVal, minVal] = romCheck(header,angles,joint,lL,uL)
%function [limit_position, counter_noncomply_flexion, maxVal, minVal] = romCheck(header,angles,joint,lL,uL)

for i = 1:length(header) 
  if strcmp(header{1,i},joint)
    limit_position{1,1} = joint;
    formatSpec = '%s --> Exist in the column: %d\n';
    fprintf(formatSpec,joint,i);
    maxVal = max(angles(1:end,i));
    minVal = min(angles(1:end,i));
    medVal = median(angles(1:end,i));
    nC = i;
  endif 
endfor 
 
counter_comply = 0;
counter_noncomply_flexion = 0;
counter_noncomply_extension = 0;
i = nC; 
for j = 1:length(angles(1:end,i))
  if (angles(j,i) >= lL) && (angles(j,i) <= uL)
    counter_comply++;
    limit_position_comply{counter_comply++, 1} = angles(j,i);
    %disp('value within limits');
    elseif angles(j,i) > uL
      counter_noncomply_flexion++;
      angles(j,i);
      location_noncomply_flexion = j;
      %disp('value exceed maximum value');
    else
      counter_noncomply_extension++
      angles(j,i);
      location_noncomply_extension = j;
      %disp ('value exceed min value');
  endif
endfor
% We have included the code below to adjust the counter_comply as it counts the 
% the input and output limit. It is to correct the output.
counter_comply= counter_comply / 2;
endfunction
