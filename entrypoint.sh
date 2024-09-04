#!/bin/bash

# Set safe Bash options
set -euo pipefail

# Check if required command 'doctl' is available
command -v doctl >/dev/null 2>&1 || { echo >&2 "doctl is required but it's not installed. Aborting."; exit 1; }

# Function to get the UUID of the active garbage collection
get_active_gc_uuid() {
    local uuid
    uuid=$(doctl registry garbage-collection list --format UUID,Status | tail -n +2 | egrep -v "succeeded|cancelled" | awk '{print $1}')
    echo "$uuid"
}

# Function to cancel the currently active garbage collection
cancel_active_gc() {
    local active_gc_uuid
    active_gc_uuid=$(get_active_gc_uuid)

    if [[ -n "$active_gc_uuid" ]]; then
        echo "Cancelling the active garbage collection (UUID: $active_gc_uuid)..."
        doctl registry garbage-collection cancel "$active_gc_uuid"
        echo "Active garbage collection cancelled."
    else
        echo "No active garbage collection to cancel."
    fi
}

# Main function
main() {
    # Cancel the current garbage collection if it's running
    cancel_active_gc
}

# Execute the main function
main
