.PHONY: dev serve setup publish

setup:
	sudo snap install hugo
	# Setup public repo as a subtre
	git subtree add --prefix public public master --squash

# Build the production files
SRC_FILES=$(shell find archetypes/ content/ layouts/ static/ -type f)
public: $(SRC_FILES)
	rm -rf public/* && hugo

# Publish files to public site
publish: public
	git commit -m "$$(date +%Y%B%d) Updating public site" public
	git subtree push --prefix public public master

serve:
	snap run hugo serve --bind 0.0.0.0

dev:
	snap run hugo  serve --bind 0.0.0.0 -D
