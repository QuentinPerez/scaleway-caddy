## -*- docker-image-name: "scaleway/caddy:latest" -*-
FROM scaleway/golang:1.5.2
MAINTAINER Scaleway <opensource@scaleway.com> (@scaleway)


# Prepare rootfs for image-builder
RUN /usr/local/sbin/builder-enter


# Install Caddy
ENV CADDY_VERSION=0.8.0
RUN go get -tags="v$CADDY_VERSION" github.com/mholt/caddy \
 && useradd -M caddy || true \
 && echo "session required pam_limits.so" >> /etc/pam.d/su


# Patch rootfs
ADD patches/etc/ /etc
ADD patches/var/ /var


# Enable Caddy service
RUN update-rc.d caddy defaults


# Clean rootfs from image-builder
RUN /usr/local/sbin/builder-leave
