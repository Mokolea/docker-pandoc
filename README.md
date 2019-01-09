# docker-pandoc [![Show download size and number of layers](https://images.microbadger.com/badges/image/mokolea/pandoc.svg)](https://cloud.docker.com/u/mokolea/repository/docker/mokolea/pandoc)

Test pandoc...

## Markdown
 - https://daringfireball.net/projects/markdown/syntax

## Pandoc
 - https://pandoc.org/
 - https://github.com/jgm/pandoc

## Usage
 - docker run -it -v $(pwd):/data --name pandoc25 -h pandoc25 mokolea/pandoc:2.5
 - docker start -ai pandoc25
 - docker exec -it pandoc25 bash

## Test
```
root@pandoc25:/data# pandoc --version
pandoc 2.5
Compiled with pandoc-types 1.17.5.4, texmath 0.11.1.2, skylighting 0.7.5
Default user data directory: /root/.pandoc
Copyright (C) 2006-2018 John MacFarlane
Web:  http://pandoc.org
This is free software; see the source for copying conditions.
There is no warranty, not even for merchantability or fitness
for a particular purpose.
root@pandoc25:/data# 
```


-- Mario
