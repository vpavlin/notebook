#!/usr/bin/bash

set -ex

. ${kernel_path}/env

pushd /tmp

curl -o /tmp/julia.tar.gz https://julialang-s3.julialang.org/bin/linux/x64/1.5/julia-$JULIA_VERSION-linux-x86_64.tar.gz
tar xzf julia.tar.gz
cp -R /tmp/julia-$JULIA_VERSION/* /opt/app-root/
rm -rf /tmp/julia.tar.gz /tmp/julia-$JULIA_VERSION

popd
JULIA_DEPOT_PATH=${JULIA_DEPOT_PATH} julia -e '
using Pkg
Pkg.add("IJulia")
'
cp -R ~/.local/share/jupyter/kernels/* /opt/app-root/share/jupyter/kernels/
