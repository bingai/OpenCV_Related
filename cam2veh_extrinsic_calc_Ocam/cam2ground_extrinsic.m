clc; clear;close all;


% %% ##### Front Front Front Front Front Front
% % Front deg0pos1
% H_check2cam = [
%     0.0173    0.2162   -0.9762  315.3266
%    -0.9999    0.0034   -0.0170  303.9517
%    -0.0003    0.9763    0.2163 -895.1498
%          0         0         0    1.0000
% ]
% 
% x_A = 4.5259625;
% y_A = -0.4016375;
% theta =0;
% 
% % % Front deg45pos2
% % H_check2cam = 1.0e+03*[    
% %     0.0002    0.0001   -0.0010    0.2434
% %    -0.0007    0.0007         0    0.0274
% %     0.0007    0.0007    0.0002   -1.2122
% %          0         0         0    0.0010
% % ]
% % 
% % x_A = 5.045075;
% % y_A = -0.4016375;
% % theta = pi/4;

% %% ##### Left Left Left Left
% % % Left deg0pos1
% % H_check2cam = 1.0e+03*[
% %     0.0001 0.0007 -0.0007 -0.1007 
% %     -0.0010 0.0001 -0.0000 -0.1590 
% %     0.0001 0.0007 0.0007 -1.7705 
% %     0 0 0 0.0010 
% % ]
% % 
% % x_A = 2.441575;
% % y_A = 1.9986625;
% % theta = pi/2; %% left + rotate 0 deg
% 
% Left deg45pos1
H_check2cam = 1.0e+03*[
    0.0005    0.0004   -0.0007    0.0631
   -0.0006    0.0008         0   -0.4242
    0.0006    0.0004    0.0007   -1.5731
         0         0         0    0.0010
]

x_A = 2.441575;
y_A = 1.9986625;
theta = pi/2 + pi/4; %% left + rotate 45 deg

% % ##### Rear Rear Rear Rear
% % Rear deg0pos1
% H_check2cam = 1.0e+03*[
%     0.0001 0.0007 -0.0007 -0.1007 
%     -0.0010 0.0001 -0.0000 -0.1590 
%     0.0001 0.0007 0.0007 -1.7705 
%     0 0 0 0.0010 
% ]
% 
% x_A = 2.441575;
% y_A = 1.9986625;
% theta = pi/2; %% left + rotate 0 deg

% t_checkOrigin_at_A = get_checkOrigin_at_A(theta, 'front');
t_checkOrigin_at_A = get_checkOrigin_at_A(theta, 'left');

t_check2ground = [x_A; y_A; 0] + t_checkOrigin_at_A

% % t_check2gronud = [2.3310; 2.4531; 0];  //Bing left deg0pos1
% % t_check2gronud = [2.3310; 2.4531; 0];  //Bing left deg45pos1


R_check2gronud = [0 -1 0; 1 0 0; 0 0 1];
R_rotation = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1]

H_check2ground = [R_rotation*R_check2gronud, 1000*t_check2ground]
H_check2ground(4,:)=[0 0 0 1];



H_cam2check = inv(H_check2cam);
H_cam2ground = H_check2ground * H_cam2check

R_cam2ground = H_cam2ground(1:3,1:3)
t_cam2ground = H_cam2ground(1:3,4)


