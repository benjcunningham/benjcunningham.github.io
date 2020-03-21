---
layout: post
title: "One Year Using PyTorch"
date: 2019-04-01
tags: [PyTorch, Deep Learning]
---

This is purely a brain dump, reflections on some of the things I did, learned, didn't do, and maybe didn't quite learn these past twelve months.

Just a bit over a year ago, I started a new job as a data scientist. On my first day back in the office, the rest of the data science team took some time before lunch to chat about Fast.ai, the MOOC they were auditing. I hadn't heard of Fast.ai, but when I realized it was not only an online course on deep learning but a framework, I was pretty intimidated.

I didn't know much about neural nets and even my tooling vocabulary was limited to TensorFlow and Keras. I figured I was an imposter among deep learning gods, the way my new teammates were casually picking up some must-be-niche framework. How did they even know about this thing?

As it would turn out, that day was the beginning of my (very enjoyable and not-so-intimidating-after-all) year picking up deep learning.

As of today, I still haven't used much Fast.ai (though my learning did begin by watching the v2 course lectures). Instead, I dropped into PyTorch; it's the framework that the more recent iterations of Fast.ai are built upon.

If you aren't familiar with it, PyTorch is a deep learning library based on Torch (not the same thing) and developed by Facebook. It recently hit it's version 1.0 milestone and has become a major competitor with the Google-branded frameworks, in terms of how many people are using it for research and building products. I don't personally have any desire or unique perspectives to argue about libraries (this post could easily have been "One Year Using TensorFlow" given some slightly different circumstances), but my sense of the community pulse tells me that PyTorch generally has just about everything current practitioners want. I'm happy with that.

It's difficult for me to separate my new fondness of PyTorch from the rest of my experience as a deep learning beginner. Almost everything I built used it, and because I'm a better hands-on learner, almost everything I learned was directly tied to it as well.

One of my favorite things about learning with PyTorch is the forced user-awareness of different levels of abstraction. For example, the first thing I noticed when getting started was that I had to be intentional about calculating the loss, calling `loss.backward()` to compute gradients, and taking a step with the optimizer. Before seeing this in PyTorch, I had conflated the three steps and believed them to be the problem of whoever maintained a model's magic fit method. Being forced to write them into my training loops gave me much better perspective on what was just a black box before.

Another concept PyTorch has helped me appreciate more is shaping tensors. I had used NumPy quite a bit before, but usually only delt with 1D and 2D arrays using obvious transformations. As I grew my general understanding of PyTorch and wanted to implement more adventurous modules, I found myself spending more time thinking about the shape of tensors at each stage in a computation graph. Having a tightly-coupled library for building these networks and manually manipulating data made it easy for me to fill knowledge gaps using what I already knew.

In a similar way, it was empowering to be able to use modules from the library that spanned different abstraction levels to seamlessly build my own code bases. For example, it was no harder to create a loss function from scratch with tensor methods (or even base Python infix operators) than it was to stack built-in `nn` modules. Most importantly, nearly everything I made could be dropped into new contexts or used with other blocks without any significant additional development. Everything used the same design principles and approach to execution.

In short, PyTorch was a tremendous learning companion. I couldn't have done it without its developers, educators, my teammates, community members, or even the inanimate code itself. &#128517;

A year in, I'm pretty happy with where I am and can go from here. There are certainly other newbies with much more velocity (check out the Fast.ai forums if you want to find them), but I'm content with my trajectory. I multiplied my understanding of deep learning, picked up some machine learning design principles, deployed a few products, built even more prototypes, and became a lot more comfortable reading and implementing ideas in academic papers.
