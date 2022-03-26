clc; clear;close all;


% %% front
% 
% %%front 0deg_pos1
% % -1.3608113315835229e+00 5.1411863344804397e-03
% %     -1.6792547734497589e-02 -1.9004489792209594e+02
% %     3.3514480020364573e+02 9.0123890321757528e+02
% r_r_check2cam =[-1.3608113315835229e+00 5.1411863344804397e-03 -1.6792547734497589e-02];
% t_check2cam =[-1.9004489792209594e+02 3.3514480020364573e+02 9.0123890321757528e+02]';


% %front 45deg_pos2
% % -1.2936683321365192e+00 -5.0777196185397722e-01
% %     -6.5771725490245270e-01 -3.2650877579792825e+02
% %     3.3656738618307571e+02 8.8320081088447068e+02 
% r_r_check2cam =[-1.2948586313393771e+00 -5.0688629993584011e-01 -6.5681828204265147e-01];
% t_check2cam =[-3.2520179983476544e+02 3.3676708552841774e+02 8.8340084466303790e+02]';
% x_distance = 5.045075;
% y_distance = -0.4016375;
% theta = pi/4;



% % check2cam
% R_check2cam = rotationVectorToMatrix(r_r_check2cam)
% H_check2cam =[R_check2cam t_check2cam];
% H_check2cam(4,:) = [0 0 0 1];

H_check2cam = [
    0.0173    0.2162   -0.9762  315.3266
   -0.9999    0.0034   -0.0170  303.9517
   -0.0003    0.9763    0.2163 -895.1498
         0         0         0    1.0000
]

H_cam2check = inv(H_check2cam);


x_distance = 4.5259625;
y_distance = -0.4016375;
theta = 0;
% check2veh
t_check2veh = 1000*get_check2veh_translation(x_distance, y_distance, 'front')
R_check2veh = [0 0 1; -1 0 0; 0 -1 0];
R_theta = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1];
H_check2veh = R_theta*[R_check2veh t_check2veh];
H_check2veh(4,:) = [0 0 0 1];

H_cam2veh = H_check2veh * H_cam2check

R_cam2veh = H_cam2veh(1:3,1:3)
t_cam2veh = H_cam2veh(1:3,4)


