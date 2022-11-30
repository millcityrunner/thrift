#!/usr/bin/env bash

set -e

if [ $# -ne 2 ]; then
    echo "Usage: $0 expected_version actual_version" > /dev/stderr
    echo > /dev/stderr
    echo "Check if the expected_version is satisfied by actual_version." > /dev/stderr
    echo "Note that expected_version may contain globs. That is, '0.12.1-*' is satisfied by both '0.12.1-dev' and '0.12.1-dev2'." > /dev/stderr
    echo > /dev/stderr
    echo "Example:" > /dev/stderr
    echo > /dev/stderr
    echo '    $ '"$0"' "0.12.1-*" 0.12.1-dev' > /dev/stderr
    echo '    matches' > /dev/stderr
    echo '    $ echo $?' > /dev/stderr
    echo '    $ 0' > /dev/stderr
    echo > /dev/stderr
    echo '    $ '"$0"' "0.12.1-*" 0.12.2-dev' > /dev/stderr
    echo '    no match' > /dev/stderr
    echo '    $ echo $?' > /dev/stderr
    echo '    $ 1' > /dev/stderr
    exit 1
fi

expected_version=$1
actual_version=$2

# Note: this inconsistency with quotation marks is intentional: we want any
# asterisks in `$expected_version` to be treated as globs for the purposes of
# this string comparison.
# shellcheck disable=SC2053
if [[ "$actual_version" = $expected_version ]]; then
    echo "matches"
    exit 0
else
    echo "no match"
    exit 1
fi