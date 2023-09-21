#!/bin/bash

#allow docker to connect to xhost
xhost +local:docker

docker run --name agx -ti --rm  \
   	--ipc=host \
   	-e DISPLAY=$DISPLAY \
	-e QT_X11_NO_MITSHM=1 \
   	-e XAUTHORITY \
   	--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
        --volume="/home/tsv/agx/code:/code" \
   	-e NB_UID=1000 -e NB_GID=1000 \
   	-p 6006:6006 -p 5900:5900 -p 8888:8888 \
        tstoyanov/agx:latest bash

   	#--env="DISPLAY" \
