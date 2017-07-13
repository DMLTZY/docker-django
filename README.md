## docker-django

Demo Django App bind Mysql using Docker

## Environments

* OS X EI Capitan 10.11.6
* Docker version: 17.03.1-ce

## Prerequisites

Install docker from [https://docs.docker.com/docker-for-mac/install/](https://docs.docker.com/docker-for-mac/install/), and get start [https://docs.docker.com/docker-for-mac/](https://docs.docker.com/docker-for-mac/)

## Run

```bash
$ git clone https://github.com/DMLTZY/docker-django.git
$ cd docker-django
$ docker-compose up
```

wait a minute...

if you can see below, it success

```bash
web_1  | Django version 1.8.7, using settings 'dj_demo.settings'
web_1  | Starting development server at http://0.0.0.0:8001/
web_1  | Quit the server with CONTROL-C.
```

test [http://localhost:8005/](http://localhost:8005/)

connect database with

`host:127.0.0.1`

`port:8009`

`username:djangodocker`

`password:djangodocker`

`database:django_docker`

## Tree

```bash
.
├── Dockerfile
├── README.md
├── dj_demo			<-- replace with your app
│   ├── dj_demo
│   └── manage.py
├── docker-compose.yml
├── mysql
│   └── data			<-- will save database from docker
├── requirements.txt
└── wait-for.sh			<-- from https://github.com/Eficode/wait-for
```

## Attentions

1. I use alpine image except mysql.
2. I change the [images source](https://store.docker.com/) that's slow in my country. :joy:

## Basic commands

1. show running containers

	```bash
    $ docker ps
    ```

2. show all containers

	```bash
    $ docker ps -a
    ```

3. show downloaded docker images

	```bash
    $ docker images
	```

4. Run a command in a new container

	```bash
    $ docker run --rm --name=container_name -it dockerdjango_web sh
	```

    `$ exit`or`ctrl+d`to back to your host terminal

5. Run a command in a running container

	```bash
    $ docker exec -it bf72189a3c51 sh
    ```

    you can find like `bf72189a3c51` in `$ docker ps` as CONTAINER ID

6. create customed image with Dockerfile

	```bash
    $ cd docker-djangno
    $ docker build --rm -t pymysqlclient .  # point means current directory
    $ docker images  # check
    ```

7. 发布镜像到docker hub

	```bash
    $ docker login  # login to your docker hub
    $ docker tag dockerdjango_web dmltzy/dockerdjango
    $ docker images  # check
    $ docker push dmltzy/dockerdjango  # like git push
    ```

## Tips

1. clear all containers

	```bash
    $ docker ps -a | awk 'NR>1 { print $1 }' | xargs docker rm
	```

2. delete specific images

	```bash
    $ docker images | grep 'dockerdjango_web' | awk '{ print $3 }' | xargs docker rmi
    ```

## References

1. [https://docs.docker.com/](https://docs.docker.com/)
2. [https://docs.docker.com/engine/reference/builder/](https://docs.docker.com/engine/reference/builder/)
3. [https://docs.docker.com/compose/compose-file/](https://docs.docker.com/compose/compose-file/)
4. [https://docs.docker.com/compose/startup-order/](https://docs.docker.com/compose/startup-order/)
5. [http://hub.daocloud.io/](http://hub.daocloud.io/)
6. [https://www.capside.com/labs/deploying-full-django-stack-with-docker-compose/](https://www.capside.com/labs/deploying-full-django-stack-with-docker-compose/)
7. [https://howchoo.com/g/y2y1mtkznda/getting-started-with-docker-compose-and-django](https://howchoo.com/g/y2y1mtkznda/getting-started-with-docker-compose-and-django)
8. [https://www.stavros.io/posts/how-deploy-django-docker/](https://www.stavros.io/posts/how-deploy-django-docker/)
9. [https://yeasy.gitbooks.io/docker_practice/content/](https://yeasy.gitbooks.io/docker_practice/content/)
10. [http://goinbigdata.com/docker-run-vs-cmd-vs-entrypoint/](http://goinbigdata.com/docker-run-vs-cmd-vs-entrypoint/)
11. [http://www.cnblogs.com/CloudMan6/p/6875834.html](http://www.cnblogs.com/CloudMan6/p/6875834.html)