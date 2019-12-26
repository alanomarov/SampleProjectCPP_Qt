#!/bin/bash

ROOT_DIR=`pwd`

if [ $# -eq 0 ]
  then
    echo "Qt path parameter required"
    exit 1
fi

QT_PREFIX_PATH=$1

GENERATOR="Xcode"
SOURCE_DIR=$ROOT_DIR/../../SampleProjectQt
BUILD_DIR=$SOURCE_DIR/build

mkdir -p "$BUILD_DIR"
cd $BUILD_DIR

# clear CMake cache
rm -f "CMakeCache.txt"

# generate the project
cmake \
-G "$GENERATOR" \
-DCMAKE_CONFIGURATION_TYPES="Debug;Release" \
-DCMAKE_OSX_ARCHITECTURES="x86_64" \
-DCMAKE_PREFIX_PATH="$QT_PREFIX_PATH" \
-DCMAKE_OSX_DEPLOYMENT_TARGET="10.12" \
"$SOURCE_DIR"
