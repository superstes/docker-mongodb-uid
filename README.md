# Docker MongoDB

This repo shows how to re-build the [official MonogDB image](https://hub.docker.com/_/mongo) to use a custom UID + GID.

That can be useful if you need data-persistence (_using a volume_) and want to map a host-user to the user being used by the container.

The default image uses the hardcoded UID/GID 999..

## Covered here

- [Ansible + docker-compose](https://github.com/superstes/docker-mongodb-uid/blob/main/Ansible.yml)
- [Bash + docker build](https://github.com/superstes/docker-mongodb-uid/blob/main/Bash+docker-build.sh)
- [Bash + docker-compose](https://github.com/superstes/docker-mongodb-uid/blob/main/Bash+docker-compose.sh)
