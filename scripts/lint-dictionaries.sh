#!/bin/bash

set -eo pipefail

GREEN="\033[0;32m"
RED="\033[0;31m"
NC="\033[0;0m"

dicts=($(find ".cspell" -name "*.txt"))
issues=0

for i in "${!dicts[@]}"; do

    iter="$((i + 1))/${#dicts[@]}"
    dict="${dicts[$i]}"
    diff_with_sorted=$(sort -u "${dict}" | diff - "${dict}" || true)

    if [ -z "${diff_with_sorted}" ]; then
        echo -e "${iter} ${dict} ${GREEN}OK${NC}"
    else
        echo -e "${iter} ${dict} ${RED}FAIL${NC}"
        echo "${diff_with_sorted}"
        issues=$((issues + 1))
    fi

done

echo "lint-dictionaries: Checked: ${dicts}, Issues: ${issues}"

if [ "$issues" -gt "0" ]; then
    exit 1
fi
