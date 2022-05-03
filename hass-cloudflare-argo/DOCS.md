# Cloudflare Argo Home Assistant Add-on

## Configuration

1. Setup Cloudflare Tunnel as indicated [here](https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/install-and-setup/tunnel-guide/#set-up-a-tunnel-locally-cli-setup) follow step 1-3.
2. Add Cloudflare DNS CNAME record pointing `{hostname}` to `{UUID}.cfargotunnel.com`.
3. Upload file in `~/.cloudflared/{UUID}.json` to `/config/cloudflare_argo/{UUID}.json`.
4. Config `use_x_forwarded_for`, `external_url` and `trusted_proxies` into "main configuration".
```
homeassistant:
  external_url: "https://{hostname}"
http:
  use_x_forwarded_for: true
  trusted_proxies: 
     - 172.30.33.0/24
```
5. Config Addon `hostname` with `{hostname}` and `uuid` with `{UUID}`.
6. Restart home assistant And Start Addon.
