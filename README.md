# docker-pandoc [![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/mokolea/pandoc)](https://hub.docker.com/r/mokolea/pandoc) [![Docker Image Size (tag)](https://img.shields.io/docker/image-size/mokolea/pandoc/latest)](https://hub.docker.com/r/mokolea/pandoc)

Test markdown using pandoc v2.9.n

[![Release](https://img.shields.io/github/release/Mokolea/docker-pandoc.svg)](https://github.com/Mokolea/docker-pandoc/releases)

## Markdown
 - https://daringfireball.net/projects/markdown/syntax

## Pandoc
 - https://pandoc.org/
 - https://github.com/jgm/pandoc

## Usage
 - Start new container from a current markdown-project directory: `$ docker run -it -v $(pwd):/data --name pandoc -h pandoc mokolea/pandoc:latest`
 - Optional: Set user and group IDs to override the default image user (1000:1000) by using parameter:
    - `-u root` for root user
    - `-u $(id -u):$(id -g)` for current host user (experimental - does not work without additional configuration)
 - Subsequent use of the same stopped container: `$ docker start -ai pandoc`
 - Create bash shell session in the already running container: `$ docker exec -it pandoc bash`

## Test
```
docker@pandoc:/data$ pandoc --version
pandoc 2.9
Compiled with pandoc-types 1.20, texmath 0.12, skylighting 0.8.3
Default user data directory: /home/docker/.local/share/pandoc or /home/docker/.pandoc
Copyright (C) 2006-2019 John MacFarlane
Web:  http://pandoc.org
This is free software; see the source for copying conditions.
There is no warranty, not even for merchantability or fitness
for a particular purpose.
docker@pandoc:/data$ 

docker@pandoc:/data$ pandoc -o hello-world.pdf hello-world.md

docker@pandoc:/data$ pandoc -s -o hello-world.html hello-world.md --metadata pagetitle="hello-world"
```

## TODO
 - Add hello-world.md

## Done
 - Setup appropriate user to not run pandoc as root and so not have generated files from root in host file system

-- Mario
