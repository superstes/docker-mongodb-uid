#!/bin/bash

set -euo pipefail

# edit and copy 'docker-compose.yml' to the target server
# define these vars:
#  mongodb_version_min: '5.0.17'
#  mongodb_user: 'mongodb'
#  mongodb_user_id: '1200'
#  docker_compose_path: '/etc/containers/mongodb.yml'
#  mongodb_patch_file: '/etc/containers/mongodb_dockerfile'

# make sure to copy the 'Patch_Dockerfile' to 'mongodb_patch_file'

groupadd --gid "$mongodb_user_id" "$mongodb_user"
useradd --gid "$mongodb_user_id" --gid "$mongodb_user" "$mongodb_user"

docker build -t "local/mongodb:${mongodb_version_min}" -f "$mongodb_patch_file" .
