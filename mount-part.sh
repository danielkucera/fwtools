
SRC=$1

umount /mnt/tst
mount -o loop $SRC /mnt/tst || mount $SRC /mnt/tst
mc /mnt/tst
umount /mnt/tst

