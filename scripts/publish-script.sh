#!/bin/bash

pnpm stage publish --recursive --reporter silent --json --dry-run \
  | jq --compact-output '.[] | {type: "git-tag", tag: .id, packageName: .name}' > $CHANGESETS_OUTPUT

pnpm stage publish --recursive --report-summary --dry-run

cat pnpm-publish-summary.json \
  | jq --compact-output '.publishedPackages[] | {type: "git-tag", tag: .id, packageName: .name}' > $CHANGESETS_OUTPUT


pnpm stage publish
