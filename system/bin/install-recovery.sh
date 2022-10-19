#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:37391694:546a9df1374dae5e3796fa96658e248e45e6ac21; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/bootdevice/by-name/boot:35079498:43be8ffecb96d48a81cb7d5a9d54f6555b6ec1ae EMMC:/dev/block/bootdevice/by-name/recovery 546a9df1374dae5e3796fa96658e248e45e6ac21 37391694 43be8ffecb96d48a81cb7d5a9d54f6555b6ec1ae:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
