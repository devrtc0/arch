#!/usr/bin/env sh

if [ $# -ne 2 ]; then
    echo 'wrong arguments number'
    echo 'usage: ./decode_configuration.sh <password> <profile name from profiles directory>'
    exit -1
fi

CONF_DIR=$(dirname "$0")
PROFILES_DIR="$CONF_DIR/profiles"

[ ! -f "$PROFILES_DIR/$2" ] && echo "no profile '$PROFILES_DIR/$2' exists" && exit -1

rm -f "$CONF_DIR/plain_configuration"
cat "$PROFILES_DIR/$2" | base64 --decode | gpg --passphrase "$1" --decrypt --batch --quiet --output "$CONF_DIR/plain_configuration"
