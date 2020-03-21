---
layout: post
title: "NVIDIA Jetson Nano Setup"
date: 2019-07-08
tags: [Deep Learning, Linux, PyTorch]
---

I bought an NVIDIA Jetson Nano last week and have been busy setting it up. I'm looking forward to playing around with it, especially training some models and using it for inference. Maybe I'll even come up with a fun physical project to build with it. 🤖

For a hobbyist, getting up and running with the Jetson Nano can be a bit more involved than say a Raspberry Pi, so I thought I'd leave some notes on my experience here. I ran across a some useful posts elsewhere, but ultimately had to find and piece together a few sources. Hopefully this compilation will be useful.

# Hardware

You can by the Jetson Nano Developer Kit from a few online retailers for about $99. Unlike some other hobby kits, though, about the only thing that comes in the box is the board itself. You'll probably want to have a few other things on hand to get started.

First, you'll definitely need a power supply. The board is designed to accept power by default via the single Micro-B USB connector. The NVIDIA docs say you need a good quality power supply that delivers 5V⎓2A (and they also remind you that many supplies don't actually do this consistently). If you can get a good supply, this could be the way to go.

However, one cool feature of the board is that it can _also_ be powered by a DC barrel jack that supplies 5V⎓4A. This seems to be the preferred method because the extra power is critical to avoid brownouts when you're running heavy workloads. This is the route I took, so I picked up [this one](https://www.amazon.com/SMAKN-Switching-Supply-Adapter-100-240/dp/B01N4HYWAM).

<p class="note">
<b>Warning:</b> One finer point I didn't realize at checkout about the DC barrel jack is that it is physically disabled by default. Be sure to have a jumper / shunt cap on hand to close J48 on the board so you can get powered up via the jack right away.
</p>

Another must have extra is a micro SD card. There's no onboard disk, so this is where you'll flash the OS and store any other data; you'll want to have a high quality card for this reason. You'll also have to use another computer to flash the card the first time, so make sure you have some sort of adapter for that too.

One potential negative mark for the Jetson Nano is that it doesn't come with a Wi-Fi card, so you'll need to either buy one and install it under the module or use the included Ethernet port for network access. So far, I've stuck to the latter method and it's worked fine for me. If you want to make an IoT-like bot, though, consider picking up a Bluetooth or wireless card.

Finally, if it wasn't already obvious, the kit is headless out of the box, so think about any other peripherals (e.g., a keyboard, mouse, and monitor) you might want to get it running. Eventually I'd recommend connecting to the device exclusively via SSH, but it's probably easiest to set it up the first time at your desk. If I recall correctly, you can setup Raspbian out of the box via SSH if you set a bit on the SD card, but I don't know if this is possible with NVIDIA's image of Ubuntu 18.04 on the Jetson Nano.

# OS + Other Software

Once you have all your hardware ready to go, checkout the official [getting started guide](https://developer.nvidia.com/embedded/learn/get-started-jetson-nano-devkit#write). Here's the TL;DR:

- Download the pre-built [SD card image](https://developer.nvidia.com/embedded/dlc/jetson-nano-dev-kit-sd-card-image)
- Use Etcher or a CLI to write the image to the card
- Plug the card and everything else into the Jetson Nano
- Wait for the OS to boot, setup an account, and login

Once you're logged in and your Internet is up, it's probably a good idea to run `sudo apt update` and `sudo apt upgrade` since the image was first created a few months back and some packages are out of date. You may also want to install some ubiquitous software like `git` while you're at it.

# Installing PyTorch

Installing your favorite deep learning framework is going to be a bit different on a Jetson. It's an ARM architecture, so doing a regular pip install from PyPI probably won't work quite right. Fortunately, NVIDIA provides a wheel that you can download and install. Here's the PyTorch 1.1.0 wheel to grab (they have a TensorFlow one too, but let's just do this one for now):

```bash
wget https://nvidia.box.com/shared/static/veo87trfaawj5pfwuqvhl6mzc5b55fbj.whl -O torch-1.1.0a0+b457266-cp36-cp36m-linux_aarch64.whl
```

Python 3.6 came installed, but pip was not. You can get it like this:

```bash
wget https://bootstrap.pypa.io/get-pip.py
sudo python3 get-pip.py; rm get-pip.py
```

I also realized I needed the Python dev headers installed to successfully build from source packages like numpy. Get this on Ubuntu with:

```bash
sudo apt install python3-dev
```

Finally, you can install the PyTorch wheel like this:

```bash
pip install numpy torch-1.1.0a0+b457266-cp36-cp36m-linux_aarch64.whl
```

The installation will probably take quite awhile; even the numpy dependency alone took almost 10 minutes for me. Once you're done, you can also install torchvision, if you want. This is slightly more involved than usual as well, since you'll need to install from source:

```bash
cd <virtualenv or python location>/lib/python3.6/site-packages
git clone https://github.com/pytorch/vision; cd vision
export TORCHVISION_PYTORCH_DEPENDENCY_NAME=torch
sudo python3 setup.py install; cd
```

<p class="note">
<b>Note:</b> Depending on whether you setup a virtual environment or not (this is out of scope in this post), you'll want to change into whatever directory has <code>/lib/python3.6/site-packages</code> for your environment before you install. You will also want to export the <code>TORCHVISION_PYTORCH_DEPENDENCY_NAME</code> variable before installation since the torchvision <code>setup.py</code> file by default tries to verify you have <code>torch >= 1.1.0</code>; the NVIDIA <code>1.1.0a0+b457266</code> wheel doesn't pass that assertion, so we will loosen the constraint to just <code>torch</code> with the variable.
</p>

That's it for now. I'll come back and make updates as I work with the Jetson Nano more and install other things. Happy hacking!
