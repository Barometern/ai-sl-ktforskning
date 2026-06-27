#!/usr/bin/env bash

set -euo pipefail

required_paths=(
  "README.md"
  "LICENSE"
  "CONTRIBUTING.md"
  "CODE_OF_CONDUCT.md"
  "SECURITY.md"
  "CHANGELOG.md"
  "STYLE_GUIDE.md"
  "ROADMAP.md"
  "docs"
  "architecture"
  "knowledge"
  "workflows"
  "prompts"
  "templates"
  "specs"
  "examples"
  "src"
  "tests"
  "assets"
  "scripts"
  ".github/ISSUE_TEMPLATE"
  ".github/workflows"
)

for path in "${required_paths[@]}"; do
  if [[ ! -e "$path" ]]; then
    echo "Missing required path: $path"
    exit 1
  fi
done

echo "Structure validation passed."
