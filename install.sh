#!/bin/sh

sed -e 's/CheckSpace/#CheckSpace/' -e 's/#ParallelDownloads\ =\ 5/ParallelDownloads = 10\nILoveCandy/' -e 's/#Color/Color/' -e 's/#VerbosePkgLists/VerbosePkgLists/' -i /etc/pacman.conf

timedatectl set-ntp true

lsblk

printf "Enter the drive you want to partition (just the name, ex: sda1) : " && read drive

#echo m\ng\nn\n\n\n\n+550M\nn\n\n\n\n+2G\nn\n\n\n\n\nt\n1\n1\nt\n2\n19\nw | fdisk /dev/$drive

lsblk
printf "Enter the drive which has 550M partition space (just the name, ex: sda1) : " && read bootDrive
printf "Enter the swap partition (just the name, ex: sda2) : " && read swapDrive
printf "Enter the big CHONKY partition (just the name, ex: sda3 ) : " && read linuxDrive
mkfs.fat -F32 /dev/$bootDrive
mkswap /dev/$swapDrive
swapon /dev/$swapDrive
mkfs.ext4 /dev/$linuxDrive

mount /dev/$linuxDrive /mnt

echo "Installing the base packages"
pacstrap /mnt base linux linux-firmware

echo "Generating the filesystem table"
genfstab -U /mnt >> /mnt/etc/fstab

echo "Enabling parallel downloads"
sed -e 's/CheckSpace/#CheckSpace/' -e 's/#ParallelDownloads\ =\ 5/ParallelDownloads = 10\nILoveCandy/' -e 's/#Color/Color/' -e 's/#VerbosePkgLists/VerbosePkgLists/' -i /mnt/etc/pacman.conf

mv ./post /mnt/root/post
mv ./postpost /mnt/root/postpost

echo "Chrooting into /mnt"
echo "run 'cd && ./post'"
chmod +x /mnt/root/post
chmod +x /mnt/root/postpost
arch-chroot /mnt
