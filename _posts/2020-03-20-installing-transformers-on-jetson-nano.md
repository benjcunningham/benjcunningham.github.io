---
layout: post
title: "Installing Transformers on Jetson Nano"
date: 2020-03-20
tags: [Linux, Python, PyTorch]
---

I'm finally back to playing around with my Jetson Nano. Transformers (in
current and previous forms) has been my favorite library over the past 18
months or so. I decided to play around with it this evening, but found that it
wasn't trivial to install on this device. Here's my guide to getting up and
running:

## Create Virtual Environment

```bash
pip install virtualenvwrapper
mkvirtualenv transformers
deactivate
workon transformers
```

## Install PyTorch

A common theme in Jetson guides is that many libraries don't have Python wheels
for Jetson Nanos' ARM `aarch64` architecture. Fortunately, in the case of
PyTorch itself, it's easy enough to find downloadable wheels on the Nvidia
forums. Install PyTorch 1.4.0 and a few dependencies with:

```bash
wget https://nvidia.box.com/shared/static/ncgzus5o23uck9i5oth2n8n06k340l6k.whl -O torch-1.4.0-cp36-cp36m-linux_aarch64.whl
sudo apt-get install libopenblas-base
pip install Cython
pip install numpy torch-1.4.0-cp36-cp36m-linux_aarch64.whl
```

## Install SentencePiece

At the time of writing, if you try to `pip install transformers` at this point,
you'll first run into issues with SentencePiece. Google doesn't have recent
versions, besides this problematic latest release, available on PyPI. This is
a bit annoying, but it's easy enough to checkout an older tag (0.1.84) and
install from source:

```bash
git clone https://github.com/google/sentencepiece
git checkout tags/v0.1.84
cd sentencepiece/python
python setup.py install
```

## Install Tokenizers

Within the last few months, HuggingFace introduced Tokenizers, a dependency of
and closely related sibling library to Transformers. Tokenizers accelerates
things with Rust, so you'll need to have it installed:

```bash
curl https://sh.rustup.rs -sSf | sh
rustc --version
```

The second line probably won't work until you restart your session (this will
add the Rust compiler to your `.bashrc`). If you're connected via SSH, you
probably just want to `exit` and then reconnect. After you do this, try that
line again to make sure everything is setup correctly.

At this point, you shouldn't have any issue installing with Pip:

```bash
pip install tokenizers
```

## Install Transformers

At this point, you should be able to install Transformers (2.5.1, as of
writing):

```bash
pip install transformers
```

I realized after the fact that this reinstalled / downgraded Tokenizers to the
exact version listed by Transformers, so I could have skipped the Pip install
of it before. It didn't hurt anything, though.

Make sure to _really_ prove to yourself that everything is working by jumping
into a terminal, importing the library, and playing around with it. Maybe load
a pre-trained model or use `torch.cuda.is_available()` to make sure CUDA is
being used.

🚀
