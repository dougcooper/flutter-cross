#!/bin/bash

# setup system

sudo apt update
sudo apt install -y \
    curl unzip git clang cmake pkg-config

cd "$HOME" || exit
git clone https://github.com/sony/flutter-elinux.git
mkdir -p .local/bin
ln -sr flutter-elinux/bin/flutter-elinux .local/bin/flutter-elinux

# setup cross compilation

sudo apt install -y \
    gcc-aarch64-linux-gnu g++-aarch64-linux-gnu libstdc++-9-dev-arm64-cross \
    qemu-user-static

# install docker

sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install -y \
    docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin