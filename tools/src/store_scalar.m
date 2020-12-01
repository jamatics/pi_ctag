%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% store_scalar.m
%
% Store a scalar into yaml file
%
% Anthony Remazeilles & Jawad Masood
% Copyright Tecnalia CTAG 2020 (We may discuss this)
% Beerware license.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function is_ok = store_scalar(filename, data)

    file_id = fopen(filename, "w");
    fprintf(file_id, "type: \'scalar\'\n");
    value_str = "value: ";
    for i = 1:size(data)(2)
        value_str = sprintf("%s%.5f", value_str, data(i));
        if (i != size(data)(2))
            value_str = sprintf("%s, ", value_str);
        endif
    endfor
    value_str = sprintf("%s\n", value_str);
    fprintf(file_id, value_str);
    fclose(file_id);
    is_ok = true;
end