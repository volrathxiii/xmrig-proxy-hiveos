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
WALLET=${CUSTOM_TEMPLATE:-"YOUR_WALLET_ADDRESS"}
WORKER=${CUSTOM_WORKER:-"hiveos-worker"}
EXTRA_ARGS=${CUSTOM_TEMPLATE:-""}

cat > $CUSTOM_CONFIG_FILENAME <<EOF
{
    "access-log-file": null,
    "access-password": null,
    "algo-ext": true,
    "api": {
        "id": null,
        "worker-id": null
    },
    "http": {
        "enabled": false,
        "host": "127.0.0.1",
        "port": 0,
        "access-token": null,
        "restricted": true
    },
    "background": false,
    "bind": [
        {
            "host": "0.0.0.0",
            "port": 3333,
            "tls": false
        },
        {
            "host": "::",
            "port": 3333,
            "tls": false
        }
    ],
    "colors": true,
    "custom-diff": 0,
    "custom-diff-stats": false,
    "donate-level": 0,
    "log-file": "$CUSTOM_LOG_FILE",
    "mode": "nicehash",
    "pools": [
        {
            "algo": null,
            "coin": null,
            "url": "$POOL_URL",
            "user": "$WALLET",
            "pass": "x",
            "rig-id": null,
            "keepalive": false,
            "enabled": true,
            "tls": false,
            "sni": false,
            "tls-fingerprint": null,
            "daemon": false,
            "socks5": null,
            "self-select": null,
            "submit-to-origin": false
        }
    ],
    "retries": 2,
    "retry-pause": 1,
    "reuse-timeout": 0,
    "tls": {
        "enabled": true,
        "protocols": null,
        "cert": null,
        "cert_key": null,
        "ciphers": null,
        "ciphersuites": null,
        "dhparam": null
    },
    "dns": {
        "ip_version": 0,
        "ttl": 30
    },
    "user-agent": null,
    "syslog": false,
    "verbose": false,
    "watch": true,
    "workers": true
}
EOF

echo "✅ Config generated at: $CUSTOM_CONFIG_FILENAME"
