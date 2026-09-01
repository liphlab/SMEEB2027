#!/usr/bin/env bash
# Starts a local preview of the SMEEB 2027 website.
# Usage:  ./preview.sh
# Open http://localhost:4000 in your browser once it says "Server running...".
# Leave this running in its terminal; press Ctrl+C to stop it.
# Every time you save a change to a file, refresh the browser to see it.
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")"

if ! command -v bundle3.2 >/dev/null 2>&1; then
	echo "bundle3.2 not found. One-time setup needed:" >&2
	echo "  sudo apt install ruby-dev build-essential zlib1g-dev" >&2
	echo "  bundle3.2 install" >&2
	exit 1
fi

if [ ! -d vendor/bundle ]; then
	echo "Gems not installed yet. Running 'bundle3.2 install' first..."
	bundle3.2 install
fi

echo "Starting preview server..."
exec bundle3.2 exec jekyll serve --baseurl "" --host 127.0.0.1 --port 4000
