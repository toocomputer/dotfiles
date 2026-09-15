#!/bin/sh
printf "Pane name: "
read -r name
[ -z "$name" ] && exit 0

result=$("$HERDR_BIN_PATH" pane split --pane "$ORIGIN_PANE" --direction "$SPLIT_DIR" --focus)
new_id=$(printf '%s' "$result" | sed -n 's/.*"pane_id":"\([^"]*\)".*/\1/p' | head -1)

[ -n "$new_id" ] && "$HERDR_BIN_PATH" pane rename "$new_id" "$name"
