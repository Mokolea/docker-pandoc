# docker-pandoc [![Size](https://img.shields.io/microbadger/image-size/mokolea/pandoc.svg)](https://hub.docker.com/r/mokolea/pandoc) [![Layers](https://img.shields.io/microbadger/layers/mokolea/pandoc.svg)](https://hub.docker.com/r/mokolea/pandoc)

Test markdown using pandoc v2.7.n

[![Release](https://img.shields.io/github/release/Mokolea/docker-pandoc.svg)](https://github.com/Mokolea/docker-pandoc/releases)

## Markdown
 - https://daringfireball.net/projects/markdown/syntax

## Pandoc
 - https://pandoc.org/
 - https://github.com/jgm/pandoc

## Usage
 - Start container from current markdown-project directory: `$ docker run -it -v $(pwd):/data --name pandoc -h pandoc mokolea/pandoc:latest`
 - Optional: Set user and group IDs to override the default image user (1000:1000) by using parameter:
    - `-u root` for root user
    - `-u $(id -u):$(id -g)` for current host user (experimental - does not work without additional configuration)
 - Subsequent use of the same container: `$ docker start -ai pandoc`
 - Start bash shell in the already running container: `$ docker exec -it pandoc bash`

## Test
```
docker@pandoc:/data$ pandoc --version
pandoc 2.7.2
Compiled with pandoc-types 1.17.5.4, texmath 0.11.2.2, skylighting 0.7.7
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
