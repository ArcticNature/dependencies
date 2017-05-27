#!/bin/bash
# Compile static version of readline.


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
  ./configure --prefix "${BUILD_PATH}"
fi
touch "${BUILD_PATH}/no-clean"

# Skip if lib is already built.
if [ -f "${BUILD_PATH}/lib/libreadline.a" ]; then
  echo "Skipping already built dependency."
  exit 0
fi

make
make install > install.log
