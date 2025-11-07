#!/usr/bin/env bash
cd $(dirname "$0")
printenv
echo "[CUSTOM] Starting XMRig Proxy..."
echo "Pool: $CUSTOM_URL"
echo "User: $CUSTOM_TEMPLATE"
echo "Extra config: $CUSTOM_USER_CONFIG"


./xmrig-proxy -c ./config.json $CUSTOM_USER_CONFIG
