#!/bin/sh
set -e
set -x

echo "Activating feature 'Vespa'..."
# Fetching the latest Vespa release version
echo 'Fetching the latest Vespa release version...'
curl -s https://api.github.com/repos/vespa-engine/vespa/releases/latest | jq -r '.tag_name' | sed 's/v//' > /tmp/vespa_version

# Storing the version in a variable
VERSION=$(cat /tmp/vespa_version)
echo "Latest Vespa version: $VERSION"

# Downloading and extracting the Vespa CLI
echo 'Downloading and extracting the Vespa CLI...'
curl -fsSL "https://github.com/vespa-engine/vespa/releases/download/v${VERSION}/vespa-cli_${VERSION}_linux_amd64.tar.gz" | tar -zxf -

# Making the Vespa CLI executable available system-wide
echo 'Making the Vespa CLI executable available system-wide...'
ln -sf "$(pwd)/vespa-cli_${VERSION}_linux_amd64/bin/vespa" /usr/local/bin/vespa

chmod +x /usr/local/bin/vespa