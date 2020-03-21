---
layout: post
title: "Mounting Encrypted Drives"
date: 2018-07-30
tags: [Linux]
---

I can never remember how to mount a drive, let alone a LUKS-encrypted one. Here's how I do it on my Raspberry Pi with an external drive named `Domino`, based on [this Stack Exchange post](https://askubuntu.com/questions/63594/mount-encrypted-volumes-from-command-line#63598). You can use `df -h` if you don't know the drive number.

# Decrypt & Open

```bash
sudo mkdir /media/pi/Domino

sudo cryptsetup luksOpen /dev/sda1 Domino
sudo mount /dev/mapper/Domino /media/pi/Domino
```

# Close & Encrypt

```bash
sudo umount /media/pi/Domino
sudo cryptsetup luksClose Domino
```
