#!/usr/bin/env bash
script_full_path=$(dirname "$0")
build_output_path="$script_full_path/../build_output"
cmake -G "CodeBlocks - Unix Makefiles" -H"$script_full_path/../" -B"$build_output_path" -DCMAKE_BUILD_TYPE=Debug
cd "$build_output_path"
echo $PWD
make
make install