#!/bin/bash

SERVERCFG=${1}
VARS="$(set | grep -E 'ttt_.*=' | sed "s/\'//g")"
echo > ${SERVERCFG}
for VAR in "${VARS}"; do
  echo "${VAR}" | sed 's/ttt_//g' | awk -F= '{
    if ($2 ~ /^[0-9]*$/)
      print $1 " " $2;
    else
      print $1 " \"" $2 "\"";
    }' >> ${SERVERCFG}
done
