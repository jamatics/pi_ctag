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
    % chronoLP.m                                                              %
    % Author(s): Jawad Masood						      %
    % ----------------------------------------------------------------------- %
function value = chronoScorer(inputData);

header = buildHeader(2); %Calls an external function (builderHeader) to build the header of the answer. This function is located in C:/GIT/Eurobench/OctaveScripts/utils
payload.scores = {}; %answer object creation

locChronoLowExo=0.0;
locChronoMedExo=0.0;
locChronoHighExo=0.0;
locChronoNoAssistExo=0.0;
gloChronoRes=0.0;
mean_noExo=0.0;

assistances = inputData.payload{1,1}.assistances;
r = inputData.payload{1,1}.qtyRuns;
a = inputData.payload{1,1}.qtyAssistanceLevel;
testID = inputData.payload{1,1}.testSessionId;
resultChrono.testSessionId = testID;
resultChrono.metricId = inputData.payload{1,1}.metricId;
resultChrono.assistances = {};

locChrono=zeros(5,1);

%Find NO EXO results first
 for assistance=assistances  
    cFP = assistance{1,1}.runs;  
    assistIndex = assistance{1,1}.assistanceNumber;  
    
    for nRun = 1:columns(cFP)
      assistID = cFP{1, nRun}.assistanceId;
      subjtID = cFP{1, nRun}.subjectId;
      runNumb = cFP{1, nRun}.runNumber;
     
      if (assistID == 5)
          analysis_noExo(nRun) = str2double(cFP{1,nRun}.timestampDiff);
          printf("\n timeDIFF: %f", analysis_noExo(nRun));
          mean_medExo = 0;
          mean_highExo = 0;
          mean_noAssistExo = 0;
   
          mean_noExo = double(sum(analysis_noExo))/double(r);
          printf("\n mean_noExo: %f", mean_noExo);
          locChrono(assistIndex) = 100;
          printf("\n locChrono: %f", locChrono(assistIndex));

       endif    
       
    endfor
 
endfor


%Calculate scores
  for assistance=assistances  
    cFP = assistance{1,1}.runs; 
    analysis_lowExo = zeros(r,1);
    analysis_medExo = zeros(r,1);
    analysis_highExo = zeros(r,1);
    analysis_noAssistExo = zeros(r,1);
    assistIndex = assistance{1,1}.assistanceNumber;
    
    for nRun = 1:columns(cFP)
      assistID = cFP{1, nRun}.assistanceId;
      subjtID = cFP{1, nRun}.subjectId;
      runNumb = cFP{1, nRun}.runNumber;
      
      switch (assistID)

      case 1        
          analysis_lowExo(nRun) = str2double(cFP{1,nRun}.timestampDiff);
          printf("\n timeDIFF: %f", analysis_lowExo(nRun));
          printf("\n mean_noExo: %f", mean_noExo);

          mean_lowExo = double(sum(analysis_lowExo))/double(r);
          printf("\n mean_lowExo: %f", mean_lowExo);
          mean_medExo = 0;
          mean_highExo = 0;
          mean_noAssistExo = 0;         
          locChronoLowExo = ((mean_noExo - mean_lowExo)/mean_noExo);

          locChrono(assistIndex) = ((mean_noExo - mean_lowExo)/mean_noExo)*100;
          printf("\n locChrono: %f", locChrono(assistIndex));
         
      case 2
          analysis_medExo(nRun) =  str2double(cFP{1,nRun}.timestampDiff);
          printf("\n timeDIFF: %f", analysis_medExo(nRun));
          printf("\n mean_noExo: %f", mean_noExo);
          mean_lowExo = 0;
          mean_medExo = double(sum(analysis_medExo))/double(r);
          printf("\n mean_medExo: %f", mean_medExo);
          mean_highExo = 0;
          mean_noAssistExo = 0;
          locChronoMedExo = ((mean_noExo - mean_medExo)/mean_noExo);
          
          locChrono(assistIndex) = ((mean_noExo - mean_medExo)/mean_noExo)*100;
          printf("\n locChrono: %f", locChrono(assistIndex));
         
      case 3
          analysis_highExo(nRun) = str2double(cFP{1,nRun}.timestampDiff);
          printf("\n timeDIFF: %f", analysis_highExo(nRun));
          printf("\n mean_noExo: %f", mean_noExo);
          mean_lowExo = 0;
          mean_medExo = 0;
          mean_highExo = double(sum(analysis_highExo))/double(r);
          printf("\n mean_highExo: %f", mean_highExo);
          mean_noAssistExo = 0;       
          locChronoHighExo = ((mean_noExo - mean_highExo)/mean_noExo);
         
          locChrono(assistIndex) = ((mean_noExo - mean_highExo)/mean_noExo)*100;
          printf("\n locChrono:  %f", locChrono(assistIndex));
         
      case 4
          analysis_noAssistExo(nRun) = str2double(cFP{1,nRun}.timestampDiff);
          printf("\n timeDIFF: %f", analysis_noAssistExo(nRun));
          printf("\n mean_noExo: %f", mean_noExo);
          mean_lowExo = 0;
          mean_medExo = 0;
          mean_highExo = 0;
          mean_noAssistExo = double(sum(analysis_noAssistExo))/double(r);
          printf("\n mean_noAssistExo: %f", mean_noAssistExo);       
          locChronoNoAssistExo = ((mean_noExo - mean_noAssistExo)/mean_noExo);
         
          locChrono(assistIndex) = ((mean_noExo - mean_noAssistExo)/mean_noExo)*100;
          printf("\n locChrono: %f", locChrono(assistIndex));

       endswitch    
       
    endfor
      resultAssistance.assistanceId = assistance{1,1}.assistanceId;    
      resultAssistance.assistanceNumber = assistance{1,1}.assistanceNumber;  
      resultAssistance.score = locChrono(assistIndex);
      resultChrono.assistances{end +1} = resultAssistance;  
  endfor
 
  %Simple global result  
  globalResult = ((locChronoLowExo+locChronoMedExo+locChronoHighExo+locChronoNoAssistExo)/double((a-1)))*100;

  resultChrono.globalResult = globalResult
  payload.scores{1,1} = resultChrono;
  %savejson(payload)
  value = struct('header',header,'payload',payload);
endfunction

function value = buildPayload(id,score)
  value = struct('scoreId',id,'score',score);
endfunction