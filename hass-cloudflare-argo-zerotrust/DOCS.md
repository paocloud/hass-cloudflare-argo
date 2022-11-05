# Cloudflare Argo Home Assistant Add-on

## Configuration

1. Setup Cloudflare Tunnel remotely (Dashboard setup) as indicated [here](https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/install-and-setup/tunnel-guide/#set-up-a-tunnel-remotely-dashboard-setup) follow step 1 Create a tunnel.
2. Config Addon `token` with `{token}` on step 1 finished dashboard.
![token](https://developers.cloudflare.com/cloudflare-one/static/documentation/connections/connect-apps/connector.png)
3. Connect an application as indicated [here](https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/install-and-setup/tunnel-guide/remote/#set-up-a-tunnel-remotely-dashboard-setup) follow step 2 Connect an application ,`subdomain` with `{subdomain}`, `domain` with `{domain}` and `service` with `{http://127.0.0.1:8123}`. 
4. Config `use_x_forwarded_for`, `external_url` and `trusted_proxies` into "main configuration".
```
homeassistant:
  external_url: "https://{subdomain}.{domain}"
http:
  use_x_forwarded_for: true
  trusted_proxies: 
     - 127.0.0.1
```
5. Restart home assistant And Start Addon.
