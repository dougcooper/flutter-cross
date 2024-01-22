FROM arm64v8/ubuntu:18.04

RUN apt update
RUN apt install -y clang cmake build-essential \
            pkg-config libegl1-mesa-dev \
            libxkbcommon-dev libgles2-mesa-dev
RUN apt install -y libwayland-dev wayland-protocols
RUN apt install -y libdrm-dev libgbm-dev libinput-dev libudev-dev libsystemd-dev
RUN apt install -y libfontconfig1

#add the symlink otherwise flutter-elinux will give a linker error
RUN ln -sr /lib/aarch64-linux-gnu/libgcc_s.so.1 /lib/aarch64-linux-gnu/libgcc_s.so