# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=Advanced Kernel for Zenfone 3
do.devicecheck=1
do.modules=0
do.cleanup=1
do.cleanuponabort=1
device.name1=Z017
device.name2=ASUS_Z017D_1
device.name3=Z012
device.name4=ASUS_Z012D
supported.versions=8.1.0 - 9
'; } # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;


## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
chmod -R 750 $ramdisk/*;
chown -R root:root $ramdisk/*;


## AnyKernel install
dump_boot;

# begin ramdisk changes

# init.rc - Add spectrum support
backup_file init.rc;
insert_line init.rc "import /init.spectrum.rc" before "import /init.environ.rc" "import /init.spectrum.rc";
# end ramdisk changes

write_boot;
## end install

