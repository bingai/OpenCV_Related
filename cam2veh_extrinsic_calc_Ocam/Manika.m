clc;
clear;
close all;

%front

%calculating H; transfomation wrt current frame (checkerboard)
transY = [1,0,0,0; 0,1,0,1320.8;0,0,1,0;0,0,0,1];   
transX = [1,0,0,-4640.58;0,1,0,0;0,0,1,0;0,0,0,1];
H = transY*transX;

%loading H; checkerboard wrt camera 
load('Omni_Calib_Results_front.mat');
mat = calib_data.RRfin;
Hcb = [mat(:,1), mat(:,2), cross(mat(:,1),mat(:,2)), mat(:,3)];
Hcb(4,:) = [0, 0, 0, 1];

%transformation of vehicle frame wrt camera
Hcv = Hcb*H;

%left

%calculating H; transfomation wrt current frame (checkerboard)
transY = [1,0,0,0; 0,1,0,3484.88;0,0,1,0;0,0,0,1];
transX = [1,0,0,-1625.6;0,1,0,0;0,0,1,0;0,0,0,1];
rotZ = [0,1,0,0;-1,0,0,0;0,0,1,0;0,0,0,1]; %rotation of -90deg along z axis
H = transY*transX*rotZ

%loading H; checkerboard wrt camera 
load('Omni_Calib_Results_left_1.06.mat');
mat = calib_data.RRfin;
Hcb = [mat(:,1), mat(:,2), cross(mat(:,1),mat(:,2)), mat(:,3)];
Hcb(4,:) = [0, 0, 0, 1]


%transformation of vehicle frame wrt camera
Hcv = Hcb*H

%right

%calculating H; transfomation wrt current frame (checkerboard)
transY = [1,0,0,0; 0,1,0,-965.2;0,0,1,0;0,0,0,1];
transX = [1,0,0,-1574.8;0,1,0,0;0,0,1,0;0,0,0,1];
rotZ = [0,-1,0,0;1,0,0,0;0,0,1,0;0,0,0,1]; %rot of 90deg along z axis
H = transY*transX*rotZ;

%loading H; checkerboard wrt camera 
load('Omni_Calib_Results_right_1.23.mat');
mat = calib_data.RRfin;
Hcb = [mat(:,1), mat(:,2), cross(mat(:,1),mat(:,2)), mat(:,3)];
Hcb(4,:) = [0, 0, 0, 1];

%transformation of vehicle frame wrt camera
Hcv = Hcb*H;

%rear

%calculating H; transfomation wrt current frame (checkerboard)
transY = [1,0,0,0; 0,1,0,-1295.4;0,0,1,0;0,0,0,1];
transX = [1,0,0,1498.6;0,1,0,0;0,0,1,0;0,0,0,1];
rotZ180 = [-1,0,0,0;0,-1,0,0;0,0,1,0;0,0,0,1];
H = rotZ180*transY*transX;

%loading H; checkerboard wrt camera 
load('Omni_Calib_Results_rear.mat');
mat = calib_data.RRfin;
Hcb = [mat(:,1), mat(:,2), cross(mat(:,1),mat(:,2)), mat(:,3)];
Hcb(4,:) = [0, 0, 0, 1];

%transformation of vehicle frame wrt camera
Hcv = Hcb*H;
