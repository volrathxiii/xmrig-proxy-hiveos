#!/usr/bin/env bash
cd $(dirname "$0")

echo "[CUSTOM] Starting XMRig Proxy..."
echo "Pool: $CUSTOM_URL"
echo "User: $CUSTOM_TEMPLATE"
echo "Extra config: $CUSTOM_USER_CONFIG"

# Validate pool scheme
if [[ "$CUSTOM_URL" != stratum*://* ]]; then
  echo "[ERROR] Pool URL missing scheme! Use stratum+tcp:// or stratum+ssl://"
  exit 1
fi

./xmrig-proxy -o "$CUSTOM_URL" -u "$CUSTOM_TEMPLATE" -p "$CUSTOM_PASS" $CUSTOM_USER_CONFIG
