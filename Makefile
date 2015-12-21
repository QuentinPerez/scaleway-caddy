NAME =			caddy
VERSION =		latest
VERSION_ALIASES = 0.8.0 0.8 0
TITLE =			Caddy
DESCRIPTION =		Fast general-purpose HTTP/2 web server for any platform.
SOURCE_URL =		https://github.com/scaleway-community/scaleway-caddy
VENDOR_URL =		https://caddyserver.com

IMAGE_VOLUME_SIZE =     50G
IMAGE_BOOTSCRIPT =      stable
IMAGE_NAME =            Caddy 0.8.0


## Image tools  (https://github.com/scaleway/image-tools)
all:	docker-rules.mk
docker-rules.mk:
	wget -qO - http://j.mp/scw-builder | bash
-include docker-rules.mk
