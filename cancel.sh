#!/usr/bin/env bash

echo "Checking last ${INPUT_BUILD_LIMIT} builds for in queue or in progress build..."

npx -p eas-cli eas build:list --limit=${INPUT_BUILD_LIMIT} |
  grep -B 3 "Status *\(in queue\|in progress\)" |
  grep ID |
  sed -e 's|ID[[:space:]]\+||' |
  tr '\n' '\0' |
  xargs -0 -n1 --no-run-if-empty npx -p eas-cli eas build:cancel
