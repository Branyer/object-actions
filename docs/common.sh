#!/bin/bash

# Resolve relative paths to absolute based on the location of this file
SCRIPT_DIR=$(cd . && pwd) # /app in docker
# SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd) # /app in docker
echo "running common in $SCRIPT_DIR"

# Default values
projectname="newproject"  # Default project name
types=""
permissions=""
output=""

# Function to derive machinename from projectname
get_machinename() {
    echo "$1" | tr '[:upper:]' '[:lower:]' | sed 's/[^[:alnum:]]\+/-/g' | sed 's/^-\|-$//g'
}

# CLI argument parsing
while [[ $# -gt 0 ]]; do
    case "$1" in
        --project)
            projectname="$2"
            shift 2
            ;;
        --types)
            types="$2"
            shift 2
            ;;
        --permissions)
            permissions="$2"
            shift 2
            ;;
        --output)
            output="$2"
            shift 2
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

# Derive machinename
machinename=$(get_machinename "$projectname")

# Ensure project directory exists or create it
if [ ! -d "$machinename" ]; then
    mkdir -p "$machinename"
fi

# Get the absolute path
stackpath=$(realpath "$machinename") # /app/newproject in docker

resolve_absolute_path() {
    local path="$1"
    if [[ "$path" == /* ]]; then
        echo "$path"  # Already absolute
    else
        echo "$SCRIPT_DIR/$path"  # Make relative paths absolute
    fi
}

# Resolve paths for types and permissions
csvpath=$(resolve_absolute_path "${types:-objects.csv}")
permissionspath=$(resolve_absolute_path "${permissions:-permissions.csv}")


# Export all variables for use in scripts
export machinename csvpath permissionspath output SCRIPT_DIR stackpath projectname
