#!/bin/bash

# Read html directory recursive, filter .html files
for p in $(find html -name '*.html' -not -path 'html/templates/*'); do
  OUTFILE="www/${p#html/}";
  VARFILE="$(dirname $p)/$(basename $p .html).vars"
  DATAFILE="$(dirname $p)/.vars"

  mkdir -p $(dirname "${OUTFILE}")

  # If the filename is list.html, then set the file's directory as -vd
  tmpl -v ${DATAFILE} -v ${VARFILE} -o ${OUTFILE} $p
done
