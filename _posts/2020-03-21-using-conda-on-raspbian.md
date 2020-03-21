---
layout: post
title: "Using Conda on Raspbian"
date: 2020-03-21
tags: [linux, python, raspberry pi]
---

I use Conda everywhere at work, and wondered if I could get it installed on my new Raspberry Pi. There _are_ Miniconda installers in [Continuum's archives](https://repo.continuum.io/miniconda/) for the Pi's `armv7l` architecture, but they're pretty old; by default, you'll end up with Python 3.4, and won't be able to upgrade to a version lik 3.6 without some work.

While I was looking for a solution, I ran across [Berryconda](https://github.com/jjhelmus/berryconda), a Conda distribution specifically for Raspbian Jessie (Buster seems to work too). To install Berryconda with Python 3.6:

```bash
curl -OL https://github.com/jjhelmus/berryconda/releases/download/v2.0.0/Berryconda3-2.0.0-Linux-armv7l.sh
bash ./Berryconda3-2.0.0-Linux-armv7l.sh
```

You'll need to follow the CLI prompts to finish the installation.

Alternatively, you could just add the following Berryconda channel to your Miniconda installation to get the same effect:

```bash
conda config --add channels rpi
```
