#!/bin/bash

CHANGESETS_OUTPUT=$RUNNER_TEMP/changsets-output.ndjson

pnpm stage publish --reporter silent --json --dry-run \
  | jq -c '.[] | {name, version}' > $CHANGESETS_OUTPUT

pnpm stage publish
