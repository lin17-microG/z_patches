#!/bin/bash

list_repos() {
cat <<EOF
external/ant-wireless/ant_native:patch_702_ant-wireless.patch
external/conscrypt:patch_703_conscrypt.patch
external/neven:patch_704_neven.patch
frameworks/opt/net/wifi:patch_705_opt-net-wifi.patch
frameworks/rs:patch_706_rs.patch
frameworks/ex:patch_707_ex.patch
packages/apps/FMRadio:patch_709_FMRadio.patch
packages/apps/Terminal:patch_710_Terminal.patch
hardware/qcom-caf/common:patch_711_qc-common.patch
lineage-sdk:patch_712_lineage-sdk.patch
vendor/nxp/opensource/commonsys/packages/apps/Nfc:patch_713_nxp-Nfc.patch
vendor/qcom/opensource/fm-commonsys:patch_714_fm-commonsys.patch
vendor/qcom/opensource/libfmjni:patch_715_libfmjni.patch
EOF
}


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

cd packages/apps/SetupWizard
echo "Patching $PWD (Suggest disabled metrics by default)"
patch -p1 < $THISDIR/patch_102_SetupWizard.patch
echo "-"
cd $TOPDIR

cd packages/apps/Trebuchet
echo "Patching $PWD (Add Bromite to 'hot seat')"
patch -p1 < $THISDIR/patch_103_Trebuchet.patch
echo "-"
cd $TOPDIR


cd external/openssh
echo "Patching $PWD (hardened malloc compatibility fix)"
patch -p1 < $THISDIR/patch_200_openssh.patch
echo "-"
cd $TOPDIR

cd system/bt
echo "Patching $PWD (hardened malloc alloc site attributes)"
patch -p1 < $THISDIR/patch_201_bt.patch
echo "-"
cd $TOPDIR

cd system/bpf
echo "Patching $PWD (fix broken double close in BpfMapTest.cpp)"
patch -p1 < $THISDIR/patch_300_bpf.patch
echo "-"
cd $TOPDIR

cd system/extras
echo "Patching $PWD (fscrypt: pad filenames to 32 bytes)"
patch -p1 < $THISDIR/patch_202_extras.patch
echo "-"
cd $TOPDIR

list_repos | while read STR; do
  DIR=$(echo $STR | cut -f1 -d:)
  PTC=$(echo $STR | cut -f2 -d:)
  cd $DIR
  echo "Constify JNI method tables: $DIR"
  patch -p1 < $THISDIR/$PTC
  cd $TOPDIR
done

cd $THISDIR

