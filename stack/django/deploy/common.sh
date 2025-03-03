#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PARENT_DIR=$(realpath ".")

source "$SCRIPT_DIR/functions.sh"

# Find root .env
ENV_FILE="$1"

# Load variables from root .env
if [ -f "$ENV_FILE" ]; then
  # Remove entire lines that are comments
  env_content=$(grep -vE '^\s*#' "$ENV_FILE")

  # Strip inline comments
  env_content=$(echo "$env_content" | sed 's/[[:space:]]*#.*//')

  # Remove any 'export ' prefix
  env_content=$(echo "$env_content" | sed 's/^export //')

  # Export the variables
  export $(echo "$env_content" | xargs)
else
  echo ".env file not found at $ENV_FILE. Please create a .env file with the necessary variables."
  exit 1
fi

# Sanitize and export GCP_BUCKET_APP_NAME and GCP_BUCKET_API_NAME if they exist
if [ -n "$GCP_BUCKET_APP_NAME" ]; then
  SANITIZED_GCP_BUCKET_APP_NAME=$(sanitize_bucket_name "$GCP_BUCKET_APP_NAME")
  export GCP_BUCKET_APP_NAME="$SANITIZED_GCP_BUCKET_APP_NAME"
fi

if [ -n "$GCP_BUCKET_API_NAME" ]; then
  SANITIZED_GCP_BUCKET_API_NAME=$(sanitize_bucket_name "$GCP_BUCKET_API_NAME")
  export GCP_BUCKET_API_NAME="$SANITIZED_GCP_BUCKET_API_NAME"
fi

# Check if necessary variables are set
missing_vars=()
for var in "${REQUIRED_VARS[@]}"; do
  if [ -z "${!var}" ]; then
    missing_vars+=("$var")
  fi
done

if [ ${#missing_vars[@]} -ne 0 ]; then
  echo "The following required environment variables are missing:"
  for var in "${missing_vars[@]}"; do
    echo " $var"
  done
  exit 1
fi
