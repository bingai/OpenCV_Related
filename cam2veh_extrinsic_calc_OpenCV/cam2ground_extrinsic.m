clc; clear;close all;

% Front Front
% %Front deg0 Position1
% camera = 'front'
% position = 'position1';
% theta = 0;

% % %Front deg45 Position1
% camera = 'front'
% position = 'position2';
% theta = pi/4;

%% Left Left
% %left deg0 Position1
% camera = 'left';
% position = 'position1';
% theta = 0;

% %left deg45 Position1
% camera = 'left';
% position = 'position1';
% theta = pi/4;

% % %left deg90 Position1
% camera = 'left';
% position = 'position1';
% theta = pi/2;

% % %left deg180 Position1
% camera = 'left';
% position = 'position1';
% theta = pi;

% % %left deg180 Position1
% camera = 'left';
% position = 'position1';
% theta = pi+pi/4;

%% Right Right Right
% %%Right deg45 Position1
% camera = 'right';
% position = 'position1';
% theta = pi/4;

% %%Right deg90 Position1
% camera = 'right';
% position = 'position1';
% theta = pi/2;

% %%Right deg135 Position1
% camera = 'right';
% position = 'position1';
% theta = 3*pi/4;

% %%Right deg135 Position1
% camera = 'right';
% position = 'position1';
% theta = pi;


%% Rear Rear Rear
%%Rear deg45 Position1
% camera = 'rear';
% position = 'position1';
% theta = pi/4;

%%Rear deg90 Position1
% camera = 'rear';
% position = 'position1';
% theta = pi/2;

%%Rear deg135 Position1
% camera = 'rear';
% position = 'position1';
% theta = 3*pi/4;
% 
% %%Rear deg135 Position1
camera = 'rear';
position = 'position1';
theta = pi;


%check2ground
H_check2ground = get_check2ground_extrinsic(theta,position,camera)
% check2cam 
H_check2cam = get_check2cam_extrinsic(theta,camera);

H_cam2check = inv(H_check2cam);
H_cam2ground = H_check2ground * H_cam2check;

R_cam2ground = H_cam2ground(1:3,1:3)
t_cam2ground = H_cam2ground(1:3,4)



