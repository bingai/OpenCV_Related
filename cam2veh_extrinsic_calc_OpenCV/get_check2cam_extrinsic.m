function H_check2cam = get_check2cam_extrinsic(rotation,camera)
%GET_CHECK2CAM_EXTRINSIC Summary of this function goes here
%   Detailed explanation goes here
%     Input rotation: 0, pi/4, pi/2, pi
%     Inptut camers: front, left, right, rear
%     Output H_check2cam: Homogeneous matrix from checkerboard to camera

switch camera
    case 'front'
        if rotation==0
            R_check2cam_vec = [-1.3392297288996933e+00 6.3313952585342358e-03 -2.0479709571123050e-02];
            t_check2cam =[-1.9166473873814530e+02; 4.0231396268504329e+02; 8.7167065855950511e+02];
        elseif rotation == pi/4
            R_check2cam_vec = [-1.2925653572916782e+00 -5.0679709529471528e-01 -6.5747359962947260e-01];
            t_check2cam = [-3.2615974845934653e+02; 3.3711506243878500e+02; 8.9109216723398913e+02];
        else
            disp("ERROR: can't load front camera extrinsic");
        end

    case 'left'
        if rotation==0
            R_check2cam_vec = [-1.0018478038442269e+00 -7.2108347799025405e-02 -1.0478586501583138e-01];
            t_check2cam =[-6.9288631936617503e+02; 1.7368767984600984e+02; 1.8067160635061223e+03];
        elseif rotation == pi/4
            R_check2cam_vec = [-9.1677239556200507e-01 -4.6820228516917606e-01 -8.4860899690954994e-01];
            t_check2cam = [-7.6017027798984191e+02; 4.9201478934572287e+02; 1.3083893442325132e+03];
        elseif rotation == pi/2
            R_check2cam_vec = [-8.1515596757716058e-01 7.0377659770833290e-01 1.3460157177154022e+00];
            t_check2cam = [-1.3203857971416878e+02; 4.4867639709330837e+02; 1.3881705492460662e+03];
        elseif rotation == pi
            R_check2cam_vec = [-9.9153181097013676e-01 -7.8921111494135540e-02 -7.7561749508878924e-02];
            t_check2cam = [7.8415354214189549e+01; 4.3121259698044412e+02; 1.4022701235382876e+03];
        elseif rotation == 5*pi/4
            R_check2cam_vec = [-9.0466693165528056e-01 -4.9943893355516339e-01 -8.4519493729839379e-01];
            t_check2cam = [1.0764293333332786e+02; 3.6615690691775455e+02; 1.4978704102942156e+03];
        else
            disp("ERROR: can't load left camera extrinsic");
        end
    case 'right'
        if rotation==pi/4
            R_check2cam_vec = [-9.2161154733020501e-01 -3.5449402188393914e-01 -7.3768158385019378e-01];
            t_check2cam =[-7.3944834768946123e+02; 3.5528540064365541e+02; 1.5194011375227772e+03];
        elseif rotation == pi/2
            R_check2cam_vec = [-7.8730167541898610e-01 -6.8863013770309889e-01 -1.3934422208099542e+00];
            t_check2cam =[-4.8662135639991237e+02; 6.1807388564511336e+02; 1.1384114685014463e+03];
        elseif rotation == 3*pi/4
            R_check2cam_vec = [-9.0094224318539040e-01 3.9650308785960064e-01 7.3166300924141137e-01];
            t_check2cam =[6.3612532468500582e+00; 3.6795392037773934e+02; 1.4650668689431604e+03];
        elseif rotation == pi
            R_check2cam_vec = [-9.6130212922290081e-01 4.1834412587308321e-02 5.0965077112820473e-02];
            t_check2cam =[1.0951872589523610e+02; 3.4156601923936171e+02; 1.5023091760396405e+03];
        else
            disp("ERROR: can't load left camera extrinsic");
        end

    case 'rear'
        if rotation==pi/4
            R_check2cam_vec = [-8.2672863231870164e-01 -4.5029291743367000e-01 -8.9531362731097930e-01 ];
            t_check2cam =[-8.5565636048868862e+02; 4.2556511260450144e+01; 1.0126432325846462e+03];
        elseif rotation == pi/2
            R_check2cam_vec = [-6.9891194075201413e-01 -7.1643495060530216e-01 -1.4472555772568889e+00];
            t_check2cam =[-5.9433970784712244e+02; 2.6791164881166947e+02; 7.2998139362720610e+02];
        elseif rotation == 3*pi/4
            R_check2cam_vec = [-8.8069092697011997e-01 2.5459172230604254e-01 5.7331936037579745e-01];
            t_check2cam =[-1.1189329365345193e+02; -6.4514384158988438e+00; 1.0920182795990743e+03];
        elseif rotation == pi
           R_check2cam_vec = [-8.9838307427612263e-01 -2.3528558104823870e-02 1.2182970899020133e-03];
            t_check2cam =[-3.1981763684918931e+01; -3.1911633039735499e+01; 1.1266021803712733e+03];
        else
            disp("ERROR: can't load left camera extrinsic");
        end

    otherwise
        disp("ERROR: please input correct camera and rotation info");
end
R_check2cam = rotationVectorToMatrix(R_check2cam_vec)' %matlab gives R' instead of R;
H_check2cam = [R_check2cam t_check2cam]
H_check2cam(4,:) = [0 0 0 1];
end

