.PHONY: build serve

build:
	Rscript build.R
	jekyll build

serve:
	Rscript build.R
	jekyll serve
