#!/bin/bash

pnpm stage publish --recursive --report-summary --dry-run \
  | jq -c '.publishedPackages[] | { name, version }' $PWD/pnpm-publish-summary.json > $CHANGESETS_OUTPUT

pnpm stage publish --recursive
