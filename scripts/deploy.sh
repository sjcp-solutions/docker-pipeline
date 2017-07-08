#!/bin/bash
set -x #echo on

echo \{\"source_type\":\"Tag\",\"source_name\":\"\$TRAVIS_TAG\"\} > tag-template.json
envsubst < tag-template.json > tag-body.json
curl -X POST -H "Content-Type: application/json" -d "@./tag-body.json" "$RELEASE_URL"
