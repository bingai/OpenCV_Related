function H_check2ground = get_check2ground_extrinsic(theta, position, camera)
%GET_CHECK2GROUND_EXTRINSIC Summary of this function goes here
%   Detailed explanation goes here
%   Input  theta: 0, pi/4, pi/2, pi
%   Input  position: position1, position2
%   Input  camera: front, left, right, rear
%   Output: H_check2ground: Homogeneous matrix from checkerboard to ground
switch camera
    case 'front'
        if position == "position1"
            [checkOrigin_at_A, R_rotation, R_check2gronud] = get_checkOrigin_at_A(theta, 'front');
            t_check2ground = [4.5259625; -0.4016375; 0] + checkOrigin_at_A;
        elseif position == "position2"
            [checkOrigin_at_A, R_rotation, R_check2gronud] = get_checkOrigin_at_A(theta, 'front');
            t_check2ground = [5.045075; -0.4016375; 0] + checkOrigin_at_A;
        else
            disp('ERROR: front camere position is missing!')
        end

    case 'left'
        if position == "position1"
            [checkOrigin_at_A, R_rotation, R_check2gronud] = get_checkOrigin_at_A(theta+pi/2, 'left')
            t_check2ground = [2.441575; 1.9986625; 0] + checkOrigin_at_A
        else
            disp('ERROR: front camere position is missing!')
        end

    case 'right'
        if position == "position1"
            [checkOrigin_at_A, R_rotation, R_check2gronud] = get_checkOrigin_at_A(theta+3*pi/2, 'right')
            t_check2ground = [2.4431625; -2.187575; 0] + checkOrigin_at_A
        else
            disp('ERROR: front camere position is missing!')
        end

    case 'rear'
        if position == "position1"
            [checkOrigin_at_A, R_rotation, R_check2gronud] = get_checkOrigin_at_A(theta+pi, 'rear')
            t_check2ground = [-2.028825; -0.08493125; 0] + checkOrigin_at_A
        else
            disp('ERROR: front camere position is missing!')
        end
    otherwise
        disp("ERROR: wrong camera info!")
end

%1000*t_check2ground is because the Opencv gives out translaion in millimeter
H_check2ground = [R_rotation*R_check2gronud, 1000*t_check2ground];
H_check2ground(4,:)=[0 0 0 1];
end



function [t_checkOrigin_at_A, R_rotation, R_check2ground] = get_checkOrigin_at_A(angle, camera)
%GET_TRANSLATION Summary of this function goes here
%   Detailed explanation goes here
%   Input rotation: 0, pi/4, pi/2, pi
%   Input camera: front, left, rear, right
%   Output t_checkOrigin_at_A: checkboard origin at point A
sqare_size = 0.07;
delta_w = 0.04060063;
delta_h = 0.03440049;
% R_rotation = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1]
switch camera
    case 'front'
        % Checkerboad origin @ Top left
        tx = delta_h + 6 * sqare_size;
        ty = delta_w + 8 * sqare_size;
        %Rotation with Z axis
        R_rotation = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1]
        t_checkOrigin_at_A = R_rotation * [tx; ty; 0];
        R_check2ground = [0 -1 0; -1 0 0;0 0 -1];

    case 'left'
        % Checkerboad origin @ Top left
        if angle == pi/2 || angle == 3*pi/4
            tx = delta_h + 6 * sqare_size;
            ty = delta_w + 8 * sqare_size;
            %Rotation with Z axis
            R_rotation = [cos(angle) -sin(angle) 0; sin(angle) cos(angle) 0; 0 0 1]
            R_check2ground = [0 -1 0; -1 0 0;0 0 -1];

            % Checkerboad origin @ Top right
        elseif angle == pi || angle == 3*pi/2 || angle == 7*pi/4
            tx = -(delta_w + sqare_size);
            ty = -(delta_h + sqare_size);
            R_rotation = [cos(angle-pi/2) -sin(angle-pi/2) 0; sin(angle-pi/2) cos(angle-pi/2) 0; 0 0 1]
            R_check2ground = [-1 0 0;0 1 0;0 0 -1];

        else
            disp("ERROR: wrong angle for left camera")
        end
        t_checkOrigin_at_A = R_rotation * [tx; ty; 0];

    case 'right'
        % Checkerboad origin @ Top left
        if angle == 7*pi/4 || angle == 2*pi
            tx = (delta_h + 6 * sqare_size);
            ty = (delta_w + 8 * sqare_size);
            %Rotation with Z axis
            R_rotation = [cos(angle) -sin(angle) 0; sin(angle) cos(angle) 0; 0 0 1]
            R_check2ground = [0 -1 0; -1 0 0;0 0 -1];

            % Checkerboad origin @ bottom right
        elseif angle == 9*pi/4 || angle == 5*pi/2
            tx = (delta_w + sqare_size);
            ty = -(delta_h + sqare_size);
            R_rotation = [cos(angle-3*pi/2) -sin(angle-3*pi/2) 0; sin(angle-3*pi/2) cos(angle-3*pi/2) 0; 0 0 1]
            R_check2ground = [1 0 0;0 -1 0;0 0 -1];

        else
            disp("ERROR: wrong angle for right camera")
        end
        t_checkOrigin_at_A = R_rotation * [tx; ty; 0];

    case 'rear'
        % Checkerboad origin @ Top left
        if angle == 5*pi/4 || angle == 3*pi/2
            tx = delta_h + 6 * sqare_size;
            ty = delta_w + 8 * sqare_size;
            %Rotation with Z axis
            R_rotation = [cos(angle) -sin(angle) 0; sin(angle) cos(angle) 0; 0 0 1]
            R_check2ground = [0 -1 0; -1 0 0;0 0 -1];

            % Checkerboad origin @ Top right
        elseif angle == 7*pi/4 || angle == 2*pi
            tx = -(delta_w + sqare_size);
            ty = -(delta_h + sqare_size);
            R_rotation = [cos(angle-pi/2) -sin(angle-pi/2) 0; sin(angle-pi/2) cos(angle-pi/2) 0; 0 0 1]
            R_check2ground = [-1 0 0;0 1 0;0 0 -1];
        else
            disp("ERROR: wrong angle for the rear camera")
        end
        t_checkOrigin_at_A = R_rotation * [tx; ty; 0];
    otherwise
        disp("ERROR")
end
end