#!/bin/bash

docker run --rm \
  -v "/etc/letsencrypt:/etc/letsencrypt" \
  -v "/var/lib/letsencrypt:/var/lib/letsencrypt" \
  -v "/var/log/letsencrypt:/var/log/letsencrypt" \
  -v "/etc/letsencrypt/cloudflare.ini:/cloudflare.ini:ro" \
  certbot/dns-cloudflare renew \
  --dns-cloudflare-credentials /cloudflare.ini \
  --dns-cloudflare-propagation-seconds 30

if [ $? -eq 0 ]; then
  docker restart 3x-ui
fi