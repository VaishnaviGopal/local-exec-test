#!/bin/sh
set -e

echo "[TEST] Safe export:"
eval "export VAR=42"
echo "VAR=$VAR"

echo "[TEST] Safe echo of dangerous keyword:"
eval "echo rm is not being executed"

echo "[TEST] Dangerous command (should be blocked):"
eval "rm -rf /" || echo "Blocked as expected"

echo "[TEST] Multi-command (should be blocked):"
eval "echo hello; rm -rf /" || echo "Blocked as expected"

echo "[TEST] Obfuscated attempt (should be blocked):"
eval "r""m -rf /" || echo "Blocked as expected"

echo "[TEST] Base64 decode with eval (should be blocked):"
ENCODED=$(echo "rm -rf /" | base64)
eval "$(echo "$ENCODED" | base64 -d)" || echo "Blocked as expected"

echo "[TEST] Safe jq-based variable assignment:"
eval "$(echo '{"key":"abc123"}' | jq -r '@sh "API_KEY=\(.key)"')"
echo "API_KEY=$API_KEY"
