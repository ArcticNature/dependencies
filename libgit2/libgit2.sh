#!/bin/bash
# Compile libgit2 submodule.

BASE_DIR="${PWD}/dependencies/libgit2"
SRC_DIR="${BASE_DIR}/source"
TARGET_DIR="${BASE_DIR}/build"

BUILD_TYPE="Release"


set -e
mkdir -p "${TARGET_DIR}"
cd "${TARGET_DIR}"

cmake \
  -DBUILD_SHARED_LIBS=off \
  -DCMAKE_BUILD_TYPE=${BUILD_TYPE} \
  -DBUILD_CLAR=off \
  "${SRC_DIR}"

cmake --build "${TARGET_DIR}"
