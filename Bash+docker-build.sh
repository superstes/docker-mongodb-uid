#!/bin/bash

set -euo pipefail

# define these vars:
#  mongodb_version: '5.0'
#  mongodb_version_min: '5.0.17'
#  mongodb_user: 'mongodb'
#  mongodb_user_id: '1200'

build_dir='/etc/containers/build_mongodb'

groupadd --gid "$mongodb_user_id" "$mongodb_user"
useradd --gid "$mongodb_user_id" --gid "$mongodb_user" "$mongodb_user"

mkdir -p "$build_dir"

wget https://github.com/docker-library/mongo/archive/refs/heads/master.zip -O "${build_dir}/master.zip"
cd "$build_dir"
unzip 'master.zip'

# patch dockerfile
sed -i "s/ 999 / ${mongodb_user_id} /g" "$build_dir/mongo-master/${mongodb_version}/Dockerfile"
sed -i "s/^ENV MONGO_VERSION.*$/ENV MONGO_VERSION ${mongodb_version_min}/g" "$build_dir/mongo-master/${mongodb_version}/Dockerfile"

# fix for 'permission denied on docker-entrypoint.sh'; running chmod 755 on it
sed -i "s|COPY docker-entrypoint\.sh \/usr\/local\/bin\/\nENTRYPOINT \[\"docker-entrypoint\.sh\"\]|COPY docker-entrypoint.sh /usr/local/bin/\nRUN chmod 775 /usr/local/bin/docker-entrypoint.sh\nENTRYPOINT [\"docker-entrypoint.sh\"]|g" "$build_dir/mongo-master/${mongodb_version}/Dockerfile"

# optional: change keyserver to user port 80 because of firewalling issue
sed -i "s| keyserver.ubuntu.com | hkp://keyserver.ubuntu.com:80 |g" "$build_dir/mongo-master/${mongodb_version}/Dockerfile"

docker build -t "local/mongodb:${mongodb_version_min}" -f "$build_dir/mongo-master/${mongodb_version}/Dockerfile" "$build_dir/mongo-master/${mongodb_version}"
