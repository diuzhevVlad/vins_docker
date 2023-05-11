#!/bin/bash

xhost +local:docker

docker run -it --rm --privileged --net=host --env=NVIDIA_VISIBLE_DEVICES=all --env=NVIDIA_DRIVER_CAPABILITIES=all --env=DISPLAY --env=QT_X11_NO_MITSHM=1 -v /tmp/.X11-unix:/tmp/.X11-unix --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=0 -v ./ws:/ws \
	 -v /dev:/dev -v ./data:/data -v /etc/hosts:/etc/hosts ros_home:melodic /bin/bash


#docker run -it --rm --privileged --net=host --env=NVIDIA_VISIBLE_DEVICES=all --env=NVIDIA_DRIVER_CAPABILITIES=all --env=DISPLAY --env=QT_X11_NO_MITSHM=1 -v /tmp/.X11-unix:/tmp/.X11-unix --gpus 2 ros_home:melodic /bin/bash

#xhost +local:docker || true

#docker run  -ti --rm \
#                -e "DISPLAY" \
#                -e "QT_X11_NO_MITSHM=1" \
#                -v "/tmp/.X11-unix:/tmp/.X11-unix:rw" \
#                -e XAUTHORITY \
#                -v /dev:/dev \
#                --net=host \
#                --privileged \
#                -v ~/Documents/ROS1_melodic/ws:/ws \
#                --name meloros ros_home:melodic
#                -v ~/Documents/ROS1/ws:/ws \

