# ros2_docker
Docker build files and scripts for running ros2 galactic

# Running
If you want to modify the images please refer to "building" below. If you are satisfied with using the pre-built images you need to:

* Make sure you have installed nvidia-docker. Follow the [instructions](https://github.com/NVIDIA/nvidia-docker). Note that the images should work with vanilla docker as well, but will not benefit from hardware acceleration which may be prohibitatively slow.
* Modify the script in start_interactive.sh. Substuitute the line that mounts the second volume and change the path /home/tsv/code/ros2ws to point ot a folder where you have your ROS2 Workspace. 
* Run the script to start up a container. 
* If you want to have an additional terminal in the container, run the script connect_running.sh. Pay attention that the new terminal needs to run "source /ros_entrypoint.sh" in order to see the ROS2 installation.

# Building
The steps above should work by pulling the docker image from th associated [docker hub repository](https://hub.docker.com/r/tstoyanov/ros2). If, for some reason, you want to build your own images and modify something then:

* Modify the contents of the Dockerfile as you see fit.
* Edit build.sh and tag the image with your own unique name
* Run build.sh. Subsequently modify the start_interactive and connect_running scripts to use your local image.

