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

echo "${grn}Applying linaro_build patch${txtrst}"
cat linaro_build.patch | patch -d $DSTDIR/build/ -p1 -N -r -

echo "${grn}Applying linaro_display patch${txtrst}"
cat linaro_display.patch | patch -d $DSTDIR/hardware/qcom/display-caf/ -p1 -N -r -

echo "${grn}Applying linaro_vold patch${txtrst}"
cat vold.patch | patch -d $DSTDIR/system/vold/ -p1 -N -r -

echo "${grn}Applying art patch${txtrst}"
cat art.patch | patch -d $DSTDIR/art/ -p1 -N -r -

echo "${grn}Applying recovery patch${txtrst}"
cat linaro_recovery.patch | patch -d $DSTDIR/bootable/recovery/ -p1 -N -r -
