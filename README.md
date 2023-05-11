# VINS ROS docker
## Intallation
Create ws/src directory and clone [VINS FUSION](https://github.com/HKUST-Aerial-Robotics/VINS-Fusion) to it.
## Build
Build docker image with build.sh script.
Then run start.sh file and execute in ws directory (inside docker container):
```
catkin_make
```
## Configuring
Recomended config files for rs-435i camera are saved in this repository (inside corresponding folder).
To obtain custom parameters of your imu-camera system use [Kalibr](https://github.com/ethz-asl/kalibr).
## Run
Use commands.txt to launch VINS FUSION with realsense-435i camera