#!/bin/bash

SOURCE_DIR='www'
read -p "Target copy folder: " TARGET_DIR
read -p "Keyword: " KEYWORD

if [[ ! -d "$SOURCE_DIR" ]]; then
  echo "Folder $SOURCE_DIR not found"
  exit 1
fi

mkdir -p "$TARGET_DIR"

find "$SOURCE_DIR" -name "*$KEYWORD*" | while IFS= read -r ITEM; do
  REL_PATH="${ITEM#$SOURCE_DIR}"
  DEST_PATH="$TARGET_DIR$REL_PATH"

  if [[ -d "$ITEM" ]]; then
    mkdir -p "$DEST_PATH"
    cp -a "$ITEM/"* "$DEST_PATH/" 2>/dev/null
    echo "The folder (with all its contents) was copied: $ITEM -> $DEST_PATH"
  elif [[ -f "$ITEM" ]]; then
    mkdir -p "$(dirname "$DEST_PATH")"
    cp -a "$ITEM" "$DEST_PATH"
    STATUS=$?
    [[ $STATUS -eq 0 ]] && MSG="OK" || MSG="FAIL"
    echo "File copied: $ITEM -> $DEST_PATH [$MSG]"
  fi
done
