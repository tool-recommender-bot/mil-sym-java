#!/bin/bash

set +x
set -e

echo '[release] TRAVIS_TAG='$TRAVIS_TAG
echo '[release] TRAVIS_PULL_REQUEST='$TRAVIS_PULL_REQUEST

# we only publish if a tag, but not NOT PRs
if [[ -n $TRAVIS_TAG ]] && [[ "$TRAVIS_PULL_REQUEST" == "false" ]]; then
    mvn -Pinclude-sources -Pinclude-javadocs deploy --settings travis/settings.xml -DskipTests=true -e
    exit $?
fi
