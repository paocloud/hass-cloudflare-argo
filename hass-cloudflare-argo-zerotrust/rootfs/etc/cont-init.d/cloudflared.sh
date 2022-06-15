#!/usr/bin/with-contenv bashio
# ==============================================================================
# Configures tunnel
# ==============================================================================

TOKEN=$(bashio::config 'token')

mkdir -p /data/bin

# Check Config
if ! bashio::config.has_value 'token'; then
    bashio::exit.nok "Setting a token is required !"
fi

#validate token base64
if ! echo "$TOKEN" | base64 -d; then
    bashio::exit.nok "Setting a token is not valid !"
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
