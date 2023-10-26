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
  "https://www.ebi.ac.uk/emdb/api/search/$@" \
  -H 'accept: text/csv' \
  -H 'X-CSRFToken: 1ziFM3XS75jURyzFvTTdktH09yIED0uRVoFR4zmCRPU0CDIWtSSCoporzbGQv4lJ' \          # can prob delete these bottom 3
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache'

