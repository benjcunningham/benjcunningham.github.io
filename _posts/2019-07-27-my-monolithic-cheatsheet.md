---
layout: post
title: "My Monolithic Cheatsheet"
date: 2019-07-27
tags: [linux, python]
---

This post is going to be one big cheatsheet for some of the software I use most often. I think my single guiding principle will be to list only the most useful commands that I tend to forget. I imagine that means this page will be under construction for a long time. 👷

# Bash

Clear screen: `Ctrl + l`

Go to beginning of line: `Ctrl + a`

Go to end of line: `Ctrl + e`

Move back / forward by a word: `Alt + b` `Alt + f`

Delete to beginning of line: `Ctrl + u`

Delete to end of line: `Ctrl + k`

Edit long command in Vim: `Ctrl + x, Ctrl + e`

# Docker

Install on Linux: `curl -sSL https://get.docker.com/ | sh`

Pull an image: `docker pull NAME`

List containers: `docker ps [-a, for all]`

Start a container: `docker start NAME`

Stop a container: `docker stop NAME`

Build an image: `docker build .` `docker build - < Dockerfile` `docker build github.com/user/repo`

Remove an image `docker rmi NAME`

Load an image from an archive: `docker load < NAME.tar.gz`

Save an image as an archive: `docker save NAME > NAME.tar`

# Python

## conda

Install Miniconda: Download installer [here](https://docs.conda.io/en/latest/miniconda.html), then `bash Miniconda3-latest-Linux-x86_64.sh`

Update conda: `conda update conda`

List environments: `conda env list`

Create new environment: `conda create --name NAME python=3.6`

Activate an environment: `conda activate NAME`

Install package with pip: `pip install NAME`

Install package with conda: `conda install NAME`

## pip

List packages: `pip list`

Install package: `pip install NAME` `pip install -r requirements.txt`

Uninstall package: `pip uninstall NAME`


## virtualenv / virtualenvwrapper

Create a new environment: `mkvirtualenv [-r requirements.txt] NAME`

List available environments: `workon`

Use an environment: `workon NAME`

Stop using an environment: `deactivate`

Remove an environment: `rmvirtualenv NAME`

# Vim

Switch encoding of file: `:set fileformat=unix`

# tmux

Start new session: `tmux` `tmux new -s NAME`

List sessions: `tmux ls`

Attach session `tmux attach -t NAME`

Kill session: `tmux kill-session -t NAME`

Make horizontal split (vertical line): `Ctrl + b, "`

Make vertical split (horizontal line): `Ctrl + b, %`
