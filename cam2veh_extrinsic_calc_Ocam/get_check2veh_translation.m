function t_check2veh = get_check2veh_translation(x,y, camera)
%GET_TRANSLATION Summary of this function goes here
%   Detailed explanation goes here
sqare_size = 0.07;
delta_w = 0.04060063;
delta_h = 0.03440049;
switch camera
    case 'front'
         tx = x + delta_h + 7 * sqare_size;
         ty = y + delta_w + 9 * sqare_size;

    case 'rear'
         tx = x + delta_h + 7 * sqare_size;
         ty = y + delta_w + 9 * sqare_size;

    case 'left'
         tx = x + delta_h + 7 * sqare_size;
         ty = y + delta_w + 9 * sqare_size;

    case 'right'
         tx = x + delta_h + 7 * sqare_size;
         ty = y + delta_w + 9 * sqare_size;

    otherwise
        disp("ERROR")
end
        t_check2veh = [tx; ty; -0.35];

end


