function R_check2gronud = get_check2gronud_Rotation(camera)
%GET_CHECK2GRONUD_ROTATION Summary of this function goes here
%   Detailed explanation goes here
switch camera
    case 'front'
        R_check2gronud = [0 -1 0; 1 0 0; 0 0 1];
    case 'left'
        R_check2gronud = [0 -1 0; 1 0 0; 0 0 1];

    case 'right'
        R_check2gronud = [0 -1 0; 1 0 0; 0 0 1];
    case 'rear'
        R_check2gronud = [0 -1 0; 1 0 0; 0 0 1];
    otherwise
        disp("ERROR")
end
end

