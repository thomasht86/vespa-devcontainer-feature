#!/bin/sh
set -e
set -x

echo "Activating feature 'Vespa'..."

# Fetching the latest Vespa release version
echo 'Fetching the latest Vespa release version...'
VESPA_VERSION=$(curl -s https://api.github.com/repos/vespa-engine/vespa/releases/latest | jq -r '.tag_name' | sed 's/v//')
echo "Latest Vespa version: $VESPA_VERSION"

# Ensuring that the download directory exists
DOWNLOAD_DIR="/tmp/vespa-cli-${VESPA_VERSION}"
mkdir -p "$DOWNLOAD_DIR"

# Downloading and extracting the Vespa CLI
echo 'Downloading and extracting the Vespa CLI...'
curl -fsSL "https://github.com/vespa-engine/vespa/releases/download/v${VESPA_VERSION}/vespa-cli_${VESPA_VERSION}_linux_amd64.tar.gz" | tar -zxf - -C "$DOWNLOAD_DIR"

# Making the Vespa CLI executable available system-wide
echo 'Making the Vespa CLI executable available system-wide...'
ln -sf "$DOWNLOAD_DIR/vespa-cli_${VESPA_VERSION}_linux_amd64/bin/vespa" /usr/local/bin/vespa
chmod +x /usr/local/bin/vespa
