Initial setup procedures
========================
Follow these setups to provision the device with Debian GNU/Linux:

Flash the BIOS onto a USB drive from your PC:
```
gunzip bios12.img.gz
dd if=bios12.img of=/dev/<blockdev> bs=1M oflag=sync
eject /dev/<blockdev>
```

Connect the serial console to your PC. Spawn a screen to connect to it:
```
screen /dev/ttyUSB0 115200n8
```

Insert the USB drive, power the device, and let it boot. Run the following:
```
./flash.sh
sync; sync;
```

Flash a Debian netinst image onto a USB drive from your PC:
```
dd if=debian-stretch-DI-rc4-amd64-netinst.iso  of=/dev/<blockdev> bs=1M oflag=sync
eject /dev/<blockdev>
```

Insert the USB drive and power cycle the device. You may need to spawn another screen (as above). Once the device boots to the install menu, highlight 'Install' and press tab. Alter the boot string as follows:
```
/install.amd/vmlinuz vga=off console=ttyS1,115200n8 initrd=/install.amd/initrd.gz
```

Reboot. At grub, press 'c' and input (adjusting for your disk layout):
```
insmod gzio
insmod part_msdos
insmod ext2
set root='hd0,msdos1'
linux /vmlinuz-4.9.0-3-amd64 root=/dev/<blockdev> console=ttyS1,115200n8 ro
initrd /initrd.img-4.9.0-3-amd64
```

Press return and you should land at a login screen. Congratulations!
```
Debian GNU/Linux 9 hostname ttyS1

hostname login:
```

