#!/usr/bin/env bash

while IFS= read -r -d '' file; do
  bash "$file" || echo "$file" exit 1
done <   <(find ./* -maxdepth 0 -type f -name "*.sh" -not -path "./runner.sh" -print0)

