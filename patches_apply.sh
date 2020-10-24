#!/bin/bash

THISDIR=$PWD

cd ..
TOPDIR=$PWD

cd device/common
echo "Patching $PWD (Use https f. common GPS configuration)"
patch -p1 < $THISDIR/patch_050_device-common.patch
echo "-"
cd $TOPDIR

cd packages/apps/Camera2
echo "Patching $PWD (Disable location tagging by default)"
patch -p1 < $THISDIR/patch_100_Camera2.patch
echo "-"
cd $TOPDIR

cd packages/apps/Dialer
echo "Patching $PWD (Remove Google backup/lookup)"
patch -p1 < $THISDIR/patch_101_Dialer.patch
echo "-"
cd $TOPDIR

cd $THISDIR





