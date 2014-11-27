#!/bin/bash

cd `dirname $0`
DSTDIR=$1

if [ -z "$DSTDIR" ]
then
    echo "Usage: $0 <sources dir>"
    exit 1
fi

red=$(tput setaf 1) # Red
grn=$(tput setaf 2) # Green
txtrst=$(tput sgr0) # Reset

echo "${red}Linaro patches${txtrst}"
sh patches/linaro_patches/patch.sh $DSTDIR

echo "${red}STD patches${txtrst}"
echo "${grn}Applying softkey_vibro patch${txtrst}"
cat patches/softkey_vibro.patch | patch -d $DSTDIR/frameworks/base/ -p1 -N -r -

echo "${grn}Applying system_core patch${txtrst}"
cat patches/system_core.patch | patch -d $DSTDIR/system/core/ -p1 -N -r -

echo "${grn}Applying prebuilts patch${txtrst}"
cat patches/mokee_prebuilts.patch | patch -d $DSTDIR/vendor/mk/ -p1 -N -r -

echo "${grn}Applying airplan patch${txtrst}"
cat patches/airplan.patch | patch -d $DSTDIR/packages/services/Telephony -p1 -N -r -

echo "${grn}Applying audio patch${txtrst}"
cat patches/AudioRecord.patch | patch -d $DSTDIR/frameworks/av/ -p1 -N -r -
cat patches/multichannel.patch | patch -d $DSTDIR/ -p1 -N -r -

echo "${grn}Applying mksettings patch${txtrst}"
cat patches/mksettings.patch | patch -d $DSTDIR/packages/apps/Settings/ -p1 -N -r -

echo "${grn}Applying mklauncher patch${txtrst}"
cat patches/mklauncher.patch | patch -d $DSTDIR/packages/apps/MoKeeLauncher/ -p1 -N -r -

echo "${grn}Applying wifi country patch${txtrst}"
cat patches/wifi.patch | patch -d $DSTDIR/frameworks/opt/telephony/ -p1 -N -r -
cat patches/defaultcountry.patch | patch -d $DSTDIR/frameworks/base/ -p1 -N -r -

echo "${red}F2FS patches${txtrst}"
echo "${grn}Applying selinux patch${txtrst}"
cat patches/check_for_selinux.patch | patch -d $DSTDIR/system/vold/ -p1 -N -r -

echo "${grn}Applying fs_mngr patch${txtrst}"
cat patches/fs_mngr.patch | patch -d $DSTDIR/system/core/ -p1 -N -r -

echo "${red}OTHER patches${txtrst}"
echo "${grn}Applying battery_framework patch${txtrst}"
cat patches/battery_around_ring_base.patch | patch -d $DSTDIR/frameworks/base/ -p1 -N -r -

echo "${grn}Applying battery_settings patch${txtrst}"
cat patches/battery_around_ring_sett.patch | patch -d $DSTDIR/packages/apps/Settings/ -p1 -N -r -

echo "${grn}Applying floating window framework patch${txtrst}"
cat patches/floating_window_base.patch | patch -d $DSTDIR/frameworks/base/ -p1 -N -r -

echo "${grn}Applying floating window settings patch${txtrst}"
cat patches/floating_window_sett.patch | patch -d $DSTDIR/packages/apps/Settings/ -p1 -N -r -

echo "${grn}Applying kernel_settings patch${txtrst}"
cp -r patches/packages $DSTDIR/
cat patches/kerneltweaker.patch | patch -d $DSTDIR/packages/apps/Settings/ -p1 -N -r -

echo "${grn}Applying storage legacy patch${txtrst}"
cat patches/storage_legacy.patch | patch -d $DSTDIR/frameworks/base/ -p1 -N -r -

echo "${grn}Applying headsup patch${txtrst}"
cat patches/headsup.patch | patch -d $DSTDIR/frameworks/base/ -p1 -N -r -

echo "${grn}Applying swipe patch${txtrst}"
cat patches/swipe.patch | patch -d $DSTDIR/frameworks/base/ -p1 -N -r -

echo "${grn}Applying speedup patch${txtrst}"
cat patches/speedup.patch | patch -d $DSTDIR/frameworks/base/ -p1 -N -r -

echo "${grn}Applying mute aapt patch${txtrst}"
cat patches/mute_aapt.patch | patch -d $DSTDIR/frameworks/base/ -p1 -N -r -

echo "${grn}Applying browser patch${txtrst}"
cat patches/browser.patch | patch -d $DSTDIR/external/chromium_org/ -p1 -N -r -

echo "${grn}Applying disable splitview patch${txtrst}"
cat patches/disable_splitview.patch | patch -d $DSTDIR/frameworks/base/ -p1 -N -r -

cd $DSTDIR

rm vendor/mk/prebuilt/common/lib/libjni_unbundled_latinimegoogle.so

find . -name '*.orig' -delete
