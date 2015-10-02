## -*- docker-image-name: "scaleway/caddy:latest" -*-
FROM scaleway/golang:latest
MAINTAINER Scaleway <opensource@scaleway.com> (@scaleway)

# Prepare rootfs for image-builder
RUN /usr/local/sbin/builder-enter


ENV CADDY_VERSION v0.7.6

RUN go get -tags="$CADDY_VERSION" github.com/mholt/caddy

RUN useradd -M caddy || true
RUN mkdir -p /var/www/caddy/
RUN echo "Hello from caddy" > /var/www/caddy/index.html
RUN echo "caddy                hard    nofile          4096" > /etc/security/limits.d/90-nofile.conf
RUN echo "caddy                soft    nofile          4096" >> /etc/security/limits.d/90-nofile.conf
RUN echo "session required pam_limits.so" >> /etc/pam.d/su

ADD patches/etc/ /etc
RUN update-rc.d caddy defaults

# Clean rootfs from image-builder
RUN /usr/local/sbin/builder-leave
