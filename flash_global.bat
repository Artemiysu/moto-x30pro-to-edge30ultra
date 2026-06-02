@echo off
echo Starting flash process

fastboot flash boot boot.img
fastboot flash dtbo dtbo.img
fastboot flash recovery recovery.img
fastboot flash vendor_boot vendor_boot.img
fastboot flash vbmeta vbmeta.img
fastboot flash vbmeta_system vbmeta_system.img

echo Flashing radio and bluetooth
fastboot flash radio radio.img
fastboot flash dsp dspso.bin
fastboot flash bluetooth BTFM.bin

echo Flashing Super partition
fastboot flash super super.img_sparsechunk.0
fastboot flash super super.img_sparsechunk.1
fastboot flash super super.img_sparsechunk.2
fastboot flash super super.img_sparsechunk.3
fastboot flash super super.img_sparsechunk.4
fastboot flash super super.img_sparsechunk.5
fastboot flash super super.img_sparsechunk.6
fastboot flash super super.img_sparsechunk.7
fastboot flash super super.img_sparsechunk.8
fastboot flash super super.img_sparsechunk.9
fastboot flash super super.img_sparsechunk.10
fastboot flash super super.img_sparsechunk.11
fastboot flash super super.img_sparsechunk.12
fastboot flash super super.img_sparsechunk.13
fastboot flash super super.img_sparsechunk.14
fastboot flash super super.img_sparsechunk.15
fastboot flash super super.img_sparsechunk.16
fastboot flash super super.img_sparsechunk.17

echo Wiping data for region change
fastboot erase userdata
fastboot erase metadata

echo Done! Rebooting
fastboot reboot
pause