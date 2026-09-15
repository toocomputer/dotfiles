#!/bin/sh

direction="$1"

"$HERDR_BIN_PATH" plugin pane open \
  --plugin custom.pane-namer \
  --entrypoint prompt \
  --env ORIGIN_PANE="$HERDR_PANE_ID" \
  --env SPLIT_DIR="$direction"
