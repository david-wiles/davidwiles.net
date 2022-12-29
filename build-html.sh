#!/bin/bash

# Use tmpl on each html file to build
# Something like this should be used for each html file:
tmpl -of www/index.html -vf html/index.vars html/index.html