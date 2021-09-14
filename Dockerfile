ARG BUILD_FROM
FROM $BUILD_FROM


ARG BUILD_ARCH
RUN \
    set -x \
    && if [ "${BUILD_ARCH}" = "armhf" ]; \
        then \
            wget -O /usr/local/bin/cloudflared https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm; \
	elif [ "${BUILD_ARCH}" = "armv7" ]; \
	then \
            wget -O /usr/local/bin/cloudflared https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm; \
        elif [ "${BUILD_ARCH}" = "aarch64" ]; \
        then \
	    wget -O /usr/local/bin/cloudflared https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64; \
        elif [ "${BUILD_ARCH}" = "amd64" ]; \
        then \
	    wget -O /usr/local/bin/cloudflared https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64; \
	else \
	    wget -O /usr/local/bin/cloudflared https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-386; \
	fi

RUN chmod a+x /usr/local/bin/cloudflared	

COPY data/argo.yml /etc/cloudflared/config.yml

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]