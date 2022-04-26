.PHONY: lint
lint:
	npx cspell "**"
	npx jscpd .
