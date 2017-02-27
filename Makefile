BOX=lenovo-home-jdb
NGINX_UID=104
NGINX_GID=107

.PHONY: deploy serve

deploy:
	# Delete old files
	rm -rf ./public
	# Generate production files
	hugo
	# Cleanup the files owned by Nginx
	docker-machine ssh $(BOX) -t sudo rm -rf ~/blog
	# Deploy to production machine
	docker-machine scp -r ./public $(BOX):~/blog
	# Make sure the files are readable by the Nginx user
	docker-machine ssh $(BOX) -t chmod -R o+rx ~/blog
	# Kick Nginx to restart
	eval $(shell docker-machine env $(box))
	docker restart archimedes_nginx_1

serve:
	hugo serve -D
