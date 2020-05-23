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
    % metaBolicCostLP.m                                                              %
    % Author(s): Jawad Masood						      %
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
    % opt1:  allows user to choose between two main options(user input)       %
    %               1) Maintenance of body postures                           %
    %               2) Net metabolic cost of tasks                            %
    %                                                                         %
    % opt2: allows user to choose between 3 maintenance of body               %
    %               postures (user input).                                    %
    %                                                                         %
    % opt3:  allows user to choose between 22 metabolic cost tasks            %
    %               (user input).                                             %
    %                                                                         %
    % BW: Body Weigh in kg (user input).                                      %
    %                                                                         %
    % S:  Gender; 1 for males and 0 for females(user input).                  %
    %                                                                         %
    % L:  Weigh of the load in kg (user input).                               %
    %                                                                         %
    % h1: Vertical height from floor, STARTING point for lift and END point   %
    %     for lower, in meters (user input).                                  %
    %                                                                         %
    % h2: Vertical height from floor, STARTING point for lift and END point   %
    %     for lower, in meters (user input).                                  %
    %                                                                         %
    % V:  Speed of walking in meters per second (user input).                 %
    %                                                                         %
    % G:  Grade of the walking surface as a percenteage (user input).         %
    %                                                                         %
    % t:  Time in minutes (user input).                                       %
    %                                                                         %
    % F:  Average pushing/pulling force applied by hands in kg (user input).  %
    %                                                                         %
    % X:  Horizontal movement of work piece in meters (user input).           %
    %                                                                         %
    % res: result of the the specific case (app output).                      %
    %                                                                         %
    % fid: text file identification to record this app results.               %
    %                                                                         %
    % printVar: variable used to shorter the console printing commands.       %
    %                                                                         %
    % time= time of the app start.                                            %
    %                                                                         %
    % clear: clears all variables values from symbol table.                   %
    %                                                                         %
    % clc: clears the terminal screen and moves the cursor to the upper left  %
    %      corner.                                                            %
    %                                                                         %
    % fflush: ensures that all pending output makes it to the screen before   %
    %         some other event occurs. It's good to flush the standard output %
    %         stream before calling 'input' methods.                          %
    %                                                                         %
    % ----------------------------------------------------------------------- %
 
    % Base values for testing:
    % Body Weigh (50% cases male, 50% female), from 25 to 30 y.o: 
    %   84.3 kg for male and 66,7 kg for female
    % F = 20 kg
    % G= 5%
    % h2 = 1,60 m -->160 cm
    % h1 = 1 m --> 100 cm
    % L= 10 kg
    % V= 5 km/h = 1,38 m/s
    % X = 0,1 m = 100 cm
    % t= 2 min
 
    % ----------------------------------------------------------------------- %
    % Simulate or plotting commands:
 
clc; clear all;
fflush (stdout);
time=datestr (now (),'yyyy/mm/dd - HH:MM:SS: FFF');
subjectNum=input("Please, enter the subject's identification number \
(01, 02,...):\n\n","s");
 
testRunNum=input("\n\nPlease, enter the test run number (01, 02,...):\n\n","s");
 
opt1=input("\n\nPlease, make a selection:\n\n1)Maintenance of body \
postures\n\n2)Net metabolic cost of tasks\n\n");
 
switch (opt1);
  
  case (1);
  
  printf('\n\nYou have selected "Maintenance of body postures"')
  BW=input("\n\nPlease, enter BW (the body weight, in kg):\n\n");
  opt2=input("\n\nPlease, select a prediction model from the next \
appendix:\n\n1a) Sitting.\n\n1b) Standing.\n\n1c) Standing, bent \
position.\n\n\n\n","s");
 
    switch (opt2);   
      case '1a'  
      printf('\n\nSelected option:\n\n')
      printf('1a) Sitting.\n\n');
      caseID=('1a) Sitting');
      res=0.023*BW;
      inputArray = ('[BW]');
      inputValues=[BW];
      printf('\n\nThe result is %0.2f Kcal/min.',res)
      case '1b'
      printf('\n\nSelected option:\n\n')
      printf('1b) Standing.\n\n');
      caseID=('1b) Standing');
      res=0.024*BW;
      inputArray = ('[BW]');
      inputValues=[BW];
      fprintf('\n\nThe result is %0.2f Kcal/min. ',res)    
      case '1c'
      printf('\n\nSelected option:\n\n')
      printf('1c) Standing, bent position.\n\n');
      caseID=('1c) Standing, bent position'); 
      res=0.028*BW;
      inputArray = ('[BW]');
      inputValues=[BW];
      fprintf('\n\nThe result is %0.2f Kcal/min. ',res)            
      otherwise 
      fprintf('\n\nYou did not select any case. ')  
    endswitch
 
  case (2);
  clc;
  printf('\n\nYou have selected "Net metabolic cost of tasks"\n\n')  
  printf('Now, please, select a prediction model from the next appendix:\n\n')
  printf('\n\n2a) Stoop lift\n\n')
  printf('2b) Squat lift\n\n')
  printf('2c) One hand lift\n\n')
  printf('2d) Arm lift\n\n2e) Stoop lower\n\n2f) Squat lower\n\n')
  printf('2g) Arm lower\n\n2h) Walking\n\n')
  printf('2i) Carrying, loads held at arms length at sides (1 or 2 hands)')
  printf('\n\n2j) Carrying, loads held against thighs or against waist\n')
  printf('\n2k) Holding, at arms length, against thighs or at sides (2 hands)')
  printf('\n\n2l) Holding, against waist')
  printf('\n\n2m) Holding, at arms length in 1 hand')
  printf('\n\n2n) Pushing/pulling, at bench height (0.8 meter)')
  printf('\n\n2o) Pushing/pulling, at 1.5 meter height');
  printf('\n\n2p) 180 degrees arms lateral movement, 1 hand')
  printf('\n\n2q) 180 degrees arms lateral movement, 2 hands\n\n')
  printf('2r) Lateral movement of arms of 90 degrees, standing, 1 or 2 hands')
  printf('\n\n2s) 90 degrees arms lateral movement, sitting, 2 hands')
  printf('\n\n2t) 90 degrees arms lateral movement, sitting, 1 hand')
  printf('\n\n2u) Forward movement of arms, standing, 1 or 2 hands\n\n')
  opt3=input("2v) Forward movement of arms, sitting, 1 or 2 hands\n\n\n\n","s");
  switch(opt3);
    case '2a'
    clc;
    printf('\n\nSelected option:\n\n')
    printf('2a) Stoop lift.\n\n');
    caseID=('2a) Stoop lift');
    BW=input("\n\nPlease, enter BW (the body weight, in kg):\n\n");
    S=input("\n\nPlease, enter S (the subject's gender; 1 male, 0 female):\n");
    L=input("\n\n\nPlease, enter L (the weight of the load, in kg):\n\n");
    h1=input("\n\nPlease, enter h1 (the lower point's vertical height \ 
from floor, in meters):\n\n");
    while (h1>=0.81)
      clc;
      printf("\n\nWARNING: h1 should be lower than 0.81 meters!\n\n")
      printf('\n\nPlease enter the proper h1 value\n\n');
      h1=input("\n\nPlease, enter h1 (the lower point's vertical height \ 
from floor, in meters):\n\n");
    endwhile
     h2=input("\n\nPlease, enter h2 (the higher point's vertical height from \
floor, in meters):\n\n");
    while (h2>0.81)||(h1>=h2)
      clc;
      printf("\n\nWARNING: h2 should be lower than or equal to 0.81 meters\n\n")
      printf("\n\nWARNING: h2 should be higher than h1!") 
      printf("Please enter the proper h2 value\n\n")
      h2=input("\n\nPlease, enter h2 higher point's vertical height from floor,\
 in meters):\n\n");
    endwhile 
    res=10^-2*[0.325*BW*(0.81-h1)+(1.41*L+0.76*S*L)*(h2-h1)];
    printf('\n\nThe result is %0.4f (Kcal/lift) ',res);    
    inputArray = ('[BW,S,L,h1,h2]');
    inputValues=[BW,S,L,h1,h2];
    case '2b'
    clc;
    printf('Selected option:\n\n')
    printf('2b) Squat lift.\n\n');
    caseID=('2b) Squat lift');
    BW=input("\n\nPlease, enter BW (the body weight, in kg):\n\n");
    S=input("\n\nPlease, enter S (the subject's gender; 1 male, 0 female):\n");
    L=input("\n\n\nPlease, enter L (the weight of the load, in kg):\n\n");
    h1=input("\n\nPlease, enter h1 (the lower point's vertical height \ 
from floor, in meters):\n\n");
    while (h1>=0.81)
      printf("\n\nWARNING: h1 should be lower than 0.81 meters\n\n!\n\n")
      h1=input("\n\nPlease, enter h1 (the lower point's vertical height \ 
from floor, in meters):\n\n");
    endwhile
    h2=input("\n\nPlease, enter h2 (the higher point's vertical height from \
floor, in meters):\n\n");
    while (h2>0.81)||(h1>=h2)
      clc;
      printf("\n\nWARNING: h2 should be lower than or equal than 0.81 meters!")
      printf("\n\nWARNING: h2 should be higher than h1! ")
      h2=input("\n\nPlease, enter h2 (the higher point's vertical height from \
floor, in meters):\n\n");
    endwhile 
    res=10^-2*[0.514*BW*(0.81-h1)+(2.19*L+0.62*S*L)*(h2-h1)];
    printf('\n\nThe result is %0.4f (Kcal/lift) ',res) 
    inputArray = ('[BW,S,L,h1,h2]');
    inputValues=[BW,S,L,h1,h2];  
    case '2c'
    clc;
    printf('Selected option:\n\n')
    printf('2c) One hand lift.\n\n')
    caseID=('2c) One hand lift');
    BW=input("\n\nPlease, enter BW (the body weight, in kg):\n\n");
    L=input("\n\n\nPlease, enter L (the weight of the load, in kg):\n\n");
    h1=input("\n\nPlease, enter h1 (the lower point's vertical height \ 
from floor, in meters):\n\n");
    while (h1>=0.81)
      printf("\n\nWARNING: h1 should be lower than 0.81 meters\n\n!")
      h1=input("\n\nPlease, enter h1 (the lower point's vertical height \ 
from floor, in meters):\n\n");
    endwhile
   h2=input("\n\nPlease, enter h2 (the higher point's vertical height from \
floor, in meters):\n\n");
    while (h2>0.81)||(h1>=h2)
      printf("\n\nWARNING: h2 should be lower than or equal to 0.81 meters!")
      printf("\n\n\n\nWARNING: h2 should be higher than h1!") 
      h2=input("\n\nPlease, enter h2 (the higher point's vertical height from \
floor, in meters):\n\n");
    endwhile 
    res=10^-2*[0.352*BW*(0.81-h1)+3.03*L*(h2-h1)];
    printf('\n\nThe result is %0.4f (Kcal/lift) ',res) 
    inputArray = ('[BW,L,h1,h2]');
    inputValues=[BW,L,h1,h2];   
    case '2d'
    clc;
    printf('Selected option:\n\n')
    printf('2d) Arm lift.\n\n')
    caseID=('2d) Arm lift'); 
    BW=input("\n\nPlease, enter BW (the body weight, in kg):\n\n");
    S=input("\n\nPlease, enter S (the subject's gender; 1 male, 0 female):\n");
    L=input("\n\n\nPlease, enter L (the weight of the load, in kg):\n\n");
    h1=input("\n\nPlease, enter h1 (the lower point's vertical height \ 
from floor, in meters):\n\n");
    while (h1<=0.81)
      printf("\n\nWARNING: h1 should be higher than 0.81 meters\n\n!\n\n")
      h1=input("\n\nPlease, enter h1 (the lower point's vertical height \ 
from floor, in meters):\n\n");
    endwhile
    h2=input("\n\nPlease, enter h2 (the higher point's vertical height from \
floor, in meters):\n\n");
    while (h2<=0.81)||(h2<=h1)
      printf("\n\nWARNING: h2 should be higher than 0.81 meters\n\n!")
      printf("\n\nWARNING: h2 should be higher than h1!")
      h2=input("\n\nPlease, enter h2 (the higher point's vertical height from \
floor, in meters):\n\n");
    endwhile 
    res=10^-2*[0.062*BW*(h2-0.81)+(3.19*L-0.52*S*L)*(h2-h1)];
    printf('\n\nThe result is %0.4f (Kcal/lift) ',res)
    inputArray = ('[BW,S,L,h1,h2]');
    inputValues=[BW,S,L,h1,h2];   
    case '2e'
    clc;
    printf('Selected option:')
    printf('2e) Stoop lower.\n\n')
    caseID=('2e) Stoop lower');      
    BW=input("\n\nPlease, enter BW (the body weight, in kg):\n\n");
    S=input("\n\nPlease, enter S (the subject's gender; 1 male, 0 female):\n");
    L=input("\n\n\nPlease, enter L (the weight of the load, in kg):\n\n");
    h1=input("\n\nPlease, enter h1 (the lower point's vertical height \ 
from floor, in meters):\n\n");
    while (h1>=0.81)
      printf("\n\nWARNING: h1 should be lower than 0.81 meters\n\n!\n\n")
      printf("Please enter the proper h1 value\n\n")
      h1=input("\n\nPlease, enter h1 (the lower point's vertical height \ 
from floor, in meters):\n\n");
    endwhile
    h2=input("\n\nPlease, enter h2 (the higher point's vertical height from \
floor, in meters):\n\n");
    while (h2>=0.81)||(h1>=h2)
      printf("\n\nWARNING: h2 should be lower than 0.81 meters\n\n\n\n")
      printf("\n\nWARNING: h2 should be higher than h1!\n\n")
      h2=input("\n\nPlease, enter h2 (the higher point's vertical height from \
floor, in meters):\n\n");
    endwhile 
    res=10^-2*[0.268*BW*(0.81-h1)+0.675*L*(h2-h1)+5.22*S*(0.81-h1)];
    printf('\n\nThe result is %0.4f (Kcal/lower) ',res)
    inputArray = ('[BW,S,L,h1,h2]');
    inputValues=[BW,S,L,h1,h2];
    case '2f'
    clc;
    printf('Selected option:\n\n')
    printf('2f) Squat lower.\n\n')
    caseID=('2f) Squat lower'); 
    BW=input("\n\nPlease, enter BW (the body weight, in kg):\n\n");
    L=input("\n\n\nPlease, enter L (the weight of the load, in kg):\n\n");
    h1=input("\n\nPlease, enter h1 (the lower point's vertical height \ 
from floor, in meters):\n\n");
    while (h1>=0.81)
      printf("\n\nWARNING: h1 should be lower than 0.81 meters\n\n!")
      h1=input("\n\nPlease, enter h1 (the lower point's vertical height \ 
from floor, in meters):\n\n");
    endwhile
    h2=input("\n\nPlease, enter h2 (the higher point's vertical height from \
floor, in meters):\n\n");
    while (h2<0.81)||(h1>=h2)
      printf("\n\nWARNING: h2 should be higher or equal than 0.81 meters\n\n")
      printf("\n\nWARNING: h2 should be higher than h1!\n\n")
      h2=input("\n\nPlease, enter h2 (the higher point's vertical height from \
floor, in meters):\n\n");
    endwhile 
    res=10^-2*[0.511*BW*(0.81-h1)+0.701*L*(h2-h1)];
    printf('\n\nThe result is %0.4f (Kcal/lower) ',res)
    inputArray = ('[BW,L,h1,h2]');
    inputValues=[BW,L,h1,h2];
    case '2g'
    clc;
    printf('Selected option:\n\n')
    printf('2g) Arm lower.\n\n');  
    caseID=('2g) Arm lower');
    BW=input("\n\nPlease, enter BW (the body weight, in kg):\n\n");
    S=input("\n\nPlease, enter S (the subject's gender; 1 male, 0 female):\n");
    L=input("\n\n\nPlease, enter L (the weight of the load, in kg):\n\n");
    h1=input("\n\nPlease, enter h1 (the lower point's vertical height \ 
from floor, in meters):\n\n");
    while (h1<=0.81)
      printf("\n\nWARNING: h1 should be higher than 0.81 meters\n\n!\n\n") 
      h1=input("\n\nPlease, enter h1 (the lower point's vertical height \ 
from floor, in meters):\n\n");
    endwhile
    h2=input("\n\nPlease, enter h2 (the higher point's vertical height from \
floor, in meters):\n\n");
    while (h2<=0.81)||(h2<=h1)
      printf("\n\nWARNING: h2 should be higher than than 0.81 meters\n\n\n\n")
      printf("\n\nWARNING: h2 should be higher than h1!n\n")
      h2=input("\n\nPlease, enter h2 (the higher point's vertical height from \
floor, in meters):\n\n");
    endwhile 
    res=10^-2*[0.093*BW*(h2-0.81)+(1.02*L+0.37*S*L)*(h2-h1)];
    printf('\n\nThe result is %0.4f (Kcal/lower) ',res)
    inputArray = ('[BW,L,S,h1,h2]');
    inputValues=[BW,L,S,h1,h2];
    case '2h'
    clc;
    printf('Selected option:\n\n')
    printf('2h) Walking.\n\n')  
    caseID=('2h) Walking');
    BW=input("\n\nPlease, enter BW (the body weight, in kg):\n\n");
    V=input("\n\nPlease, enter V (the walking speed in m/s):\n\n");
    G=input("\n\nPlease, enter G (grade of the walking surface, in %):\n\n");
    t=input("\n\nPlease, enter t (the time, in minutes):\n\n");
    res=10^-2*(51+(2.54*BW)*(V^2)+(0.379*BW*G*V))*t;
    printf('\n\nThe result is %0.4f (Kcal) ',res)
    inputArray = ('[BW,V,G,t]');
    inputValues=[BW,V,G,t];
    case '2i'
    clc;
    printf('Selected option:\n\n')
    printf('2i) Carrying, loads held at arms length at sides (1 or 2 hands).\n')
    caseID=('2i) Carrying, loads held at arms length at sides (1 or 2 hands)');
    BW=input("\n\nPlease, enter BW (the body weight, in kg):\n\n");
    V=input("\n\nPlease, enter V (the walking speed in m/s):\n\n");
    G=input("\n\nPlease, enter G (grade of the walking surface, in %):\n\n");
    L=input("\n\n\nPlease, enter L (the weight of the load, in kg):\n\n");
    t=input("\n\nPlease, enter t (the time, in minutes):\n\n");
    res=10^-2*[80+2.43*BW*(V^2)+4.63*L*(V^2)+4.62*L+0.379*(L+BW)*G*V]*t;
    printf('\n\nThe result is %0.4f (Kcal) ',res)
    inputArray = ('[BW,V,G,L,t]');
    inputValues=[BW,V,G,L,t];
    case '2j'
    clc;
    printf('Selected option:\n\n')
    printf('2j) Carrying, loads held against thighs or against waist.\n\n');
    caseID=('2j) Carrying, loads held against thighs or against waist');
    BW=input("\n\nPlease, enter BW (the body weight, in kg):\n\n");
    V=input("\n\nPlease, enter V (the walking speed in m/s):\n\n");
    G=input("\n\nPlease, enter G (grade of the walking surface, in %):\n\n");
    L=input("\n\n\nPlease, enter L (the weight of the load, in kg):\n\n");
    t=input("\n\nPlease, enter t (the time, in minutes):\n\n");
    res=10^-2*[68+2.54*BW*V^2+4.08*L*V^2+11.4*L+0.379*(L+BW)*G*V]*t;
    printf('\n\nThe result is %0.4f (Kcal) ',res)
    inputArray = ('[BW,V,G,L,t]');
    inputValues=[BW,V,G,L,t];
    case '2k'
    clc;
    printf('Selected option:\n\n')
    printf('2k) Holding, at arms length, against thighs or at sides(2 hands).');
    caseID=('2k) Holding, at arms length, against thighs or at sides(2 hands)');
    L=input("\n\n\nPlease, enter L (the weight of the load, in kg):\n\n");
    t=input("\n\nPlease, enter t (the time, in minutes):\n\n");
    res=(0.037*L)*t;
    printf('\n\nThe result is %0.4f (Kcal) ',res) 
    inputArray = ('[L,t]');
    inputValues=[L,t];   
    case '2l'
    clc;
    printf('Selected option:\n\n')
    printf('2l) Holding, against waist.');
    caseID=('2l) Holding, against waist');
    L=input("\n\n\nPlease, enter L (the weight of the load, in kg):\n\n");
    t=input("\n\nPlease, enter t (the time, in minutes):\n\n");
    res=(0.062*L)*t;
    printf('\n\nThe result is %0.4f (Kcal) ',res)
    inputArray = ('[L,t]');
    inputValues=[L,t];    
    case '2m'
    clc;
    printf('Selected option:\n\n\n\n')
    printf('2m) Holding, at arms length in one hand.');  
    caseID=('2m) Holding, at arms length in one hand');
    L=input("\n\n\nPlease, enter L (the weight of the load, in kg):\n\n");
    t=input("\n\nPlease, enter t (the time, in minutes):\n\n");
    res=(0.088*L)*t;
    printf('\n\nThe result is %0.4f (Kcal) ',res)    
    inputArray = ('[L,t]');
    inputValues=[L,t]; 
    case '2n'
    clc;
    printf('Selected option:\n\n\n\n')
    printf('2n) Pushing/pulling, at bench height (0.8 meters).'); 
    caseID=('2n) Pushing/pulling, at bench height (0.8 meters)');
    BW=input("\n\nPlease, enter BW (the body weight, in kg):\n\n");
    F=input("\n\nPlease, enter F (the average pushing/pulling \
force applied by hands, in kg):\n\n");
    S=input("\n\nPlease, enter S (the subject's gender; 1 male, 0 female):\n");
    X=input("\n\nPlease, enter X (the horizontal movement of the work \
piece, in meters):\n\n");
    res=10^-2*X*(0.112*BW+1.15*F+0.505*S*F);
    printf('\n\nThe result is %0.4f (Kcal/push) ',res)
    inputArray = ('[BW,F,S,X]');
    inputValues=[BW,F,S,X];    
    case '2o'
    clc;
    printf('Selected option:\n\n')
    printf('2o) Pushing/pulling, at 1.5 meters height.'); 
    caseID=('2o) Pushing/pulling, at 1.5 meters height');
    F=input("\n\nPlease, enter F (the average pushing/pulling \
force applied by hands, in kg):\n\n");
    X=input("\n\nPlease, enter X (the horizontal movement of the work \
piece, in meters):\n\n");
    res=X*(0.086+(0.036*F));
    printf('\n\nThe result is %0.4f (Kcal/push) ',res)
    inputArray = ('[X,F]');
    inputValues=[X,F]; 
    case '2p'
    clc;
    printf('Selected option:\n\n')
    printf('2p) Lateral movement of arms of 180 degrees, 2 hands.'); 
    caseID=('2p) Lateral movement of arms of 180 degrees, 2 hands');
    BW=input("\n\nPlease, enter BW (the body weight, in kg):\n\n");
    L=input("\n\n\nPlease, enter L (the weight of the load, in kg):\n\n");
    res=10^-2*(0.11*BW+0.726*L);
    printf('\n\nThe result is %0.4f (Kcal/lateral movement of arms) ',res)
    inputArray = ('[BW,L]');
    inputValues=[BW,L]; 
    case '2q'
    clc;
    printf('Selected option:\n\n')
    printf('2q) Lateral movement of arms of 180 degrees, 1 hand.'); 
    caseID=('2q) Lateral movement of arms of 180 degrees, 1 hand');
    BW=input("\n\nPlease, enter BW (the body weight, in kg):\n\n");
    L=input("\n\n\nPlease, enter L (the weight of the load, in kg):\n\n");
    res=10^-2*(0.097*BW+0.946*L);
    printf('\n\nThe result is %0.4f (Kcal/lateral movement of arm) ',res)
    inputArray = ('[BW,L]');
    inputValues=[BW,L];
    case '2r'
    clc;
    printf('Selected option:\n\n')
    printf('2r) 90 degrees arms lateral movement, standing, 1 or 2 hands.');
    caseID=('2r) 90 degrees arms lateral movement, standing, 1 or 2 hands');
    L=input("\n\n\nPlease, enter L (the weight of the load, in kg):\n\n");
    S=input("\n\nPlease, enter S (the subject's gender; 1 male, 0 female):\n");
    res=10^-2*(3.31+(0.629*L)+(0.143*S)*L);
    printf('\n\nThe result is %0.4f (Kcal/lateral movement of arms) ',res)
    inputArray = ('[L,S]');
    inputValues=[L,S];
    case '2s'
    clc;
    printf('Selected option:\n\n')
    printf('2s) 90 degrees arms lateral movement, sitting, 2 hands.');
    caseID=('2s) 90 degrees arms lateral movement, sitting, 2 hands');
    L=input("\n\n\nPlease, enter L (the weight of the load, in kg):\n\n");
    S=input("\n\nPlease, enter S (the subject's gender; 1 male, 0 female):\n");
    res=10^-2*(3.5+(0.682*L)+(0.321*S)*L);
    printf('\n\nThe result is %0.4f (Kcal/lateral movement of arms) ',res)
    inputArray = ('[L,S]');
    inputValues=[L,S];
    case '2t'
    clc;
    printf('Selected option:\n\n')
    printf('2t) 90 degrees arms lateral movement, sitting, 1 hand.');
    caseID=('2t) 90 degrees arms lateral movement, sitting, 1 hand');
    L=input("\n\n\nPlease, enter L (the weight of the load, in kg):\n\n");
    S=input("\n\nPlease, enter S (the subject's gender; 1 male, 0 female):\n");
    res=10^-2*(2.54+(1.1*L)+(0.248*S)*L);
    printf('\n\nThe result is %0.4f (Kcal/lateral movement of arm.) ',res)
    inputArray = ('[L,S]');
    inputValues=[L,S];
    case '2u'
    clc;
    printf('Selected option:\n\n') 
    printf('2u) Forward movement of arms, standing, 1 or 2 hands.');
    caseID=('2u) Forward movement of arms, standing, 1 or 2 hands');
    L=input("\n\n\nPlease, enter L (the weight of the load, in kg):\n\n");
    X=input("\n\nPlease, enter X (the horizontal movement of the work \
piece, in meters):\n\n");
    res=10^-2*X*(3.57+(1.23*L));
    printf('\n\nThe result is %0.4f (Kcal/movement) ',res)
    inputArray = ('[L,X]');
    inputValues=[L,X];
    case '2v'
    clc;
    printf('Selected option:\n\n')
    printf('2v) Forward movement of arms, sitting, 1 or 2 hands.');
    caseID=('2v) Forward movement of arms, sitting, 1 or 2 hands');
    L=input("\n\n\n\nPlease, enter the weight of the load in kg:\n\n");
    X=input("\n\nPlease, enter X (the horizontal movement of the work \
piece, in meters):\n\n");
    res=10^-2*X*(6.3+(2.71*L));
    printf('\n\nThe result is %0.4f (Kcal/movement of arms) ',res)
    inputArray = ('[L,X]');
    inputValues=[L,X];
    otherwise 
    printf('\n\nYou didnt select any case. ')
    endswitch
endswitch
 
%Output txt
fid = fopen('appResult.txt', 'w');
message0 = ('The selected case is: ');
dlmwrite('appResult.txt', message0,'%s');
dlmwrite('appResult.txt', caseID,"","-append");
blank0 = ('');
dlmwrite('appResult.txt', blank0,"","-append"); 
dlmwrite('appResult.txt', inputArray,"","-append");
blank1 = ('');
dlmwrite('appResult.txt', blank1,"","-append");
message1 = ('The values of the input array are: [');
dlmwrite('appResult.txt', message1,'%s',"-append");
dlmwrite('appResult.txt',inputValues,",","-append");
message2 = (']');
dlmwrite('appResult.txt', message2,"-append");
blank2 = ('');
dlmwrite('appResult.txt', blank2,"","-append");
message3 = ('The result of this case is:');
dlmwrite('appResult.txt', message3,"","-append");
dlmwrite('appResult.txt', res,"-append");
fclose(fid);
rename ('appResult.txt', sprintf("Subject_%s_Case_%s.txt",...
subjectNum,testRunNum));
%Output csv
int2str (time); 
int2str (subjectNum);
int2str (testRunNum);
headers = {'TIME-STAMP' 'SUBJECT ID' ' TEST ID' 'CASE' 'INPUT VARIABLES'...
 'RESULT' 'INPUT VARIABLES VALUES'};
fid = fopen(sprintf("Subject_%s_Case_%s.csv",subjectNum,testRunNum),'w');
fprintf(fid,'%s; %s; %s; %s; %s; %s; %s\n',headers{1,1:7});
fprintf(fid,'%s; %s; %s; %s;',time,subjectNum,testRunNum,caseID,inputArray);
fprintf(fid,'%0.4f;',res);
fprintf(fid,'%0.2f  ',inputValues(1,:));
fclose(fid);
% --------------------------------------------------------------------------- %
 
% --------------------------------------------------------------------------- %
% Print/save model file: metricMetaCost.m 
% --------------------------------------------------------------------------- %
