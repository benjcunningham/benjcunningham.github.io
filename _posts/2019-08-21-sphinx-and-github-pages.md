---
layout: post
title: "Sphinx &amp; GitHub Pages"
date: 2019-08-21
tags: [Documentation, GitHub, Python]
---

I really like the practice of [documenting projects using
Sphinx](https://pythonhosted.org/an_example_pypi_project/sphinx.html) (take
a look at the [PyTorch docs](https://pytorch.org/docs/stable/index.html)
specifically for a great example), but it hasn't always been clear to me how to
host the resulting website. Recently, I ran across a few random projects,
though, that make use of GitHub Pages for that and incidentally do it in
a fairly unoffensive way.

GitHub Pages is awesome (it's how I host this blog), and if you're familiar
with it, you know that you can pretty easily turn a repo of HTML (or even
Markdown, with Jekyll) files into a website. However, it wasn't clear to me
whether there was an elegant way to achieve this with Sphinx. It's trivial to
create Sphinx docs out of the box, but the obvious solution is to commit the
generated files into your codebase. I really don't like the pattern of
committing anything generated by code into your codebase, so didn't want to do
that.

Instead, I noticed that the projects I was running across were making use of
the `gh-pages` branch and a Makefile. Here's the full solution at a glance:

- Build the Sphinx docs
- Checkout the `gh-pages` branch
- Add and commit the generated files into `gh-pages`
- Checkout the previous branch and clean the build

All of the previous points can be done inside a Makefile, so you just need to
`make github` whenever you want to generate the docs. For a full proof of
concept, take a look at
[`benjcunningham/sphinx-docs-example`](https://github.com/benjcunningham/sphinx-docs-example).
