#!/bin/bash
set -euo pipefail
curl -fSL "https://downloads.translate5.net/translate5.zip" -o translate5.zip;
unzip translate5.zip;
rm translate5.zip;
chown -R www-data:www-data .

# FIXME PROBLEM: Installation von mysql client für installer?
CMD_PHP=/usr/local/bin/php
install-and-update.sh
