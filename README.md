# agx\_docker
Docker build files and scripts for running AGX. 

# Building and Running
The image relies on the intel opengl driver. If you have an nvidia card, uncomment the first line of the build script as well as the line that installs libglvnd. Otherwise, you can keep the set up as is.

* place the license file and .deb package in this folder. This script assumes you are installing agx-2.36.1.2-amd64-ubuntu\_22.04.deb so it needs to be present.
* build the containers by running ./build.sh
* to start the container, edit the script in start\_interactive.sh. Substuitute the line that mounts the second volume and change the path /home/tsv/code/agx to point to a folder where you have your AGX code. 
* Run the script to start up a container. 
* If you want to have an additional terminal in the container, run the script connect\_running.sh. Pay attention that the new terminal needs to run "source /entrypoint.sh" in order to set up the paths and license file.

