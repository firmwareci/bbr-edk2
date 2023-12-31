#!/bin/bash
set -e
trap "Exiting" INT

## environment variables
SRC_PATH=$(pwd)/src
EDK_PATH=$(pwd)/edk2
APP_PATH=$(pwd)/app
PKG_OUTPUT_DIR=$APP_PATH/Build

#export GCC5_AARCH64_PREFIX=$SRC_PATH/toolchain/gcc-arm-8.2-2019.01-x86_64-aarch64-elf/bin/aarch64-elf-
export PACKAGES_PATH=$EDK_PATH:$APP_PATH:$EDK_PATH/OvmfPkg
export PYTHON_COMMAND=/usr/bin/python3

cd $EDK_PATH
source edksetup.sh
cd -

# Building BaseTools
make -C $EDK_PATH/BaseTools

# Cleaning build dir
rm -rf $PKG_OUTPUT_DIR


build -p HelloWorld.dsc -m HelloWorld.inf -a X64 -t GCC5 -b RELEASE -D PKG_OUTPUT_DIR=$PKG_OUTPUT_DIR
