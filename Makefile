.PHONY: lint
lint:
	npx cspell "**"
	npx jscpd --gitignore .
	npx stylelint -f verbose "**/*.scss"
