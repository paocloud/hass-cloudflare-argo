#!/usr/bin/with-contenv bashio
# ==============================================================================
# Configures tunnel
# ==============================================================================

mkdir -p /data/bin
mkdir -p /etc/cloudflared

# Check custom config file
if [ -f "/config/cloudflare_argo/config.yml" ]; then
    cp /config/cloudflare_argo/config.yml /etc/cloudflared/config.yml
else
    bashio::exit.nok "Config file does not exists !"
fi

# Recovery last version
if [ -f "/data/bin/cloudflared" ]; then
    cp /data/bin/cloudflared /usr/local/bin/cloudflared
fi

# Check update and backup
bashio::log.info "Check Update cloudflare daemon."
if ! cloudflared update; then
    cp /usr/local/bin/cloudflared /data/bin/cloudflared
fi
