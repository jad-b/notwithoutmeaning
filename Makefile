.PHONY: dev  serve

setup:
	sudo snap install hugo

serve:
	snap run hugo serve --bind 0.0.0.0

dev:
	snap run hugo  serve --bind 0.0.0.0 -D
