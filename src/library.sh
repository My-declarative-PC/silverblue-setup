#!/bin/bash

# Get package version from `GitHub` repo
get_latest_version() {
    local URL=$1
    local VERSION=$(curl -fL "$URL" | sed 's/\(.*\)\(v\)\(.*".*\)/\1\3/g' | jq 'max_by(.name|split(".")|map(tonumber)).name' | xargs)
    echo "$VERSION"
}

