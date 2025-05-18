#!/bin/bash

set -e

WORKSPACES=("namespace" "details" "ratings" "reviews" "productpage")

for SERVICE in "${WORKSPACES[@]}"; do
  echo "=== Deploying: $SERVICE ==="
  cd "$SERVICE"

  terraform init
  terraform plan -out=tfplan
  terraform apply -auto-approve tfplan

  cd ..
  echo "=== $SERVICE deployed successfully ==="
done

echo "✅ All Terraform workspaces have been deployed."
