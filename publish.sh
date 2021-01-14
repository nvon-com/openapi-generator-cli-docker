#!/bin/bash
set -eo pipefail

scriptDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [ -z "${1}" ]; then
  echo "No label provided. Exiting …" > /dev/stderr
  exit 1
fi
label=${1}

cd ${scriptDir}
./lint.sh

docker build context -t nvon/openapi-generator-cli-noroot:${label}
docker push nvon/openapi-generator-cli-noroot:${label}
