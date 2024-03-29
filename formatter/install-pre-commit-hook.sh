#!/bin/sh

FORMATTER_DIR="$(dirname $0)"
GIT_HOOK_DIR="$FORMATTER_DIR/../.git/hooks"
mkdir -p $GIT_HOOK_DIR
cp $FORMATTER_DIR/pre-commit $GIT_HOOK_DIR/pre-commit
chmod +x $GIT_HOOK_DIR/pre-commit
curl -o $GIT_HOOK_DIR/tvdformat.jar -L https://github.com/Trivadis/plsql-formatter-settings/releases/download/sqlcl-22.2.1/tvdformat.jar
echo "pre-commit hook installed in $GIT_HOOK_DIR/pre-commit."
