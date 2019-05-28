#!/usr/bin/env bash

echo ''
echo '// Coding Style'
echo ''

SHORT_HELP="$0 [-h] [-f]"

_DRY_RUN='--dry-run'
_FIX=''
while getopts ":hf" opt; do
    case $opt in
        h)
            echo 'Usage:'
            echo "  $SHORT_HELP"
            echo ''
            echo 'Options:'
            echo '  -h     Display this help message'
            echo '  -f     Fix the Coding Style issues'
            echo ''
            echo 'Help:'
            echo '  Check the coding style:'
            echo ''
            echo "    $0"
            echo ''
            echo '  If some issues are found, use `-f` option to fix them:'
            echo ''
            echo "    $0 -f"
            echo ''
            exit 0
            ;;
        f)
            _DRY_RUN=''
            _FIX='-f'
            ;;
        \?)
            echo '' >&2
            echo "    [KO] The \"-$OPTARG\" option does not exist" >&2
            echo '' >&2
            echo "    $SHORT_HELP" >&2
            echo '' >&2
            exit 1
            ;;
    esac
done
unset SHORT_HELP

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/.. && pwd )"
cd $DIR

PHP_CS_FIXER_IGNORE_ENV=1 vendor/bin/php-cs-fixer fix $_DRY_RUN
