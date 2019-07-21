all: build clean

.PHONY: build
build:
	Rscript build.R

.PHONY: clean
clean:
	rm -f $(shell find assets | grep \.dvi$)
