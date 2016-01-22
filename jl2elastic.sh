#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Usage: ./jl2elastic.sh FILENAME(JSON Lines formatted)" >&2
  exit 1
fi

file_input=$1
filename_input=$1
extension_input="${filename_input##*.}"
filename_input="${filename_input%.*}"

file_output=${filename_input}_elastic.${extension_input}

awk ' {print "{\"index\":{}}\n" $0;}' ${file_input} > ${file_output}

echo "Output: ${file_output}"