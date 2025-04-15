#!/bin/bash

preset=$1
target=$2

cmake --preset ${preset}
cmake --build out/build/${preset} -t ${target}
cmake --install out/build/${preset}
