#!/bin/bash
# Compile GFlags as static libraries.


COMPONENT_PATH="${PWD}/dependencies/gflags"
BUILD_PATH="${COMPONENT_PATH}/build"
SRC_PATH="${COMPONENT_PATH}/source"


### MAIN ###
mkdir -p "${BUILD_PATH}"
cd "${BUILD_PATH}"

cmake -D BUILD_SHARED_LIBS=0 -D BUILD_STATIC_LIBS=1 "${SRC_PATH}"
make
