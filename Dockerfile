FROM ubuntu:18.04

# Cloning git repo
RUN apt-get update

# Installing ROS-melodic
RUN apt-get install -y gnupg2
RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y lsb-core
ARG DEBIAN_FRONTEND=noninteractive

# INSTALL OTHER NECESSARY PACKAGES
RUN apt-get install -y vim
RUN apt-get install -y wget
RUN apt-get update
RUN apt-get install -y python-pip
RUN apt-get install -y libpng16-16
RUN apt-get install -y libjpeg-turbo8
RUN apt-get install -y libtiff5

RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
RUN curl -sSL 'http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xC1CF6E31E6BADE8868B172B4F42ED6FBAB17C654' | apt-key add -
RUN apt update
RUN apt install -y ros-melodic-desktop
RUN apt-get install -y python-rosdep
RUN rosdep init
RUN rosdep update
RUN echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
RUN apt install -y python-rosinstall python-rosinstall-generator python-wstool build-essential

# Intalling pyton-catkin
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -sc` main" > /etc/apt/sources.list.d/ros-latest.list'
RUN wget http://packages.ros.org/ros.key -O - | sudo apt-key add -
RUN apt-get update
RUN apt-get install -y python-catkin-tools
RUN apt-get install -y software-properties-common

RUN echo "source /opt/ros/melodic/setup.bash" >> ~/.bash_profile

CMD ["tail", "-f", "/dev/null"]

RUN apt-get install cmake libgoogle-glog-dev libgflags-dev \
	 libatlas-base-dev libeigen3-dev libsuitesparse-dev -y

RUN mkdir ceres && cd ceres &&  wget http://ceres-solver.org/ceres-solver-2.1.0.tar.gz && \
	 tar zxf ceres-solver-2.1.0.tar.gz
RUN cd ceres &&  mkdir ceres-bin && cd ceres-bin && \
	 cmake ../ceres-solver-2.1.0 && make -j3 && make test && make install

RUN mkdir ocv && cd ocv && git clone -b 3.4 https://github.com/opencv/opencv.git && \
	git clone -b 3.4 https://github.com/opencv/opencv_contrib.git 
	
RUN cd ocv/opencv && mkdir build && cd build && \
	cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local \
	-D OPENCV_EXTRA_MODULES_PATH=/ocv/opencv_contrib/modules .. && \
	make -j7

RUN cd ocv/opencv/build/doc/ && make -j7 && cd .. && make install

RUN apt install tmux git -y

WORKDIR /ws/

