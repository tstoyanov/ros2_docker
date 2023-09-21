#FROM nvidia/opengl:1.0-glvnd-devel-ubuntu20.04
FROM ubuntu:jammy 
LABEL maintainer="Todor Stoyanov"

SHELL ["/bin/bash", "-c"]

#Make sure python is installed
RUN apt-get update && apt-get install -y --no-install-recommends python3-pip python3 vim curl gnupg wget bash-completion xterm less gdb vim

#enable autocompletion
#RUN sh -c 'echo "\n if ! shopt -oq posix; then \n if [ -f /usr/share/bash-completion/bash_completion ]; then \n . /usr/share/bash-completion/bash_completion \n elif [ -f /etc/bash_completion ]; then \n . /etc/bash_completion \n fi \n fi" >> /etc/bash.bashrc'

#install useful python packages
RUN pip3 install pandas matplotlib scipy scikit-learn 

#RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install -y build-essential cmake libglvnd-dev mesa-utils-extra glmark2 
RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install -y build-essential cmake mesa-utils mesa-utils-extra glmark2 libgl1-mesa-dri

RUN mkdir /agx/
COPY agx.lic /agx/
COPY agx-2.36.1.2-amd64-ubuntu_22.04.deb /agx/

RUN apt-get install /agx/agx-2.36.1.2-amd64-ubuntu_22.04.deb -y

RUN ldconfig

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]

