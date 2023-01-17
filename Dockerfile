FROM osrf/ros:galactic-desktop
LABEL maintainer="Todor Stoyanov"

SHELL ["/bin/bash", "-c"]

#Make sure python is installed
RUN apt-get update && apt-get install -y --no-install-recommends python3-pip python3 vim curl gnupg wget bash-completion

#enable autocompletion
RUN sh -c 'echo "\n if ! shopt -oq posix; then \n if [ -f /usr/share/bash-completion/bash_completion ]; then \n . /usr/share/bash-completion/bash_completion \n elif [ -f /etc/bash_completion ]; then \n . /etc/bash_completion \n fi \n fi" >> /etc/bash.bashrc'


#install useful python packages
RUN pip3 install pandas matplotlib scipy scikit-learn 

#install ignition sym
RUN sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'
RUN wget http://packages.osrfoundation.org/gazebo.key -O - | apt-key add -
RUN apt-get update && apt-get install -y libignition-gazebo5-dev 

RUN apt-get update && apt-get install -y ros-galactic-ros-ign-bridge ros-galactic-ros2-control ros-galactic-ros2-controllers ignition-edifice ros-galactic-turtlebot4-simulator ros-galactic-irobot-create-nodes

RUN rosdep update
RUN source /opt/ros/galactic/setup.bash && ign fuel download --url https://fuel.ignitionrobotics.org/1.0/OpenRobotics/models/Depot

#RUN mkdir -p /workspace/src && cd /workspace/src \
#   && git clone https://github.com/turtlebot/turtlebot4_simulator.git \
#   && rosdep update 
#   && cd /workspace && rosdep install --from-paths src -i -y --rosdistro ${ROS_DISTRO}

#   && git clone https://github.com/iRobotEducation/create3_sim.git \
#   && git clone https://github.com/turtlebot/turtlebot4.git \
#   && git clone https://github.com/turtlebot/turtlebot4_desktop.git \
#   && git clone https://github.com/ros-controls/gz_ros2_control/ \
#   && git clone https://github.com/iRobotEducation/irobot_create_msgs.git \


RUN ldconfig


