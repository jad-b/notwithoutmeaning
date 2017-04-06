.PHONY: dev  serve
serve:
	hugo serve --bind 0.0.0.0

dev:
	hugo  serve --bind 0.0.0.0 -D
