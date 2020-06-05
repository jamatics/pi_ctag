function [res] = otherTask (BW,S,L,h1,h2,F,X,V,G,t,subOption)
  switch (subOption);   
    case (1)
    clc;
    printf('\n\nSelected option:\n\n')
    printf('2a) Stoop lift.\n\n');
    caseID=('2a) Stoop lift'); 
    res=10^-2*[0.325*BW*(0.81-h1)+(1.41*L+0.76*S*L)*(h2-h1)];
    printf('\n\nThe result is %0.4f (Kcal/lift) ',res);
    
    case (2)
    clc;
    printf('Selected option:\n\n')
    printf('2b) Squat lift.\n\n');
    caseID=('2b) Squat lift');
    res=10^-2*[0.514*BW*(0.81-h1)+(2.19*L+0.62*S*L)*(h2-h1)];
    printf('\n\nThe result is %0.4f (Kcal/lift) ',res);
    
    case (3)
    clc;
    printf('Selected option:\n\n')
    printf('2c) One hand lift.\n\n')
    caseID=('2c) One hand lift');
    res=10^-2*[0.352*BW*(0.81-h1)+3.03*L*(h2-h1)];
    printf('\n\nThe result is %0.4f (Kcal/lift) ',res) 

    case (4)
    clc;
    printf('Selected option:\n\n')
    printf('2d) Arm lift.\n\n')
    caseID=('2d) Arm lift'); 
    res=10^-2*[0.062*BW*(h2-0.81)+(3.19*L-0.52*S*L)*(h2-h1)];
    printf('\n\nThe result is %0.4f (Kcal/lift) ',res);
    
    case (5)
    clc;
    printf('Selected option:')
    printf('2e) Stoop lower.\n\n')
    caseID=('2e) Stoop lower');      
    res=10^-2*[0.268*BW*(0.81-h1)+0.675*L*(h2-h1)+5.22*S*(0.81-h1)];
    printf('\n\nThe result is %0.4f (Kcal/lower) ',res);
    
    case (6)
    clc;
    printf('Selected option:\n\n')
    printf('2f) Squat lower.\n\n')
    caseID=('2f) Squat lower'); 
    res=10^-2*[0.511*BW*(0.81-h1)+0.701*L*(h2-h1)];
    printf('\n\nThe result is %0.4f (Kcal/lower) ',res);
    
    case (7)
    clc;
    printf('Selected option:\n\n')
    printf('2g) Arm lower.\n\n');  
    caseID=('2g) Arm lower');
    res=10^-2*[0.093*BW*(h2-0.81)+(1.02*L+0.37*S*L)*(h2-h1)];
    printf('\n\nThe result is %0.4f (Kcal/lower) ',res);
    
    case (8)
    clc;
    printf('Selected option:\n\n')
    printf('2h) Walking.\n\n')  
    caseID=('2h) Walking');
    res=10^-2*(51+(2.54*BW)*(V^2)+(0.379*BW*G*V))*t;
    printf('\n\nThe result is %0.4f (Kcal) ',res);
    
    case (9)
    clc;
    printf('Selected option:\n\n')
    printf('2i) Carrying, loads held at arms length at sides (1 or 2 hands).\n')
    caseID=('2i) Carrying, loads held at arms length at sides (1 or 2 hands)');
    res=10^-2*[80+2.43*BW*(V^2)+4.63*L*(V^2)+4.62*L+0.379*(L+BW)*G*V]*t;
    printf('\n\nThe result is %0.4f (Kcal) ',res);
    
    case (10)
    clc;
    printf('Selected option:\n\n')
    printf('2j) Carrying, loads held against thighs or against waist.\n\n');
    caseID=('2j) Carrying, loads held against thighs or against waist');
    res=10^-2*[68+2.54*BW*V^2+4.08*L*V^2+11.4*L+0.379*(L+BW)*G*V]*t;
    printf('\n\nThe result is %0.4f (Kcal) ',res);
    
    case (11)
    clc;
    printf('Selected option:\n\n')
    printf('2k) Holding, at arms length, against thighs or at sides(2 hands).');
    caseID=('2k) Holding, at arms length, against thighs or at sides(2 hands)');
    res=(0.037*L)*t;
    printf('\n\nThe result is %0.4f (Kcal) ',res);
    
    case (12)
    clc;
    printf('Selected option:\n\n')
    printf('2l) Holding, against waist.');
    caseID=('2l) Holding, against waist');
    res=(0.062*L)*t;
    printf('\n\nThe result is %0.4f (Kcal) ',res);
    
    case (13)
    clc;
    printf('Selected option:\n\n\n\n')
    printf('2m) Holding, at arms length in one hand.');  
    caseID=('2m) Holding, at arms length in one hand');
    res=(0.088*L)*t;
    printf('\n\nThe result is %0.4f (Kcal) ',res);

    case (14)
    clc;
    printf('Selected option:\n\n\n\n')
    printf('2n) Pushing/pulling, at bench height (0.8 meters).'); 
    caseID=('2n) Pushing/pulling, at bench height (0.8 meters)');
    res=10^-2*X*(0.112*BW+1.15*F+0.505*S*F);
    printf('\n\nThe result is %0.4f (Kcal/push) ',res);
    
    case (15)
    clc;
    printf('Selected option:\n\n')
    printf('2o) Pushing/pulling, at 1.5 meters height.'); 
    caseID=('2o) Pushing/pulling, at 1.5 meters height');
    res=X*(0.086+(0.036*F));
    printf('\n\nThe result is %0.4f (Kcal/push) ',res);
    
    case (16)
    clc;
    printf('Selected option:\n\n')
    printf('2p) Lateral movement of arms of 180 degrees, 2 hands.'); 
    caseID=('2p) Lateral movement of arms of 180 degrees, 2 hands');
    res=10^-2*(0.11*BW+0.726*L);
    printf('\n\nThe result is %0.4f (Kcal/lateral movement of arms) ',res);
    
    case (17)
    clc;
    printf('Selected option:\n\n')
    printf('2q) Lateral movement of arms of 180 degrees, 1 hand.'); 
    caseID=('2q) Lateral movement of arms of 180 degrees, 1 hand');
    res=10^-2*(0.097*BW+0.946*L);
    printf('\n\nThe result is %0.4f (Kcal/lateral movement of arm) ',res);
    
    case (18)
    clc;
    printf('Selected option:\n\n')
    printf('2r) 90 degrees arms lateral movement, standing, 1 or 2 hands.');
    caseID=('2r) 90 degrees arms lateral movement, standing, 1 or 2 hands');
    res=10^-2*(3.31+(0.629*L)+(0.143*S)*L);
    printf('\n\nThe result is %0.4f (Kcal/lateral movement of arms) ',res);
    
    case (19)
    clc;
    printf('Selected option:\n\n')
    printf('2s) 90 degrees arms lateral movement, sitting, 2 hands.');
    caseID=('2s) 90 degrees arms lateral movement, sitting, 2 hands');
    res=10^-2*(3.5+(0.682*L)+(0.321*S)*L);
    printf('\n\nThe result is %0.4f (Kcal/lateral movement of arms) ',res);
    
    case (20)
    clc;
    printf('Selected option:\n\n')
    printf('2t) 90 degrees arms lateral movement, sitting, 1 hand.');
    caseID=('2t) 90 degrees arms lateral movement, sitting, 1 hand');
    res=10^-2*(2.54+(1.1*L)+(0.248*S)*L);
    printf('\n\nThe result is %0.4f (Kcal/lateral movement of arm.) ',res);
    
    case (21)
    clc;
    printf('Selected option:\n\n') 
    printf('2u) Forward movement of arms, standing, 1 or 2 hands.');
    caseID=('2u) Forward movement of arms, standing, 1 or 2 hands');
    res=10^-2*X*(3.57+(1.23*L));
    printf('\n\nThe result is %0.4f (Kcal/movement) ',res);
    
    case (22)
    clc;
    printf('Selected option:\n\n')
    printf('2v) Forward movement of arms, sitting, 1 or 2 hands.');
    caseID=('2v) Forward movement of arms, sitting, 1 or 2 hands');
    res=10^-2*X*(6.3+(2.71*L));
    printf('\n\nThe result is %0.4f (Kcal/movement of arms) ',res);  
endswitch
endfunction