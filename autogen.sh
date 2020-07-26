#!/bin/sh

mkdir -p g-golf/build-aux
touch g-golf/build-aux/config.rpath

autoreconf -ivf
