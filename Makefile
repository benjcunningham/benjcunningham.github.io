.PHONY: clean
clean:
	rm -rf _site

.PHONY: lint
lint: clean
	bash scripts/lint-dictionaries.sh
	npx cspell "**"
	npx jscpd .
