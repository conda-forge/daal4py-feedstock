#!/bin/bash

if [ "$PY3K" == "1" ]; then
    ARGS=" --single-version-externally-managed --record=record.txt"
else
    ARGS="--old-and-unmanageable"
fi

# if dpc++ vars path is specified
if [ -z "${DPCPPROOT}" ] && [ "$(uname)" != "Darwin" ]; then
    export DPCPPROOT=${PREFIX}
    export CPATH=${BUILD_PREFIX}/x86_64-conda-linux-gnu/include/c++/11.2.0:${BUILD_PREFIX}/x86_64-conda-linux-gnu/include/c++/11.2.0/x86_64-conda-linux-gnu:$CPATH
fi

# if DAALROOT not exists then provide PREFIX
if [ "${DAALROOT}" != "" ] && [ "${DALROOT}" == "" ] ; then
    export DALROOT="${DAALROOT}"
fi

if [ -z "${DALROOT}" ]; then
    export DALROOT=${PREFIX}
fi

if [ "$(uname)" == "Darwin" ]; then
    export CC=gcc
    export CXX=g++
fi

export DAAL4PY_VERSION=$PKG_VERSION
export MPIROOT=${PREFIX}
${PYTHON} setup.py install $ARGS
