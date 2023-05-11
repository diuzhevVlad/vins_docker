# VINS ROS docker
## Intallation
Create ws/src directory and clone [VINS FUSION](https://github.com/HKUST-Aerial-Robotics/VINS-Fusion) to it.
## Build
run start.sh file and execute in ws directory (inside docker container):
```
catkin_make
```
## Run
Use commands.txt to launch VINS FUSION with realsense-365i camera