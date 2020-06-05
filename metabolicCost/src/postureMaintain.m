function [res] = postureMaintain (bw, subOption)
  switch (subOption);   
      case (1)  
      printf('\n\nSelected option:\n\n')
      printf('1a) Sitting.\n\n');
      caseID=('1a) Sitting');
      res=0.023*bw;
      inputArray = ('[BW]');
      inputValues=[bw];
      printf('\n\nThe result is %0.2f Kcal/min.',res)
      case (2)
      printf('\n\nSelected option:\n\n')
      printf('1b) Standing.\n\n');
      caseID=('1b) Standing');
      res=0.024*bw;
      inputArray = ('[BW]');
      inputValues=[bw];
      fprintf('\n\nThe result is %0.2f Kcal/min. ',res)    
      case (3)
      printf('\n\nSelected option:\n\n')
      printf('1c) Standing, bent position.\n\n');
      caseID=('1c) Standing, bent position'); 
      res=0.028*bw;
      inputArray = ('[BW]');
      inputValues=[bw];
      fprintf('\n\nThe result is %0.2f Kcal/min. ',res)            
      otherwise 
      fprintf('\n\nYou did not select any case. ')  
endswitch
endfunction