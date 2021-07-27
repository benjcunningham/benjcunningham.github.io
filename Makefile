.PHONY: build clean

css_dirs := _sass
md_dirs := _posts

install:
	npm install

quality:
	markdownlint --config .ci/.markdownlint.yaml $(md_dirs)
	npx stylelint $(css_dirs) --config .ci/.stylelintrc

style:
	markdownlint --config .ci/.markdownlint.yaml --fix $(md_dirs)
	npx stylelint $(css_dirs) --config .ci/.stylelintrc --fix
