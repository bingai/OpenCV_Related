function H_check2cam = get_check2cam_extrinsic(rotation,camera)
%GET_CHECK2CAM_EXTRINSIC Summary of this function goes here
%   Detailed explanation goes here
%     Input rotation: 0, pi/4, pi/2, pi
%     Inptut camers: front, left, right, rear
%     Output H_check2cam: Homogeneous matrix from checkerboard to camera

switch camera
    case 'front'
        if rotation==0
            R_check2cam_vec = [-1.3562926801217636e+00 6.8281712712497727e-03 -1.6294826974188752e-02];
            t_check2cam = [-1.8858060506407895e+02; 3.3123171172339585e+02; 9.0305507012791634e+02]

        elseif rotation == pi/4
            R_check2cam_vec = [-1.2882486497807424e+00 -5.0612579738274333e-01 -6.5878877913838496e-01];
            t_check2cam = [-3.2722622891783857e+02; 3.3405612613375581e+02; 8.9198159923059836e+02];

        else
            disp("ERROR: can't load front camera extrinsic");
        end
    
    case 'left'
        if rotation==0
            R_check2cam_vec = [-8.7852890697250130e-01 -4.9488398131630744e-02 -8.8994548053888595e-02];
            t_check2cam =[-6.3138013037363305e+02; 3.0844519697138345e+01; 1.6651822951803967e+03];
        elseif rotation == pi/4
            R_check2cam_vec = [-8.1640760601650753e-01 -3.9980163650419143e-01 -8.4927715118793790e-01];
            t_check2cam = [-7.1219250648935497e+02; 4.0616978097260068e+02; 1.2111849423707019e+03];
        elseif rotation == pi/2
            R_check2cam_vec = [-7.0499892318112800e-01 6.4192406754945086e-01 1.3883550500180912e+00];
            t_check2cam = [-8.2869048633696480e+01; 3.5884922124127598e+02; 1.2727721261717647e+03];
        elseif rotation == pi
            R_check2cam_vec = [-8.7906716490360437e-01 -3.1038766724483476e-02 -7.3984341276541063e-02];
            t_check2cam = [1.2746653386529924e+02; 3.4214948083767757e+02; 1.2882404834072020e+03];
        elseif rotation == 5*pi/4
            R_check2cam_vec = [-8.1441625132814022e-01 -3.9781715325140760e-01 -8.5506541091223942e-01];
            t_check2cam = [1.6094086188135643e+02; 2.6613711487710486e+02; 1.3788675173590461e+03];
        else
            disp("ERROR: can't load left camera extrinsic");
        end
    case 'right'
        if rotation==pi/4
            R_check2cam_vec = [-8.4826039298810230e-01 -3.3683085195965839e-01 -7.4429880396093395e-01];
            t_check2cam =[-7.4025664508288128e+02; 2.7156384923926765e+02; 1.4371962584319822e+03];
        elseif rotation == pi/2
            R_check2cam_vec = [-7.2886561521020288e-01 -6.4297765269552132e-01 -1.4087505700520855e+00];
            t_check2cam =[-4.8669646093720456e+02; 5.6225700831643769e+02; 1.0790660038148669e+03];
        elseif rotation == 3*pi/4
            R_check2cam_vec = [-8.3651661732585025e-01 3.7117965281044940e-01 7.3977247565110915e-01];
            t_check2cam =[ 5.6607823216923219e+00; 2.9239250591790511e+02; 1.3922705572220523e+03];
        elseif rotation == pi
            R_check2cam_vec = [-8.9174286117502355e-01 5.0065774536502398e-02 4.8837525171343044e-02];
            t_check2cam =[1.0927761840476991e+02; 2.6351373819612076e+02; 1.4278434445983230e+03];
        else
            disp("ERROR: can't load left camera extrinsic");
        end

    case 'rear'
        if rotation==pi/4
            R_check2cam_vec = [-7.8747693378234829e-01 -4.3395785721014452e-01 -8.9776493193224483e-01];
            t_check2cam =[-8.4788779454378096e+02; 1.9775439298412365e+01; 9.7645329548923519e+02];
        elseif rotation == pi/2
            R_check2cam_vec = [-6.6812555200976753e-01 -6.8659739290046606e-01 -1.4537350560467368e+00];
            t_check2cam =[-5.8844666043151028e+02; 2.5749466198627164e+02; 7.0474795604481994e+02];
        elseif rotation == 3*pi/4
            R_check2cam_vec = [-8.4063428508241655e-01 2.4672339735248028e-01 5.7936592429336475e-01];
            t_check2cam =[-1.0504021780019561e+02; -2.9044290282362468e+01; 1.0566759452991259e+03];
        elseif rotation == pi
            R_check2cam_vec = [-8.5604053806752844e-01 -1.4723095999843856e-02 2.8259354797933048e-03];
            t_check2cam =[-2.4518464862189980e+01; -5.5858946035948918e+01; 1.0901419109768053e+03];
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

