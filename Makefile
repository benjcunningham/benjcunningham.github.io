.PHONY: install
install:
	npm install

.PHONY: clean
clean:
	rm -rf _site

.PHONY: lint
lint: clean
	bash scripts/lint-dictionaries.sh
	npx cspell "**"
	npx jscpd --gitignore .
	npx stylelint -f verbose "**/*.scss"
	npx htmlhint "**/*.html"
