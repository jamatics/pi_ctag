%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% store_vector.m
%
% Store a vector into yaml file
%
% Anthony Remazeilles
% Copyright Tecnalia 2020
% Beerware license.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function is_ok = store_vector(filename, data)

    file_id = fopen(filename, "w");
    fprintf(file_id, "type: \'vector\'\n");
    value_str = "value: [";
    for i = 1:size(data)(2)
        value_str = sprintf("%s%.5f", value_str, data(i));
        if (i != size(data)(2))
            value_str = sprintf("%s, ", value_str);
        endif
    endfor
    value_str = sprintf("%s]\n", value_str);
    fprintf(file_id, value_str);
    fclose(file_id);
    is_ok = true;
end