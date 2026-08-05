#!/bin/bash
# Re-notify Bing / DuckDuckGo / Yandex that shragafunding.com changed.
# Run after pushing site updates:  ./resubmit-indexnow.sh
set -e
cd "$(dirname "$0")"
KEY=$(cat .indexnow-key)

read -r -d '' PAYLOAD << EOF || true
{
  "host": "shragafunding.com",
  "key": "${KEY}",
  "keyLocation": "https://shragafunding.com/${KEY}.txt",
  "urlList": [
    "https://shragafunding.com/",
    "https://shragafunding.com/privacy-policy/",
    "https://shragafunding.com/terms-of-use/"
  ]
}
EOF

echo "Submitting shragafunding.com to IndexNow..."
code=$(curl -s -o /dev/null -w "%{http_code}" -X POST "https://api.indexnow.org/IndexNow" \
  -H "Content-Type: application/json; charset=utf-8" --data "$PAYLOAD")
echo "  api.indexnow.org -> HTTP $code"

code=$(curl -s -o /dev/null -w "%{http_code}" -X POST "https://www.bing.com/indexnow" \
  -H "Content-Type: application/json; charset=utf-8" --data "$PAYLOAD")
echo "  bing.com         -> HTTP $code"

echo "Done. 200/202 means accepted."
