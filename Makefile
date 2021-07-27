.PHONY: build clean

css_dirs := _sass
md_dirs := _posts

install:
	brew install markdownlint-cli
	npm install stylelint stylelint-config-primer

quality:
	markdownlint --config .ci/.markdownlint.yaml $(md_dirs)
	npx stylelint $(css_dirs) --config .ci/.stylelintrc

style:
	markdownlint --config .ci/.markdownlint.yaml --fix $(md_dirs)
	npx stylelint $(css_dirs) --config .ci/.stylelintrc --fix
