# Notes

## Existing images
- chpio/cjdns has no tools, needed by `ipfs-swarm.sh`
  - Needs `/opt/cjdns/publictoip6`
  - Make my own image
    - **How do other containers get peer lists?**
      - Write them to disk every 30 secs or something?
      - Maybe script outside docker that runs and checks stuff? - messy
- yggdrasil
  - Change endpoint for `yggdrasilctl`

## Testing
- [x] Does CJDNS and Ygg work?
  - [ ] Together?

## Install
- [ ] Make multiple docker-compose files for different setups
- [ ] Have `first-run.sh` ask which one you want to setup
  - Copy appropriate one to new file `docker-compose.yml`
  - Run rest of script

## Start
- `start.sh` runs startup commands, like starting `ipfs-swarm.sh`
- Better way to do this without maintaining separate images?

## Extra mods
- Setup h-dns and h-ntp as part of CJDNS install (optionally)

## Other images
- CJDNS with tools
- Generic debian image for accessing everything?
  - Install extra-tools in there?
  - Install scripts like `ipfs-swarm.sh` in there
- [ ] mesh_webserver
  - Nginx based
  - Run `APP` html commands after install depending on what was installed
- [ ] mesh_nodeinfo?
- [ ] mesh_ipfs-pi-stream
- [ ] mesh_cjdns-iptunnel
- [ ] mesh_yggdrasil-iptunnel
- [ ] ssb-patchfoo
  - Already on Docker?
- ??

## Misc
- Allow a mesh-point image to work by sharing the right device to the container??
- 