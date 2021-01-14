#!/bin/bash
set -eo pipefail

docker run --rm -i hadolint/hadolint < context/Dockerfile
