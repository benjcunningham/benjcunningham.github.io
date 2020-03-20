---
layout: post
title: "Setting Up a Headless Raspberry Pi"
date: 2020-03-19
tags: [linux, raspberry pi]
---

I got a Raspberry Pi 4 in the mail today. I ordered it because... COVID-19? New model? More memory? I definitely don't have a plan for it yet, but it seemed like a fun busy box while I'm stuck inside.

What I didn't notice when I ordered it, though, is that this version comes with _Micro_ HDMI ports. I definitely don't have a dongle for that.

Nevertheless, I recalled from past experience that headless setup is pretty easy. It definitely is, but I wanted to write it down for future reference:

1. This is the hardest part: find your Micro SD card adapter. It's probably _not_ where it should be. Once you have it, plug your Raspbian-loaded SD into your laptop. And double-check that the read-only switch isn't flipped (so annoying).
2. Mount the card and `cd` into `/media/<you>/boot`.
3. `touch ssh`, a magic file the OS will look for at boot.
4. Create `wpa_supplicant.conf` in the same directory and fill it with something like:

    ```
    ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
    update_config=1
    country=US

    network={
        ssid="<SSID>"
        psk="<Password>"
    }
    ```

5. Unmount and eject the SD. Plug it into your Raspberry Pi. Power it on.
6. Find the IP address of the Raspberry Pi, (probably) most easily done by signing into your Wi-Fi router admin panel.
7. SSH into it with `ssh pi@<IP Address>`, using `raspberry` as the default password.
8. Remember to change the default password with `passwd` (if you aren't already prompted to do so).

🥧
