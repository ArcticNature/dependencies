#!/bin/bash
# Compile static version of poolqueue.


COMPONENT_PATH="${PWD}/${1}"
BUILD_PATH="${COMPONENT_PATH}/build"
SRC_PATH="${COMPONENT_PATH}/source"


### MAIN ###
mkdir -p "${BUILD_PATH}"
cd "${SRC_PATH}"

# If the no-clean file is missing clear everything first.
if [ ! -f "${BUILD_PATH}/no-clean" ]; then
  git reset --hard
  git clean --force
  ./bootstrap.sh
  ./configure --prefix "${BUILD_PATH}"
fi
touch "${BUILD_PATH}/no-clean"

# Optimise away the next steps if the library exists.
if [ -f "${BUILD_PATH}/lib/libpoolqueue.a" ]; then
  echo "Skipping poolqueue re-build, library found."
  exit 0
fi

make
make install > install.log
libtool --finish "${BUILD_PATH}/lib"
