#!/bin/bash
set -eo pipefail

docker run --rm -i hadolint/hadolint < Dockerfile
