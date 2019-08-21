#!/usr/bin/env bash
#
# Copyright (C) 2015 DANS - Data Archiving and Networked Services (info@dans.knaw.nl)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
set -x -e

NEXUS_ACCOUNT=$1
NEXUS_PASSWORD=$2
REPO_URL=$3
BUILDDIR=$4
SNAPSHOT=${5:-"false"}
RPM=$(ls -1 $BUILDDIR/rpm/*/RPMS/*/*.rpm)

if [[ "$SNAPSHOT" == "true" ]] && ! [[ $RPM =~ "SNAPSHOT" ]]; then
  echo "Not a snapshot RPM: $RPM"
  exit 1
fi

curl -v --user "$NEXUS_ACCOUNT:$NEXUS_PASSWORD" --upload-file $RPM "$REPO_URL/$(basename $RPM)"
