#!/bin/bash

# Read html directory recursive, filter .html files
for p in $(find html -name '*.html' -not -path 'html/templates/*'); do
  OUTFILE="www/${p#html/}";
  VARFILE="$(dirname $p)/$(basename $p .html).vars"

  mkdir -p $(dirname "${OUTFILE}")

  # Call tmpl for each file and its associated varfile
  if [ -f "${VARFILE}" ]; then
    tmpl -of ${OUTFILE} -vf ${VARFILE} $p;
  else
    tmpl -of ${OUTFILE} $p;
  fi
done
