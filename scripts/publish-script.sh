#!/bin/bash

pnpm stage publish --reporter silent --json --dry-run \
  | jq -c '.[] | {type: "git-tag", tag: "\(.name)@\(.version)", packageName: .name}' > $CHANGESETS_OUTPUT

pnpm stage publish
