#!/usr/bin/env bashio
set -e

HOSTNAME=$(bashio::config 'hostname')
UUID=$(bashio::config 'uuid')


# Prepare config file
sed -i "s#%%HOSTNAME%%#$HOSTNAME#g" /etc/cloudflared/config.yml
sed -i "s#%%UUID%%#$UUID#g" /etc/cloudflared/config.yml


bashio::log.info "Running cloudflare tunnel..."

cloudflared tunnel run --force