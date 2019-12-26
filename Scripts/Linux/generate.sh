#!/bin/bash

cd ${0%/*}
ROOT_DIR=`pwd`

if [ $# -eq 0 ]
  then
    echo "Qt path parameter required"
    exit 1
fi

QT_PREFIX_PATH=$1

GENERATOR="Unix Makefiles"
SOURCE_DIR=$ROOT_DIR/../../SampleProjectQt
BUILD_DIR_DEBUG=$SOURCE_DIR/build/Debug

mkdir -p "$BUILD_DIR_DEBUG"
cd $BUILD_DIR_DEBUG

# clear CMake cache
rm -f "CMakeCache.txt"

# generate the project
cmake \
-G "$GENERATOR" \
-DCMAKE_BUILD_TYPE="Debug" \
-DCMAKE_PREFIX_PATH="$QT_PREFIX_PATH" \
"$SOURCE_DIR"

cd $ROOT_DIR

BUILD_DIR_RELEASE=$SOURCE_DIR/build/Release

mkdir -p "$BUILD_DIR_RELEASE"
cd $BUILD_DIR_RELEASE

# clear CMake cache
rm -f "CMakeCache.txt"

# generate the project
cmake \
-G "$GENERATOR" \
-DCMAKE_BUILD_TYPE="Release" \
-DCMAKE_PREFIX_PATH="$QT_PREFIX_PATH" \
"$SOURCE_DIR"


