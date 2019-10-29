# mesh-docker

Does not work yet. Do not file issues or PRs.

Only IPFS works at the momement, with some minimal Tomesh changes applied.

## Install
```bash
git clone https://github.com/makeworld-the-better-one/mesh-docker.git
cd mesh-docker
./first-run.sh
```
`first-run.sh` runs `docker-compose up -d`, and runs a bunch of opinionated commands (for mesh reasons)
with `docker exec`.


## Dockerfiles
The `dockerfiles` folder contains all the docker files for all the custom images made for this project.
