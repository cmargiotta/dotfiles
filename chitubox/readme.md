To generate a working chitubox docker image:

`docker-compose up`
`docker commit chitubox_chitubox chitubox:done`
`docker image save chitubox:done | gzip > chitubox.tar`