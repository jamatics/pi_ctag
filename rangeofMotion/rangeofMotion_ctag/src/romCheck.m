function [limit_position, counter, maxVal, minVal] = romCheck(header,angles,joint,lL,uL)
%counterflexion=0;
%counterextension=0;
counter = 0;  
  for i = 1:length(header)
  % -----------------   for r_hip_x --------------------- %
  if strcmp(header{1,i},joint)
    limit_position{1,1} = joint;
    formatSpec = '%s --> Exist in the column: %d\n';
    fprintf(formatSpec,joint,i);
    maxVal = max(angles(2:end,i));
    minVal = min(angles(2:end,i));
    medVal = median(angles(2:end,i));
    for j = 1:length(angles(:,i))
      if (angles(j,i) >= uL) 
        counter++;
        limit_position{counter++, 1} = angles(j,i);
      end
      counter = 0;
      if angles(j,i) <= lL
        counter++;
        limit_position{counter++,1} = angles(j,i);
      end
    end
    %counterflexion=0;
    %counterextension=0;
    %counter = 0;   
  end
end
endfunction
