#!/bin/bash

# Read html directory recursive, filter .html files
for p in $(find html -name '*.html' -not -path 'html/templates/*'); do
  OUTFILE="www/${p#html/}";
  VARFILE="$(dirname $p)/$(basename $p .html).vars"

  mkdir -p $(dirname "${OUTFILE}")

  # If the filename is list.html, then set the file's directory as -vd
  if [ $(basename $p) == "list.html" ]; then
    tmpl -of ${OUTFILE} -vd $(dirname $p) $p;
  elif [ -f "${VARFILE}" ]; then
    tmpl -of ${OUTFILE} -vf ${VARFILE} $p;
  else
    tmpl -of ${OUTFILE} $p;
  fi
done
