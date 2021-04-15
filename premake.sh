#!/bin/bash

# Establish environment variables
UNAME=$(uname | tr "[:upper:]" "[:lower:]")

if [ "${UNAME:0:7}" == "windows" ]; then
    PREMAKE_EXE="premake5.exe"
    PREMAKE_ACTION="vs2017" # !!: update this to 2019 when we build newer premake
elif [ "${UNAME:0:5}" == "mingw" ]; then
    PREMAKE_EXE="premake5.exe"
    PREMAKE_ACTION="vs2017" # !!: update this to 2019 when we build newer premake
elif [ "${UNAME:0:5}" == "linux"] ; then
    PREMAKE_EXE="premake5"
    PREMAKE_ACTION="gmake"
fi

PREMAKE_DIR="./bin/tools/"
PREMAKE_PATH=$PREMAKE_DIR/$PREMAKE_EXE

# Make sure premake is executable
chmod u+x $PREMAKE_PATH

# Invoke premake
if [ $# -eq 0 ]; then
    $PREMAKE_PATH $PREMAKE_ACTION
else
    $PREMAKE_PATH $@
fi

# Skip additional work if we failed our premake command
if [ $? -ne 0 ]; then
    exit
fi

# Populate (or update) submodules
git submodule update --init --recursive
