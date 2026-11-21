### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers

properties() { '
kernel.string=Legacy Ginkgo Kernel 4.14.117 (1000Hz UltraGaming + BBR) by Zareth
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=ginkgo
device.name2=willow
device.name3=Redmi Note 8
device.name4=Redmi Note 8T
supported.versions=
supported.patchlevels=
supported.vendorpatchlevels=
'; }

boot_attributes() {
set_perm_recursive 0 0 755 644 $RAMDISK/*;
set_perm_recursive 0 0 750 750 $RAMDISK/init* $RAMDISK/sbin;
}

BLOCK=boot;
IS_SLOT_DEVICE=auto;
RAMDISK_COMPRESSION=auto;
PATCH_VBMETA_FLAG=auto;

. tools/ak3-core.sh;

# boot install (System-as-Root / SAR device without boot ramdisk)
split_boot;
flash_boot;
if [ -f $AKHOME/dtbo.img ]; then flash_dtbo; fi
if [ -d /data/adb ]; then
  mkdir -p /data/adb/service.d /data/adb/post-fs-data.d 2>/dev/null;
  ui_print "  • Installing MiTrinket-Parity Auto-Perf service...";
  cp -f $AKHOME/00-legacy-perf.sh /data/adb/service.d/00-legacy-perf.sh 2>/dev/null;
  cp -f $AKHOME/00-legacy-perf.sh /data/adb/post-fs-data.d/00-legacy-perf.sh 2>/dev/null;
  chmod 755 /data/adb/service.d/00-legacy-perf.sh /data/adb/post-fs-data.d/00-legacy-perf.sh 2>/dev/null;
fi
## end boot install
exit 0;
