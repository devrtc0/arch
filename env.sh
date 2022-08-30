#!/usr/bin/env sh

source ./cfg_envs.sh

set -a

CFG_ROOT_DEVICE=$(lsblk -p -n -o NAME -x NAME $CFG_DEVICE | tail -1)
CFG_ROOT_DEVICE_UUID=$(blkid -s UUID -o value "$CFG_ROOT_DEVICE")

set +a
