ARG BUILD_FROM
FROM $BUILD_FROM

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ARG BUILD_ARCH
RUN \
    set -x \
    && apt-get update \
    && apt-get install -y --no-install-recommends dpkg wget \
    && if [ "${BUILD_ARCH}" = "armhf" ]; \
        then \
            wget -O cloudflared-linux.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm.deb; \
	elif [ "${BUILD_ARCH}" = "armv7" ]; \
	then \
            wget -O cloudflared-linux.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm.deb; \
        elif [ "${BUILD_ARCH}" = "aarch64" ]; \
        then \
	    wget -O cloudflared-linux.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64.deb; \
        elif [ "${BUILD_ARCH}" = "amd64" ]; \
        then \
	    wget -O cloudflared-linux.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb; \
	else \
	    wget -O cloudflared-linux.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-386.deb; \
	fi \
    && dpkg --force-all -i cloudflared-linux.deb


COPY data/argo.yml /etc/cloudflared/config.yml

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]