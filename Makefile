.PHONY: install serve build deploy

install:
	bundle install

serve: install
	bundle exec jekyll serve --watch

build: install
	bundle exec jekyll build

deploy:
	git add --all
	find media -name '*.jpg' | xargs git-lfs track
	git add --all
	git commit -av
	$(MAKE) build
	rsync -av _site/ home:/srv/alorenzi_eu/
