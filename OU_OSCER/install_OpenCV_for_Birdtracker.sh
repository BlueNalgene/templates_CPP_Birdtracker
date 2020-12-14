#!/bin/bash

# This script is used to install the correct OpenCV version with contrib on OU's OSCER system.
# This will hopefully be made obsolete by OSCER adding my OpenCV build with contrib to ``module``

# Store our current directory
ORIG_DIR=$(pwd)

# Start in user's home directory
cd $HOME

# Get the git repos we need
git clone https://github.com/opencv/opencv.git
git clone https://github.com/opencv/opencv_contrib.git

# Create output directory
mkdir OpenCV_shared

# Descend into folder
cd opencv
mkdir build
cd build

# Load required dependencies
module load binutils CMake FFmpeg

# Configure cmake with the options we need
cmake \
-DBUILD_PNG=ON \
-DCMAKE_CXX17_COMPILE_FEATURES=cxx_std_17 \
-DCMAKE_BUILD_TYPE=Release \
-DCMAKE_INSTALL_PREFIX=~/OpenCV_shared \
-DOPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules/ ..

# Make across 24 threads (don't use -j24 for normal computers!)
make -j24

# Install what we made
# This command takes a few minutes. Grab a coffee
make install

# Return to the original directory so the user doesn't get lost and confused.
cd $ORIG_DIR
