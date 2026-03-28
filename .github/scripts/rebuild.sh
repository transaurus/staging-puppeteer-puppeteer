#!/usr/bin/env bash
set -euo pipefail

# Rebuild script for puppeteer/puppeteer
# Runs on existing source tree (no clone). Installs deps and builds.
# Expected to run from the website/ directory (docusaurusRoot).

# --- Node version ---
export NVM_DIR="$HOME/.nvm"
if [ -s "$NVM_DIR/nvm.sh" ]; then
    # shellcheck source=/dev/null
    . "$NVM_DIR/nvm.sh"
    nvm use 22 2>/dev/null || nvm install 22
fi
echo "[INFO] Using Node $(node --version)"
echo "[INFO] Using npm $(npm --version)"

# --- Dependencies ---
npm install

# --- Build ---
npm run build

echo "[DONE] Build complete."
