#!/bin/bash

THISDIR=$PWD

cd ..
TOPDIR=$PWD

cd packages/apps/Camera2
echo "Patching $PWD (Disable location tagging by default)"
patch -p1 < $THISDIR/patch_100_Camera2.patch
echo "-"
cd $TOPDIR

cd $THISDIR





