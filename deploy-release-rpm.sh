#!/usr/bin/env bash

set -x -e

NEXUS_ACCOUNT=$1
NEXUS_PASSWORD=$2
REPO_URL=$3

if ! [ -f "release.properties" ]; then
  echo "No release.properties found. First run mvn release:prepare"
  exit 1
fi

TAG=$(grep )