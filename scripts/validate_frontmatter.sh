#!/usr/bin/env bash

set -euo pipefail

required_keys=(
  title:
  purpose:
  scope:
  audience:
  dependencies:
  related_documents:
  status:
  maintainer:
  revision_history:
)

while IFS= read -r file; do
  first_line="$(head -n 1 "$file")"
  if [[ "$first_line" != "---" ]]; then
    echo "Missing frontmatter start: $file"
    exit 1
  fi

  for key in "${required_keys[@]}"; do
    if ! grep -q "^$key" "$file"; then
      echo "Missing frontmatter key '$key' in $file"
      exit 1
    fi
  done

  for section in "## TODO Checklist" "## Future Improvements" "## References"; do
    if ! grep -q "^$section" "$file"; then
      echo "Missing section '$section' in $file"
      exit 1
    fi
  done
done < <(find . -name "*.md" -not -path "./.git/*" | sort)

echo "Frontmatter validation passed."
