.PHONY: lint
lint:
	npx cspell "**"
	npx jscpd .
	npx stylelint -f verbose "**/*.scss"
