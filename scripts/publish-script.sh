#!/bin/bash

pnpm stage publish --recursive --report-summary

if [[ ! -f pnpm-publish-summary.json ]]; then
  echo "pnpm-publish-summary.json was not found" >&2
  exit 1
fi

jq \
  --compact-output \
  '.publishedPackages[] | {type: "git-tag", tag: "v\(.version)", packageName: .name}' \
  pnpm-publish-summary.json
  > $CHANGESETS_OUTPUT

rm -f pnpm-publish-summary.json
