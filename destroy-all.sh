#!/bin/bash

set -e

# Reverse order for safe teardown
WORKSPACES=("productpage" "reviews" "ratings" "details" "namespace")

for SERVICE in "${WORKSPACES[@]}"; do
  echo "=== Destroying: $SERVICE ==="
  cd "$SERVICE"

  terraform init
  terraform destroy -auto-approve

  cd ..
  echo "=== $SERVICE destroyed successfully ==="
done

echo "🗑️ All Terraform workspaces have been destroyed."
