# Docker MongoDB

This repo shows how to re-build the [official MonogDB image](https://hub.docker.com/_/mongo) to use a custom UID + GID.

That can be useful if you need data-persistence (_using a volume_) and want to map a host-user to the user being used by the container.

The default image uses the hardcoded UID/GID 999..

## Options covered here

- Patch existing image (_faster, easier_)
  - [Ansible + docker-compose](https://github.com/superstes/docker-mongodb-uid/blob/main/Patch_Ansible.yml)
  - [Bash + docker build](https://github.com/superstes/docker-mongodb-uid/blob/main/Patch_Bash+docker-build.sh)
  - [Bash + docker-compose](https://github.com/superstes/docker-mongodb-uid/blob/main/Patch_Bash+docker-compose.sh)
- Re-Build official image
  - [Ansible + docker-compose](https://github.com/superstes/docker-mongodb-uid/blob/main/Rebuild_Ansible.yml)
  - [Bash + docker build](https://github.com/superstes/docker-mongodb-uid/blob/main/Rebuild_Bash+docker-build.sh)
  - [Bash + docker-compose](https://github.com/superstes/docker-mongodb-uid/blob/main/Rebuild_Bash+docker-compose.sh)
