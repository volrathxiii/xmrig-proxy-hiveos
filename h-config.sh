#!/usr/bin/env bash

# HiveOS Custom Miner Configuration Generator
# This script reads HiveOS config values and generates a miner config file.
# Location: /hive/miners/custom/xmrig-proxy/h-config.sh

. /hive-config/hive.conf
. /hive/miners/custom/$CUSTOM_MINER/h-manifest.conf

# HiveOS passes miner config via env vars (e.g., from your Flight Sheet)
CUSTOM_CONFIG_FILENAME=/hive/miners/custom/$CUSTOM_MINER/config.json
CUSTOM_LOG_FILE=/var/log/miner/custom.log

echo "Generating config for $CUSTOM_MINER..."
echo "---------------------------------------"

# Example variables passed from HiveOS flight sheet (see note below)
POOL_URL=${CUSTOM_URL:-"pool.minexmr.com:443"}
WALLET=${CUSTOM_USER:-"YOUR_WALLET_ADDRESS"}
WORKER=${CUSTOM_WORKER:-"hiveos-worker"}
EXTRA_ARGS=${CUSTOM_TEMPLATE:-""}

cat > $CUSTOM_CONFIG_FILENAME <<EOF
{
  "autosave": true,
  "background": false,
  "colors": true,
  "log-file": "$CUSTOM_LOG_FILE",
  "retries": 5,
  "retry-pause": 5,
  "print-time": 60,
  "syslog": false,
  "threads": 1,
  "pools": [
    {
      "url": "$POOL_URL",
      "user": "$WALLET",
      "pass": "$WORKER",
      "keepalive": true,
      "tls": true
    }
  ],
  "custom_args": "$EXTRA_ARGS"
}
EOF

echo "✅ Config generated at: $CUSTOM_CONFIG_FILENAME"
