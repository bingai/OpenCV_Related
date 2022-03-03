#include <iostream>
#include <opencv2/calib3d.hpp>
#include <opencv2/core.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>

int main(int argc, char** argv){

    (void)argc;
    (void)argv;

    std::vector<cv::String> fileNames;
    // Path of the folder containing checkerboard images

    cv::glob("/home/bingai/Documents/Calibration/code/images/cornerDetection/", fileNames, false);
    cv::Size(7-1, 9-1);
    std::vector<std::vector<cv::Point2f>> q(fileNames.size());

    std::vector<std::vector<cv::Point3f>> Q; // world coordinate

    //1. Generate checkerboard (world) coordinates Q; The board has 7 X 9 fields with a size of 70x70mm

    int checkerBoard[2] = {7, 9};
    int fieldSize = 70;

    //Define the world coordinate for 3D points
    std::vector<cv::Point3f> objp;
    for(int c = 1; c < checkerBoard[1]; ++c){
        for(int r = 1; r < checkerBoard[0]; ++r){
            objp.push_back(cv::Point3f(r*fieldSize, c*fieldSize, 0));
        }
    }

    std::vector<cv::Point2f> imgPoint;
    //Detect feature points
    std::size_t i = 0;

    for(auto const&f : fileNames){
        std::cout << std::string(f) << std::endl;

        // 2. Read in the image and find the corners
        cv::Mat img = cv::imread(fileNames[i]);
        cv::Mat gray;

        cv::cvtColor(img, gray, cv::COLOR_RGB2GRAY);
        
        bool patternFound = cv::findChessboardCorners(gray, cv::Size(checkerBoard[0], checkerBoard[1]), q[i],  cv::CALIB_CB_ADAPTIVE_THRESH | cv::CALIB_CB_FAST_CHECK | cv::CALIB_CB_NORMALIZE_IMAGE);
                                                                                                               

        std:: cout << "----------------------" << patternFound << std::endl;
        // 3. Use cv::cornerSubPix() to refine the found corner detections
        if(patternFound){
            cv::cornerSubPix(gray, q[i], cv::Size(11,11), cv::Size(-1,-1), cv::TermCriteria(cv::TermCriteria::EPS + cv::TermCriteria::MAX_ITER, 30, 0.1));
            Q.push_back(objp);
        }

        //Display
        cv::drawChessboardCorners(img, cv::Size(checkerBoard[0], checkerBoard[1]), q[i], patternFound);
        cv::imshow("chessboard detection", img);
        cv::waitKey(0);

        ++i;
    }

    cv::Matx33f K(cv::Matx33f::eye()); // intrinsic camera matrix
    cv::Vec<float, 5> k(0,0,0,0,0); // distortion coefficients

    std::vector<cv::Mat> rvecs, tvecs;
    std::vector<double> stdIntrinsics, stdExtrinsics, perViewErrors;

    int flags = cv::CALIB_FIX_ASPECT_RATIO + cv::CALIB_FIX_K3 + cv::CALIB_ZERO_TANGENT_DIST + cv:: CALIB_FIX_PRINCIPAL_POINT;

    cv::Size frameSize(1920,1080);

    std::cout << "Calibrating ..." << std::endl;

    //4. calculate reprojection error
    float error = cv::calibrateCamera(Q,q,frameSize, K, K, rvecs, tvecs, flags);

    std::cout << "Reprojection error = " << error <<"\n K = \n"
    << K << "\n k="
    << k << std::endl;

    //Precompute lens correction interpolation
    cv::Mat mapX, mapY;
    cv::initUndistortRectifyMap(K,K,cv::Matx33f::eye(), K, frameSize, CV_32FC1, mapX, mapY);

    //show lens corrected images
    for(auto const &f : fileNames){
        std::cout << std::string(f) << std::endl;

        cv::Mat img = cv::imread(f, cv::IMREAD_COLOR);

        cv::Mat imgUndistorted;
        //5. Remap the image using the precomputed interpolation maps
        cv::remap(img, imgUndistorted, mapX, mapY, cv::INTER_LINEAR);

        //Display
        cv::imshow("undistorted image", imgUndistorted);
        cv::waitKey(0);
    }

}