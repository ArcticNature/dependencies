#!/bin/bash
# Compile static version of readline.


COMPONENT_PATH="${PWD}/${1}"
BUILD_PATH="${COMPONENT_PATH}/build"
SOURCE_URL="http://ftp.gnu.org/gnu/ncurses/ncurses-6.0.tar.gz"


### MAIN ###
mkdir -p "${BUILD_PATH}"
cd "${BUILD_PATH}"

# Get and unpack sources if missing.
if [ ! -f ncurses.tar.gz ]; then
  echo "Fetching ncurses code ..."
  wget -O ncurses.tar.gz "${SOURCE_URL}" || exit $?
fi
if [ ! -f configure ]; then
  echo "Unpacking ncurses code ..."
  tar --extract --strip 1 --file ncurses.tar.gz || exit $?
fi

# Configure and compile.
if [ ! -f Makefile ]; then
  ./configure --prefix "${BUILD_PATH}/out"
fi
make
make install > install.log
