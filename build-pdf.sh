#!/bin/zsh
# Lager PDF-ene av brukerveiledningene med Google Chrome. Kjør etter endringer i guide/*.html.
set -e
cd "$(dirname "$0")/guide"
chrome="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
for pair in "brukerveiledning.html:Varde-brukerveiledning.pdf" "user-guide.html:Varde-user-guide.pdf"; do
  "$chrome" --headless=new --disable-gpu --no-pdf-header-footer --allow-file-access-from-files \
    --virtual-time-budget=5000 --print-to-pdf="${pair#*:}" "file://$PWD/${pair%%:*}" 2>/dev/null
done
