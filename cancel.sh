#!/usr/bin/env bash

# Runner issue: cannot read input from env directly in composite action
# see https://github.com/actions/runner/issues/665
BUILD_LIMIT=${INPUT_BUILD_LIMIT:-10}

echo "Checking last ${BUILD_LIMIT} builds for in queue or in progress build..."

npx -p eas-cli eas build:list --limit=${BUILD_LIMIT} |
  grep -B 3 "Status *\(in queue\|in progress\)" |
  grep ID |
  sed -e 's|ID[[:space:]]\+||' |
  tr '\n' '\0' |
  xargs -0 -n1 --no-run-if-empty npx -p eas-cli eas build:cancel
