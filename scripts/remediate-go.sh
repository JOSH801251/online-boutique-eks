
#!/usr/bin/env bash

# Centralized Go dependency remediation
# Services: checkoutservice, frontend, productcatalogservice, shippingservice

GO_IMAGE="golang:1.26.4-alpine"

SERVICES=(
  "frontend"
  "productcatalogservice"
  "shippingservice"
)

FAILED=()

for SERVICE in "${SERVICES[@]}"; do
  echo ""
  echo "========================================"
  echo "Processing: $SERVICE"
  echo "========================================"

  if [ ! -f "src/$SERVICE/go.mod" ]; then
    echo "ERROR: go.mod not found for $SERVICE"
    FAILED+=("$SERVICE")
    continue
  fi

  if MSYS_NO_PATHCONV=1 docker run --rm \
    -v "$PWD/src/$SERVICE:/app" \
    -w /app \
    "$GO_IMAGE" \
    sh -c '
      set -e
      go get golang.org/x/crypto@v0.58.0 \
             golang.org/x/net@v0.62.0 \
             golang.org/x/text@v0.43.0 \
             google.golang.org/grpc@v1.83.2

      go mod tidy
      go test ./...
    '
  then
    echo "SUCCESS: $SERVICE"
  else
    echo "FAILED: $SERVICE"
    FAILED+=("$SERVICE")
  fi
done

echo ""
echo "========================================"
echo "REMEDIATION SUMMARY"
echo "========================================"

if [ ${#FAILED[@]} -eq 0 ]; then
  echo "All remaining Go services passed."
else
  echo "Services requiring attention:"
  for SERVICE in "${FAILED[@]}"; do
    echo "- $SERVICE"
  done
fi
