#!/bin/bash

set -e
set -x

source dev-container-features-test-lib

# Check if 'vespa' command is available
check "vespa command is available" which vespa

reportResults