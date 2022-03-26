function t_checkOrigin_at_A = get_checkOrigin_at_A(theta, camera)
%GET_TRANSLATION Summary of this function goes here
%   Detailed explanation goes here
sqare_size = 0.07;
delta_w = 0.04060063;
delta_h = 0.03440049;
% R_rotation = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1]
switch camera
    case 'front'
         tx = delta_h + 6 * sqare_size;
         ty = delta_w + sqare_size;
         tz = 0;
         R_rotation = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1]
         t_checkOrigin_at_A = R_rotation * [tx; ty; 0];

    case 'left'
         tx = delta_h + 6 * sqare_size;
         ty = delta_w + sqare_size;
         tz = 0;
         R_rotation = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1]
         t_checkOrigin_at_A = R_rotation * [tx; ty; 0];
    case 'right'
         tx = delta_h + 6 * sqare_size;
         ty = delta_w + sqare_size;
         tz = 0;
         t_checkOrigin_at_A = R_rotation * [tx; ty; 0];

    case 'rear'
         tx = delta_h + 6 * sqare_size;
         ty = delta_w + sqare_size;
         tz = 0;
         t_checkOrigin_at_A = R_rotation * [tx; ty; 0];

    otherwise
        disp("ERROR")
end

end




