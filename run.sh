#!/bin/sh
set -e

QUERY=".${RESOLVER}.Certificates[] | select(.domain.main==\"${DOMAIN}\")"

CERT=$(cat $INPUT_PATH | jq -r "$QUERY | .certificate" | base64 -d)
KEY=$(cat $INPUT_PATH | jq -r "$QUERY | .key" | base64 -d)

if [ "$CERT" == "" ] ;then
  echo "certificate for $DOMAIN was not found in $INPUT_PATH"
else
  PEM="$CERT

$KEY"

  if [ "$PEM" == "$(cat $OUTPUT_PATH)" ] ;then
    echo "certificate for $DOMAIN did not change, keeping $OUTPUT_PATH"
  else
    echo "certificate for $DOMAIN changed, updating $OUTPUT_PATH"
    echo "$PEM" > $OUTPUT_PATH
  fi
fi

if [ "$1" == "" ] ;then
  echo "Watching $INPUT_PATH for changes"
  exec inotifyd /run.sh "$INPUT_PATH:c"
fi
