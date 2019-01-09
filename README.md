# docker-pandoc

Test markdown using pandoc v2.5

## Markdown
 - https://daringfireball.net/projects/markdown/syntax

## Pandoc
 - https://pandoc.org/
 - https://github.com/jgm/pandoc

## Usage
 - Start container from markdown directory: `docker run -it -v $(pwd):/data --name pandoc25 -h pandoc25 mokolea/pandoc:latest`
 - Subsequent use of the same container: `docker start -ai pandoc25`
 - Start bash shell in the already running container: `docker exec -it pandoc25 bash`

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

root@pandoc25:/data# pandoc -o hello-world.pdf hello-world.md

root@pandoc25:/data# pandoc -s -o hello-world.html hello-world.md --metadata pagetitle="hello-world"
```


-- Mario
