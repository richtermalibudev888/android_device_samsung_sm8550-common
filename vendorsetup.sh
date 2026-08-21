#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2020-2026 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#

FDEVICE="sm8550-common"
THIS_DEVICE=${BASH_ARGV[2]}

fox_get_target_device() {
local chkdev
  if echo "$BASH_SOURCE" | grep -q "/$FDEVICE/"; then
      FOX_BUILD_DEVICE="$FDEVICE"
  elif set | grep BASH_ARGV | grep -w \"$FDEVICE\"; then
      FOX_BUILD_DEVICE="$FDEVICE"
  elif echo "${BASH_SOURCE[0]}" | grep -q "/$FDEVICE/"; then
      FOX_BUILD_DEVICE="$FDEVICE"
  elif echo "$0" | grep -q "$FDEVICE"; then
      FOX_BUILD_DEVICE="$FDEVICE"
  fi
}

if [ -z "$FOX_BUILD_DEVICE" ]; then
	fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
	export TW_DEFAULT_LANGUAGE="en"
	export LC_ALL="C"
	export FOX_VANILLA_BUILD=1
	export FOX_NO_SAMSUNG_SPECIAL=1
	export FOX_ENABLE_APP_MANAGER=1
	export FOX_USE_BASH_SHELL=1
	export FOX_ASH_IS_BASH=1
	export FOX_USE_TAR_BINARY=1
	export FOX_USE_XZ_UTILS=1
	export FOX_USE_LZ4_BINARY=1
	export FOX_USE_ZSTD_BINARY=1
	export FOX_USE_DATE_BINARY=1
	export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
	export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"
	export FOX_USE_SPECIFIC_MAGISK_ZIP=~/Magisk/Magisk-v30.7.zip
	export FOX_DELETE_INITD_ADDON=1
	export FOX_DELETE_AROMAFM=1
	export FOX_USE_BUSYBOX_BINARY=1
	#
	export OF_USE_LZ4_COMPRESSION=1
	export OF_USE_GREEN_LED=0
	export OF_FLASHLIGHT_ENABLE=0
	export OF_ADVANCED_SECURITY=1
	export OF_FORCE_PREBUILT_KERNEL=1
	export FOX_SETTINGS_ROOT_DIRECTORY=/omr
	export FOX_RESET_SETTINGS=1
	#
	# export FOX_RESET_SETTINGS="disabled"
	#
	export OF_FORCE_DATA_FORMAT_F2FS=1
	export OF_WIPE_METADATA_AFTER_DATAFORMAT=1
	export OF_BIND_MOUNT_SDCARD_ON_FORMAT=1
	#
	export OF_SCREEN_H=2340
    export OF_STATUS_H=109
    export OF_STATUS_INDENT_LEFT=64
    export OF_STATUS_INDENT_RIGHT=64
    export OF_HIDE_NOTCH=1
    export OF_CLOCK_POS=1
	#
    export FOX_TARGET_DEVICES="sm8550-common"
    export TARGET_DEVICE_ALT="dm1q, dm2q, dm3q, q5q, gts9, gts9wifi, gts9p, gts9pwifi, gts9u, gts9uwifi"
	#
	export FOX_MAINTAINER_PATCH_VERSION=0
	export OF_MAINTAINER=Richter
	export FOX_BUILD_TYPE="Beta"
	export FOX_VARIANT=default
	#
	export OF_SKIP_FBE_DECRYPTION=1
    export OF_DONT_PATCH_ENCRYPTED_DEVICE=1
    export OF_FIX_DECRYPTION_ON_DATA_MEDIA=1
	
else
	if [ -z "$FOX_BUILD_DEVICE" -a -z "$BASH_SOURCE" ]; then
		echo "I: This script requires bash. Not processing the $FDEVICE $(basename $0)"
	fi
fi
#
