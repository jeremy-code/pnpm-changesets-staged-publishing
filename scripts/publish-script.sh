#!/bin/bash

pnpm stage publish --recursive --report-summary

if [[ ! -f pnpm-publish-summary.json ]]; then
  echo "pnpm-publish-summary.json was not found" >&2
  exit 1
fi

# $CHANGESETS_OUTPUT is a NDJSON file of this format
# https://github.com/changesets/action/blob/615034bb14e5d240e559f941ce9769beb5e14fb0/src/run.ts#L99
jq \
  --compact-output \
  '.publishedPackages[] | {type: "git-tag", tag: "v\(.version)", packageName: .name}' \
  pnpm-publish-summary.json \
  > $CHANGESETS_OUTPUT

rm -f pnpm-publish-summary.json
