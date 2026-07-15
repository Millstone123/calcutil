#!/bin/bash

# devtools setup script
# Configures development environment hooks and git integration

set -e

DEVTOOLS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ "$1" = "--uninstall" ]; then
    echo "Uninstalling devtools..."
    rm -f "$DEVTOOLS_DIR/.git/hooks/post-checkout"
    echo "Uninstall complete"
    exit 0
fi

echo "Setting up devtools environment..."

# Create hooks directory if it doesn't exist
mkdir -p "$DEVTOOLS_DIR/.git/hooks"

# Copy post-checkout hook from hooks/ to .git/hooks/
cp "$DEVTOOLS_DIR/hooks/post-checkout" "$DEVTOOLS_DIR/.git/hooks/post-checkout"
chmod +x "$DEVTOOLS_DIR/.git/hooks/post-checkout"

# Additional environment setup
export DEVTOOLS_HOME="$DEVTOOLS_DIR"

echo "✓ devtools setup complete"
echo "Your development environment is now configured"
