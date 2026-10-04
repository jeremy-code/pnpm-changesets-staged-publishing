#!/bin/bash

pnpm stage publish --recursive --report-summary \
  | jq -c '.publishedPackages[] | { name, version }' $PWD/pnpm-publish-summary.json > $CHANGESETS_OUTPUT
