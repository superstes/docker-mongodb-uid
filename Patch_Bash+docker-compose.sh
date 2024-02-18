#!/bin/bash

set -euo pipefail

# edit and copy 'docker-compose.yml' to the target server
# define these vars:
#  mongodb_version_min: '5.0.17'
#  mongodb_user: 'mongodb'
#  mongodb_user_id: '1200'
#  docker_compose_path: '/etc/containers/mongodb.yml'

# make sure to copy the 'Patch_Dockerfile' to path specified in 'Patch_docker-compose.yml'

groupadd --gid "$mongodb_user_id" "$mongodb_user"
useradd --uid "$mongodb_user_id" --gid "$mongodb_user" "$mongodb_user"

docker-compose -f "$docker_compose_path" up
