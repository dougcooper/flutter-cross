README

This repo provides a simplified process for setting up a flutter app for the elinux platform. Perform the following steps on a linux host or WSL environment. 

> Ubuntu 22.04.3 was used for testing

1. setup up the host by running the `provision.sh` script then exit and reopen a new shell.

2. prepare for cross compilation

```
IMAGE_PATH=$HOME/flutter-cross-image

docker build . -t flutter-cross

mkdir $IMAGE_PATH

id=$(docker create flutter-cross)

docker export $id -o $IMAGE_PATH/image.tar

docker rm $id

cd $IMAGE_PATH

tar -xvf image.tar
```

3. build the app

```
IMAGE_PATH=$HOME/flutter-cross-image

cd <src folder>

flutter-elinux build elinux --target-arch=arm64 --target-compiler-triple=aarch64-linux-gnu --target-sysroot=$HOME/$IMAGE_PATH
```