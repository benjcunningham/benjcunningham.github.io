<h1 align="center">
💬 benjcunningham.org
</h1>

<p align="center">
  <a href="https://github.com/benjcunningham/benjcunningham.github.io/actions/workflows/tests.yaml">
    <img alt="tests" src="https://github.com/benjcunningham/benjcunningham.github.io/actions/workflows/tests.yaml/badge.svg">
  </a>
</p>

This repository is the source of my personal blog, live at
[benjcunningham.org](https://benjcunningham.org/).

## Development

The blog is served by GitHub Pages and powered by Jekyll. Most entries can be
created as simple Markdown in `_posts`. However, there is some built-in support
for entries created with R Markdown, bringing the complete dependency list to:

- Jekyll
- LaTeX
- Make
- Pandoc
- Python (`pip install -r requirements.txt`)
- R

Assuming the above requirements have been met, the site can be built on your
local machine with `jekyll serve`.

Note that the live, GitHub Pages-served version of the site is entirely driven
by the contents of `_posts` and therefore does not depend on the above
additional requirements; `_plugins/render-rmd.rb`, and transitively `Makefile`
and `build.R`, drive these additional requirements for supporting R Markdown.
