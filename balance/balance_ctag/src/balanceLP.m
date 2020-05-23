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
    % balanceLP.m                                                              %
    % Author(s): Jawad Masood						      %
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
clear ; close all; clc;
 
e1=input("\nPlease select the upper element to\
 compare (S1 or S2):\n\n","s");
 
e2=input("\nPlease select the lower element to\
 compare (S1 or S2):\n\n","s");
 
BWs1=81;
BWs2=72;
 
if (e1=='S1')
  BW1=BWs1;
else 
  BW1=BWs2;
endif
 
if (e2=='S1')
  BW2=BWs1;
else 
  BW2=BWs2;
endif
 
cycleE1=input("\n\nPlease, select element 1 cases' cycle\
 (from 1 to 5):\n\n","s");
cycleE2=input("\n\nPlease, select element 2 cases' cycle\
 (from 1 to 5):\n\n","s");
 
rawDataA=load(sprintf (".\\tests\\data\\input\\%sa%s.txt", e1,cycleE1));
rawDataB=load(sprintf (".\\tests\\data\\input\\%sb%s.txt", e1,cycleE1));
rawDataC=load(sprintf (".\\tests\\data\\input\\%sc%s.txt", e1,cycleE1));
rawDataD=load(sprintf (".\\tests\\data\\input\\%sd%s.txt", e1,cycleE1));
 
rawDataE=load(sprintf (".\\tests\\data\\input\\%sa%s.txt", e2,cycleE2));
rawDataF=load(sprintf (".\\tests\\data\\input\\%sb%s.txt", e2,cycleE2));
rawDataG=load(sprintf (".\\tests\\data\\input\\%sc%s.txt", e2,cycleE2));
rawDataH=load(sprintf (".\\tests\\data\\input\\%sd%s.txt", e2,cycleE2));
 
rowsA=length(rawDataA);  
ax1=rawDataA(1:2500,2);
ay1=rawDataA(1:2500,3);
az1=rawDataA(1:2500,4);
at=rawDataA(1:2500,1);
ax2=rawDataA(1:2500,8);
ay2=rawDataA(1:2500,9);
az2=rawDataA(1:2500,10);
aX=(ax1+ax2)/2;
aY=(ay1+ay2)/2;
aZ=(az1+az2);
 
rowsB=length(rawDataB);
bx1=rawDataB(1:2500,2);
by1=rawDataB(1:2500,3);
bz1=rawDataB(1:2500,4);
bt=at;
bx2=rawDataB(1:2500,8);
by2=rawDataB(1:2500,9);
bz2=rawDataB(1:2500,10);
bX=(bx1+bx2)/2;
bY=(by1+by2)/2;
bZ=(bz1+bz2);
 
rowsC=length(rawDataC);  
cx1=rawDataC(1:2500,2);
cy1=rawDataC(1:2500,3);
cz1=rawDataC(1:2500,4);
ct=at;
cx2=rawDataC(1:2500,8);
cy2=rawDataC(1:2500,9);
cz2=rawDataC(1:2500,10);
cX=(cx1+cx2)/2;
cY=(cy1+cy2)/2;
cZ=(cz1+cz2);
 
rowsD=length(rawDataD);
dx1=rawDataD(1:2500,2);
dy1=rawDataD(1:2500,3);
dz1=rawDataD(1:2500,4);
dt=at;
dx2=rawDataD(1:2500,8);
dy2=rawDataD(1:2500,9);
dz2=rawDataD(1:2500,10);
dX=(dx1+dx2)/2;
dY=(dy1+dy2)/2;
dZ=(dz1+dz2);
 
rowsE=length(rawDataE);  
ex1=rawDataE(1:2500,2);
ey1=rawDataE(1:2500,3);
ez1=rawDataE(1:2500,4);
et=at;
ex2=rawDataE(1:2500,8);
ey2=rawDataE(1:2500,9);
ez2=rawDataE(1:2500,10);
eX=(ex1+ax2)/2;
eY=(ey1+ey2)/2;
eZ=(ez1+ez2);
 
rowsF=length(rawDataF);
fx1=rawDataF(1:2500,2);
fy1=rawDataF(1:2500,3);
fz1=rawDataF(1:2500,4);
ft=at;
fx2=rawDataF(1:2500,8);
fy2=rawDataF(1:2500,9);
fz2=rawDataF(1:2500,10);
fX=(fx1+fx2)/2;
fY=(fy1+fy2)/2;
fZ=(fz1+fz2);
 
rowsG=length(rawDataG);  
gx1=rawDataG(1:2500,2);
gy1=rawDataG(1:2500,3);
gz1=rawDataG(1:2500,4);
gt=at;
gx2=rawDataG(1:2500,8);
gy2=rawDataG(1:2500,9);
gz2=rawDataG(1:2500,10);
gX=(gx1+gx2)/2;
gY=(gy1+gy2)/2;
gZ=(gz1+gz2);
 
rowsH=length(rawDataH);
hx1=rawDataH(1:2500,2);
hy1=rawDataH(1:2500,3);
hz1=rawDataH(1:2500,4);
ht=at;
hx2=rawDataH(1:2500,8);
hy2=rawDataH(1:2500,9);
hz2=rawDataH(1:2500,10);
hX=(hx1+hx2)/2;
hY=(hy1+hy2)/2;
hZ=(hz1+hz2);
 
DPSI_a=10^-2*[((0-aX).^2+(0-aY).^2+(BW1-aZ).^2)/100]/BW1;
DPSI_b=10^-2*[((0-bX).^2+(0-bY).^2+(BW1-bZ).^2)/100]/BW1;
DPSI_c=10^-2*[((0-cX).^2+(0-cY).^2+(BW1-cZ).^2)/100]/BW1;
DPSI_d=10^-2*[((0-dX).^2+(0-dY).^2+(BW1-dZ).^2)/100]/BW1;
DPSI_e=10^-2*[((0-eX).^2+(0-eY).^2+(BW2-eZ).^2)/100]/BW2;
DPSI_f=10^-2*[((0-fX).^2+(0-fY).^2+(BW2-fZ).^2)/100]/BW2;
DPSI_g=10^-2*[((0-gX).^2+(0-gY).^2+(BW2-gZ).^2)/100]/BW2;
DPSI_h=10^-2*[((0-hX).^2+(0-hY).^2+(BW2-hZ).^2)/100]/BW2;
 
maxDPSI_a=max(DPSI_a);
maxDPSI_b=max(DPSI_b);
maxDPSI_c=max(DPSI_c);
maxDPSI_d=max(DPSI_d);
maxDPSI_e=max(DPSI_e);
maxDPSI_f=max(DPSI_f);
maxDPSI_g=max(DPSI_g);
maxDPSI_h=max(DPSI_h);
 
minDPSI_a=min(DPSI_a);
minDPSI_b=min(DPSI_b);
minDPSI_c=min(DPSI_c);
minDPSI_d=min(DPSI_d);
minDPSI_e=min(DPSI_e);
minDPSI_f=min(DPSI_f);
minDPSI_g=min(DPSI_g);
minDPSI_h=min(DPSI_h);
 
DPSI_aMEAN=mean(DPSI_a);
DPSI_bMEAN=mean(DPSI_b);
DPSI_cMEAN=mean(DPSI_c);
DPSI_dMEAN=mean(DPSI_d);
DPSI_eMEAN=mean(DPSI_e);
DPSI_fMEAN=mean(DPSI_f);
DPSI_gMEAN=mean(DPSI_g);
DPSI_hMEAN=mean(DPSI_h);
 
DPSI_aArea=sum (DPSI_a);
DPSI_bArea=sum (DPSI_b);
DPSI_cArea=sum (DPSI_c);
DPSI_dArea=sum (DPSI_d);
DPSI_eArea=sum (DPSI_e);
DPSI_fArea=sum (DPSI_f);
DPSI_gArea=sum (DPSI_g);
DPSI_hArea=sum (DPSI_h);
 
DPSI_aEnergyVStime=DPSI_aArea/25;
DPSI_aEnergyVStime=DPSI_aEnergyVStime/100;
 
DPSI_bEnergyVStime=DPSI_bArea/25;
DPSI_bEnergyVStime=DPSI_bEnergyVStime/100;
 
DPSI_cEnergyVStime=DPSI_cArea/25;
DPSI_cEnergyVStime=DPSI_cEnergyVStime/100;
 
DPSI_dEnergyVStime=DPSI_dArea/25;
DPSI_dEnergyVStime=DPSI_dEnergyVStime/100;
 
DPSI_eEnergyVStime=DPSI_eArea/25;
DPSI_eEnergyVStime=DPSI_eEnergyVStime/100;
 
DPSI_fEnergyVStime=DPSI_fArea/25;
DPSI_fEnergyVStime=DPSI_fEnergyVStime/100;
 
DPSI_gEnergyVStime=DPSI_gArea/25;
DPSI_gEnergyVStime=DPSI_gEnergyVStime/100;
 
DPSI_hEnergyVStime=DPSI_hArea/25;
DPSI_hEnergyVStime=DPSI_hEnergyVStime/100;
 
[Maxat, rowMaxat] = max(max(DPSI_a,[],2));
rowMaxatValue=at(rowMaxat,1);
[minat, rowMinat] = min(min(DPSI_a,[],2));
rowMinatValue=at(rowMinat,1);
 
[Maxbt, rowMaxbt] = max(max(DPSI_b,[],2));
rowMaxbtValue=bt(rowMaxbt,1);
[minbt, rowMinbt] = min(min(DPSI_b,[],2));
rowMinbtValue=bt(rowMinbt,1);
 
[Maxct, rowMaxct] = max(max(DPSI_c,[],2));
rowMaxctValue=ct(rowMaxct,1);
[minct, rowMinct] = min(min(DPSI_c,[],2));
rowMinctValue=ct(rowMinct,1);
 
[Maxdt, rowMaxdt] = max(max(DPSI_d,[],2));
rowMaxdtValue=dt(rowMaxdt,1);
[mindt, rowMindt] = min(min(DPSI_d,[],2));
rowMindtValue=dt(rowMindt,1);
 
[Maxet, rowMaxet] = max(max(DPSI_e,[],2));
rowMaxetValue=et(rowMaxet,1);
[minet, rowMinet] = min(min(DPSI_e,[],2));
rowMinetValue=et(rowMinet,1);
 
[Maxft, rowMaxft] = max(max(DPSI_f,[],2));
rowMaxftValue=ft(rowMaxft,1);
[minft, rowMinft] = min(min(DPSI_f,[],2));
rowMinftValue=ft(rowMinft,1);
 
[Maxgt, rowMaxgt] = max(max(DPSI_g,[],2));
rowMaxgtValue=gt(rowMaxgt,1);
[mingt, rowMingt] = min(min(DPSI_g,[],2));
rowMingtValue=gt(rowMingt,1);
 
[Maxht, rowMaxht] = max(max(DPSI_h,[],2));
rowMaxhtValue=ht(rowMaxht,1);
[minht, rowMinht] = min(min(DPSI_h,[],2));
rowMinhtValue=ht(rowMinht,1);
 
%                                                                         %
% ----------------------------------------------------------------------- %
 
% ----------------------------------------------------------------------- %
% Plotting commands:                                                      %
 
lowAssistanceTag=(sprintf(", low assitance, cycle: "));
mediumAssistanceTag=(sprintf(", medium assitance, cycle: "));
preferedAssistanceTag=(sprintf(", prefered assistance, cycle: "));
noExoTag=(sprintf(", no exoskeleton, cycle: "));
 
figure 1
 
ax1= subplot (421); plot (at, DPSI_a,'b');
title (sprintf ("%s%s%s",e1,lowAssistanceTag,cycleE1));
xlabel ('time (seconds)'); ylabel ('DPSI'); 
ylim (ax1, [(minDPSI_a-0.009) (maxDPSI_a+0.009)]);
grid on;
hold on;
plot([0,25],[maxDPSI_a,maxDPSI_a],"--b")
plot([0,25],[minDPSI_a,minDPSI_a],"--b")
plot([0,25],[DPSI_aMEAN,DPSI_aMEAN],"c")
text (rowMaxatValue,maxDPSI_a+0.005,["Max =", num2str(maxDPSI_a)],'color',...
'red','fontsize',14)
text (rowMinatValue,minDPSI_a-0.005,["Min =", num2str(minDPSI_a)],'color',...
'red','fontsize',14)
a1 = gca ();
p1 = get (gca, "position");
 
ax2= subplot (423); plot (bt, DPSI_b,'b');
title (sprintf ("%s%s%s",e1,mediumAssistanceTag,cycleE1));
xlabel ('time (seconds)'); ylabel ('DPSI'); 
ylim (ax2, [(minDPSI_b-0.009) (maxDPSI_b+0.009)]);
hold on;
plot([0,25],[maxDPSI_b,maxDPSI_b],"--b")
plot([0,25],[minDPSI_b,minDPSI_b],"--b")
plot([0,25],[DPSI_bMEAN,DPSI_bMEAN],"c")
text (rowMaxbtValue,maxDPSI_b+0.005,["Max =", num2str(maxDPSI_b)],'color',...
'red','fontsize',14)
text (rowMinbtValue,minDPSI_b-0.005,["Min =", num2str(minDPSI_b)],'color',...
'red','fontsize',14)
 
 
ax3= subplot (425); plot (ct, DPSI_c,'b');
title (sprintf ("%s%s%s",e1,preferedAssistanceTag,cycleE1));
xlabel ('time (seconds)'); ylabel ('DPSI'); 
ylim (ax3, [(minDPSI_c-0.009) (maxDPSI_c+0.009)]);
hold on;
plot([0,25],[maxDPSI_c,maxDPSI_c],"--b")
plot([0,25],[minDPSI_c,minDPSI_c],"--b")
plot([0,25],[DPSI_cMEAN,DPSI_cMEAN],"c")
text (rowMaxctValue,maxDPSI_c+0.005,["Max =", num2str(maxDPSI_c)],'color',...
'red','fontsize',14)
text (rowMinctValue,minDPSI_c-0.005,["Min =", num2str(minDPSI_c)],'color',...
'red','fontsize',14)
 
ax4= subplot (427); plot (dt, DPSI_d,'b');
title (sprintf ("%s%s%s",e1,noExoTag,cycleE1));
xlabel ('time (seconds)'); ylabel ('DPSI'); 
ylim (ax4, [(minDPSI_d-0.009) (maxDPSI_d+0.009)]);
hold on;
plot([0,25],[maxDPSI_d,maxDPSI_d],"--b")
plot([0,25],[minDPSI_d,minDPSI_d],"--b")
plot([0,25],[DPSI_dMEAN,DPSI_dMEAN],"c")
text (rowMaxdtValue,maxDPSI_d+0.005,["Max =", num2str(maxDPSI_d)],'color',...
'red','fontsize',14)
text (rowMindtValue,minDPSI_d-0.005,["Min =", num2str(minDPSI_d)],'color',...
'red','fontsize',14)
 
ax5= subplot (422); plot (et, DPSI_e,'r');
title (sprintf ("%s%s%s",e2,lowAssistanceTag,cycleE2));
xlabel ('time (seconds)'); ylabel ('DPSI'); 
ylim (ax5, [(minDPSI_e-0.009) (maxDPSI_e+0.009)]);
hold on;
plot([0,25],[maxDPSI_e,maxDPSI_e],"--r")
plot([0,25],[minDPSI_e,minDPSI_e],"--r")
plot([0,25],[DPSI_eMEAN,DPSI_eMEAN],"m")
text (rowMaxetValue,maxDPSI_e+0.005,["Max =", num2str(maxDPSI_e)],'color',...
'blue','fontsize',14)
text (rowMinetValue,minDPSI_e-0.005,["Min =", num2str(minDPSI_e)],'color',...
'blue','fontsize',14)
a2 = gca ();
p2 = get (gca, "position");
 
 
ax6= subplot (424); plot (ft, DPSI_f,'r');
title (sprintf ("%s%s%s",e2,mediumAssistanceTag,cycleE2));
xlabel ('time (seconds)'); ylabel ('DPSI'); 
ylim (ax6, [(minDPSI_f-0.009) (maxDPSI_f+0.009)]);
hold on;
plot([0,25],[maxDPSI_f,maxDPSI_f],"--r")
plot([0,25],[minDPSI_f,minDPSI_f],"--r")
plot([0,25],[DPSI_fMEAN,DPSI_fMEAN],"m")
text (rowMaxftValue,maxDPSI_f+0.005,["Max =", num2str(maxDPSI_f)],'color',...
'blue','fontsize',14)
text (rowMinftValue,minDPSI_f-0.005,["Min =", num2str(minDPSI_f)],'color',...
'blue','fontsize',14)
 
 
ax7= subplot (426); plot (gt, DPSI_g,'r');
title (sprintf ("%s%s%s",e2,preferedAssistanceTag,cycleE2));
xlabel ('time (seconds)'); ylabel ('DPSI'); 
ylim (ax7, [(minDPSI_g-0.009) (maxDPSI_g+0.009)]);
hold on;
plot([0,25],[maxDPSI_g,maxDPSI_g],"--r")
plot([0,25],[minDPSI_g,minDPSI_g],"--r")
plot([0,25],[DPSI_gMEAN,DPSI_gMEAN],"m")
text (rowMaxatValue,maxDPSI_g+0.005,["Max =", num2str(maxDPSI_g)],'color',...
'blue','fontsize',14)
text (rowMinatValue,minDPSI_g-0.005,["Min =", num2str(minDPSI_g)],'color',...
'blue','fontsize',14)
 
 
ax8= subplot (428); plot (ht, DPSI_h,'r');
title (sprintf ("%s%s%s",e2,noExoTag,cycleE2));
xlabel ('time (seconds)'); ylabel ('DPSI'); 
ylim (ax8, [(minDPSI_h-0.009) (maxDPSI_h+0.009)]);
hold on;
plot([0,25],[maxDPSI_h,maxDPSI_h],"--r")
plot([0,25],[minDPSI_h,minDPSI_h],"--r")
plot([0,25],[DPSI_hMEAN,DPSI_hMEAN],"m")
text (rowMaxhtValue,maxDPSI_h+0.005,["Max =", num2str(maxDPSI_h)],'color',...
'blue','fontsize',14)
text (rowMinhtValue,minDPSI_h-0.005,["Min =", num2str(minDPSI_h)],'color',...
'blue','fontsize',14)
 
p3 = [p1(1), p1(2)+0.02, p2(1)-p1(1)+p2(3), p2(2)-p1(2)+p2(4)+0.02];
axes ("position", p3)
axis off
title ("All scenarios, same cycle comparison.",'fontsize',16)
 
%                                                                         %
% ----------------------------------------------------------------------- %

