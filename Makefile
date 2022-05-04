.PHONY: clean
clean:
	rm -rf _site

.PHONY: lint
lint: clean
	npx cspell "**"
	npx jscpd .
