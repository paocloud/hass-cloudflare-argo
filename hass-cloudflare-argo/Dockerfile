ARG BUILD_FROM
FROM $BUILD_FROM

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ARG BUILD_ARCH
RUN \
    set -x \
    && if [ "${BUILD_ARCH}" = "armhf" ]; \
        then \
            wget -O cloudflared https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm; \
	elif [ "${BUILD_ARCH}" = "armv7" ]; \
	then \
            wget -O cloudflared https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm; \
    elif [ "${BUILD_ARCH}" = "aarch64" ]; \
    then \
	    wget -O cloudflared https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64; \
    elif [ "${BUILD_ARCH}" = "amd64" ]; \
    then \
	    wget -O cloudflared https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64; \
	elif [ "${BUILD_ARCH}" = "i386" ]; \
    then \
	    wget -O cloudflared https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-386; \
    else \
        echo 'NOT VALID BUILD'; exit 1; \
	fi \
    && mv cloudflared /usr/local/bin/cloudflared \
    && chmod a+x /usr/local/bin/cloudflared


COPY rootfs /
WORKDIR /
