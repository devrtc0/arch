#!/usr/bin/env sh

set -a

source ./plain_configuration || exit -1

CFG_CPU_VENDOR=$(cat /proc/cpuinfo | grep 'vendor' | uniq | awk '{ print $3 }')
case "$CFG_CPU_VENDOR" in
"GenuineIntel")
    CFG_UCODE="intel-ucode"
    ;;
"AuthenticAMD")
    CFG_UCODE="amd-ucode"
    ;;
*)
    echo "Unknown cpu vendor $CFG_CPU_VENDOR"
    exit -1
    ;;
esac

case "$CFG_DESKTOP_ENVIRONMENT" in
"PLASMA")
    CFG_DESKTOP_MANAGER='sddm'
    ;;
"GNOME")
    CFG_DESKTOP_MANAGER='gdm'
    ;;
*)
    echo "NO DE: $CFG_DESKTOP_ENVIRONMENT"
    exit -1
    ;;
esac

set +a

[ -z "$CFG_DEVICE" ] && echo "CFG_DEVICE" && exit -1
[ -z "$CFG_USERNAME" ] && echo "CFG_USERNAME" && exit -1
[ -z "$CFG_HOSTNAME" ] && echo "CFG_HOSTNAME" && exit -1
[ -z "$CFG_ROOT_PASSWORD" ] && echo "CFG_ROOT_PASSWORD" && exit -1
[ -z "$CFG_USER_PASSWORD" ] && echo "CFG_USER_PASSWORD" && exit -1
[ -z "$CFG_DESKTOP_ENVIRONMENT" ] && echo "CFG_DESKTOP_ENVIRONMENT" && exit -1
