#!/usr/bin/env bash
set -euo pipefail

BASE="$HOME/knots-updater"
WORK="$BASE/work"
LOG="$BASE/logs/update.log"
BACKUP="$BASE/backups/$(date +%Y%m%d-%H%M%S)"

KEYRING="$BASE/gpg/keyring/luke-codesigning.gpg"

ARCH="x86_64-linux-gnu"

BASE_URL="https://bitcoinknots.org/files/29.x"

echo "Checking latest Bitcoin Knots release..."

VERSION=$(curl -fsSL "$BASE_URL/" \
| grep -oE '[0-9]+\.[0-9]+\.knots[0-9]+' \
| sort -V \
| tail -1)

if [ -z "$VERSION" ]; then
    echo "Could not determine latest Knots version."
    exit 1
fi

echo "Latest version: $VERSION"

FILE="bitcoin-${VERSION}-${ARCH}.tar.gz"
URL="https://bitcoinknots.org/files/29.x/${VERSION}/${FILE}"

exec > >(tee -a "$LOG") 2>&1

echo "================================="
echo "Bitcoin Knots Verified Updater"
echo "$(date)"
echo "================================="

CURRENT=$(bitcoind --version | head -n1)

CURRENT_VERSION=$(echo "$CURRENT" | grep -oP 'v[0-9]+\.[0-9]+\.knots[0-9]+' | sed 's/^v//')

echo "Current version: $CURRENT_VERSION"
echo "Target version:  $VERSION"

if [ "$CURRENT_VERSION" = "$VERSION" ]; then
    echo
    echo "Already running this version."
    echo "No update needed."
    exit 0
fi

mkdir -p "$WORK"
cd "$WORK"

echo "Downloading release files..."

wget -q -N \
"https://bitcoinknots.org/files/29.x/${VERSION}/SHA256SUMS"

wget -q -N \
"https://bitcoinknots.org/files/29.x/${VERSION}/SHA256SUMS.asc"

wget -q -N "$URL"

EXPECTED_KEY="1A3E761F19D2CC7785C5502EA291A2C45D0C504A"

echo "Checking signing key..."

gpg \
--no-default-keyring \
--keyring "$KEYRING" \
--list-keys "$EXPECTED_KEY" >/dev/null || {
    echo "Trusted signing key missing!"
    exit 1
}

echo "Checking GPG signature..."

gpg \
--no-default-keyring \
--keyring "$KEYRING" \
--verify SHA256SUMS.asc SHA256SUMS

echo "Checking SHA256..."

sha256sum -c SHA256SUMS 2>&1 | grep "$FILE"

echo "Verification successful."

echo "Creating backup..."

mkdir -p "$BACKUP"

sudo cp /usr/local/bin/bitcoind "$BACKUP/"
sudo cp /usr/local/bin/bitcoin-cli "$BACKUP/"

echo "Stopping node..."

sudo systemctl stop bitcoind

echo "Extracting..."

tar -xzf "$FILE"

DIR=$(tar -tzf "$FILE" | head -1 | cut -f1 -d"/")

echo "Installing..."

sudo install -m 0755 "$DIR/bin/"* /usr/local/bin/

echo "Starting node..."

sudo systemctl start bitcoind

sleep 15

echo "Checking service..."

systemctl is-active --quiet bitcoind

echo
echo "Installed:"
bitcoind --version

echo
echo "Update complete."
