#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:b065807f9de3f700adf13c8056372b78ad2e29dc; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:33554432:b89d302f8c987a74ac06cd0cc2e3bfbf34442340 \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:b065807f9de3f700adf13c8056372b78ad2e29dc && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
