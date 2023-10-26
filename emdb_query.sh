#!/bin/bash

# Script to search EMDB from the command line and download search results
# Use the -h flag to get help on usage.

if ! command -v curl &> /dev/null
then
    echo "'curl' could not be found. You need to install 'curl' for this script to work."
    exit 1
fi

echo "$@"

# usage: script_name search_string

curl -X 'GET' \
  "https://www.ebi.ac.uk/emdb/api/search/$@?fl=emdb_id%2Ctitle%2Cresolution%2Cfitted_pdbs%2Cxref_UNIPROTKB%2Cxref_ALPHAFOLD" \
  -H 'accept: text/csv' \
  -H 'X-CSRFToken: fXJIBIxS0as6wbgs1qpsLws2gctH0UXF9M6UTeWCKU3chgpJZpoRPs9tGPrTSYOx' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache'
