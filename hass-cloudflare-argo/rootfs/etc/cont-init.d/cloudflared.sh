#!/usr/bin/with-contenv bashio
# ==============================================================================
# Configures tunnel
# ==============================================================================

HOSTNAME=$(bashio::config 'hostname')
UUID=$(bashio::config 'uuid')
HA_PORT=$(bashio::core.port)

mkdir -p /data/bin

# Check Config
if ! bashio::config.has_value 'hostname' || ! bashio::config.has_value 'uuid'; then
    bashio::exit.nok "Setting a hostname and uuid is required !"
fi

# Check credentials file
if ! [ -f "/config/cloudflare_argo/$UUID.json" ]; then
    bashio::exit.nok "Credentials file does not exists !"
fi

# Prepare config file
sed -i "s#%%HOSTNAME%%#$HOSTNAME#g" /etc/cloudflared/config.yml
sed -i "s#%%UUID%%#$UUID#g" /etc/cloudflared/config.yml
sed -i "s/%%HA_PORT%%/$HA_PORT/g" /etc/cloudflared/config.yml

# Recovery last version
if [ -f "/data/bin/cloudflared" ]; then
    cp /data/bin/cloudflared /usr/local/bin/cloudflared
fi

# Check update and backup
bashio::log.info "Check Update cloudflare daemon."
if ! cloudflared update; then
    cp /usr/local/bin/cloudflared /data/bin/cloudflared
fi
