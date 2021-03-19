#!/bin/bash

sudo apt update

# Compilation dependencies
sudo apt install -y \
    liblog4cxx-dev \
    python3-dev

# Runtime dependencies
sudo apt install -y \
    python3-numpy \
    python3-netifaces \
    python3-yaml \
    python3-dev \
    python3-pip

# Dev tools
sudo apt install -y \
  build-essential \
  cmake \
  git \
  python3-pip \
  wget \
  libopencv-dev

# Install some pip packages
sudo -H python3 -m pip install \
  argcomplete \
  setuptools \
  vcstool \
  colcon-common-extensions \
  lark-parser
