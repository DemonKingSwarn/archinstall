# Demon's Arch Installer and Auto Ricer (DAIAR)

## Installation:

```sh
pacman -Sy git archlinux-keyring
git clone --depth 1 https://github.com/demonkingswarn/archinstall
cd archinstall && ./install.sh
```

That's it.

## What is DAIAR?

DAIAR is a script that autoinstalls and autoconfigures a fully-functioning and minimal Arch Linux environment.

DAIAR can be run on a fresh install of Arch Linux, and provides you with a fully configured diving-board for work or more customizations.

## Customization

DAIAR uses the programs [here in pkgs.txt](https://github.com/DemonKingSwarn/archinstall/raw/master/pkgs.txt) and installs [my dotfiles repo here](https://github.com/demonkingswarn/dotfiles), but you can easily modify it by editing the script.

## Formatting a disk guide

```sh
lsblk
```

Check the name of the disk you want to format, I will assume here that its called `sda`.

```sh
fdisk /dev/sda
m
g
n
<enter>
<enter>
<enter>
+550M
n
<enter>
<enter>
<enter>
+2G
n
<enter>
<enter>
<enter>
<enter>
t
1
1
t
2
19
w
```
