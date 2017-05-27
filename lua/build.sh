#!/bin/bash
# Fetch and compile lua library.
COMPONENT_PATH="${PWD}/dependencies/lua"
BUILD_PATH="${COMPONENT_PATH}/build"
SOURCE_URL="http://www.lua.org/ftp/lua-5.3.2.tar.gz"


# Find dependencies.
echo "Looking for dependencies ..."

READLINE_BASE=$(
  find -L "${PWD}" -path '*readline/build' -type d
)
READLINE_HEADERS="${READLINE_BASE}/include"
READLINE_LIBS="${READLINE_BASE}/lib/libhistory.a"
READLINE_LIBS="${READLINE_LIBS} ${READLINE_BASE}/lib/libreadline.a"

NCURSES_BASE=$(
  find -L "${PWD}" -path '*ncurses/build/out' -type d
)
NCURSES_HEADERS="${NCURSES_BASE}/include"
NCURSES_LIBS="${NCURSES_BASE}/lib/libncurses.a"

echo "Done looking for dependencies!"


### MAIN ###
mkdir -p "${BUILD_PATH}/out"
cd "${BUILD_PATH}"

# Get and unpack sources if missing.
if [ ! -f lua.tar.gz ]; then
  echo "Fetching LUA code ..."
  wget -O lua.tar.gz "${SOURCE_URL}" || exit $?
fi
if [ ! -f Makefile ]; then
  echo "Unpacking LUA code ..."
  tar --extract --strip 1 --file lua.tar.gz || exit $?
fi

# Skip compiling if the library exists.
if [ -f "${BUILD_PATH}/out/lib/liblua.a" ]; then
  echo "Skipping already build deplendency."
  exit 0
fi


# Compile static libraries.
echo "Compiling LUA static library ..."
sed -i 's/-lreadline//' src/Makefile || exit $?

HEADERS="-I ${READLINE_HEADERS} -I ${NCURSES_HEADERS}"
LIBS="${READLINE_LIBS} ${NCURSES_LIBS}"
make MYCFLAGS="${HEADERS}" MYLIBS="${LIBS}" linux || exit $?
make INSTALL_TOP="${BUILD_PATH}/out" install || exit $?
