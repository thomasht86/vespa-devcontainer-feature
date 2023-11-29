#!/bin/bash

set -e
set -x

source dev-container-features-test-lib

# Check if 'vespa' command is available
check "vespa command is available" which vespa

# Set vespa configuration before getting it
# Replace 'your-config' with your actual configuration
check "set vespa configuration" vespa config set your-config

# Now get the configuration
check "get vespa configuration" vespa config get

reportResults