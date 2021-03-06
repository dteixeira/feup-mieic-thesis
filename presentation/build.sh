#!/bin/bash

# Build report.
if [[ "$#" -eq 1 ]]; then
  if [[ "$1" =~ s|S ]]; then
    # Remove existent PDF file.
    rm presentation.pdf 2> /dev/null
    #make presentation
    xelatex presentation
    bibtex presentation
    xelatex presentation
    xelatex presentation
    cp presentation.pdf view.pdf
    open view.pdf
  else
    echo "Invalid argument"
  fi
else
  rm presentation.pdf 2> /dev/null
  #make presentation
  xelatex presentation
  bibtex presentation
  xelatex presentation
  xelatex presentation
  cp presentation.pdf view.pdf
fi

# Clean compilation files.
make clean
