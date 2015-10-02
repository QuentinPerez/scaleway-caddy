NAME =			caddy
VERSION =		latest
VERSION_ALIASES =	0.7.6
TITLE =			caddy
DESCRIPTION =		Fast general-purpose HTTP/2 web server for any platform.
SOURCE_URL =		https://github.com/scaleway/image-app-caddy
VENDOR_URL =		http://golang.org

IMAGE_VOLUME_SIZE =     50G
IMAGE_BOOTSCRIPT =      stable
IMAGE_NAME =            Golang


## Image tools  (https://github.com/scaleway/image-tools)
all:	docker-rules.mk
docker-rules.mk:
	wget -qO - http://j.mp/scw-builder | bash
-include docker-rules.mk
