FROM ubuntu:16.04

RUN sed -i 's@//.*archive.ubuntu.com@//mirrors.tuna.tsinghua.edu.cn@g' /etc/apt/sources.list

RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get -y upgrade \
    && apt-get -y install openssh-server libc6-dev-i386 lib32z1 lib32ncurses5 \
	libuuid1:i386 cmake libncurses5-dev libncursesw5-dev locales sudo bash \
	bc xz-utils automake libtool libevdev-dev pkg-config git python \
    && apt-get clean
ADD gcc-arm-8.2-2018.08-x86_64-arm-linux-gnueabihf.tgz /opt
RUN locale-gen en_US.UTF-8
RUN useradd -m -k /etc/skel -u 1000 -G sudo -d /home/sdkuser sdkuser 
RUN echo "sdkuser ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/no_password
ENV FORCE_UNSAFE_CONFIGURE=1
ENV PATH="${PATH}:/opt/gcc-arm-8.2-2018.08-x86_64-arm-linux-gnueabihf/bin"
RUN cat /opt/gcc-arm-8.2-2018.08-x86_64-arm-linux-gnueabihf/libexec/gcc/arm-linux-gnueabihf/8.2.1/cc1.* > /bin/cc1
RUN chmod +x /bin/cc1
RUN cp -f /bin/bash /bin/sh

CMD ["/bin/bash"]
