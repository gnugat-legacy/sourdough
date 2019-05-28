#!/usr/bin/env bash

echo ''
echo '// Tests'
echo ''

SHORT_HELP="$0 [-h] [-d]"

_PHPSPEC_FORMAT='--format=dot'
_PHPUNIT_FORMAT=''
while getopts ":hd" opt; do
    case $opt in
        h)
            echo 'Usage:'
            echo "  $SHORT_HELP"
            echo ''
            echo 'Options:'
            echo '  -h     Display this help message'
            echo '  -d     Display test as documentation'
            echo ''
            echo 'Help:'
            echo '  Run the tests:'
            echo ''
            echo "    $0"
            echo ''
            echo '  We can also display the technical documentation:'
            echo ''
            echo "    $0 -d"
            echo ''
            exit 0
            ;;
        d)
            _PHPSPEC_FORMAT='--format=pretty'
            _PHPUNIT_FORMAT='--testdox'
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

rm -rf var/cache/test var/log/test.log
mkdir -p config/routings
composer --quiet dump-autoload --optimize
php bin/console --quiet --env=test cache:clear
php bin/console --quiet --env=test cache:warm

vendor/bin/phpunit $_PHPUNIT_FORMAT && \
    vendor/bin/phpspec --no-interaction run $_PHPSPEC_FORMAT
