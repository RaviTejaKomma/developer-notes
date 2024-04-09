# Docker Notes

No matter if you're just getting started with docker or you're already a professional, there are situations when you can't remember the correct command or you're just confused by the order of parameters.

Therefore I decided to create and share my own docker commands cheat sheet and also notes from my learnings.

You can download and install Docker on multiple platforms. Refer to the following [link](https://docs.docker.com/get-docker/) and choose the best installation path for you.

Run [docker version](https://docs.docker.com/engine/reference/commandline/version/) to check the installed docker version.

Run to **docker run docker/whalesay cowsay Hello-World!** to execute a sample docker container.

## Basics

- ### Image:
  It is a package or template which is used to create one or more containers.
- ### Container:

  These are running instances of images that are isolated and have their own envi ronments and set of processes.

- The docker containers only lives as long as the process inside it is alive. If the web
  service inside the container stopped or crashes then the container exits.

- When we run the "docker run <image>"" command. The container runs in the foreground or attached mode (i.e it will be attached to the console or the stdout of the docker container). If we provide the "-d" option to the run command the container will run in the detached mode. The container will continue to run in the background.

- If you would like to bring the container to foreground then run the "docker attach <container name/id>"

## Top 16 docker commands:

1. [docker ps](https://docs.docker.com/engine/reference/commandline/ps/)  list basic info of all running containers.

2. [docker ps -a](https://docs.docker.com/engine/reference/commandline/ps/) list all containers which previously ran, stopped and exited containers.

3. [docker pull](https://docs.docker.com/engine/reference/commandline/pull/)  download a image from [Docker Hub](https://hub.docker.com/) registry. Link to the docker image is always shown on the right at dockerhub.

4. [docker build](https://docs.docker.com/engine/reference/commandline/build/)  is used to build your own container based on a Dockerfile. Common use is **docker build .** to build a container based on the Dockerfile in the current directory (the dot). **docker build -t "myimage:latest"**. creates a container and stores the image under the given name.

5. [docker images](https://docs.docker.com/engine/reference/commandline/image/) or **docker image ls** shows all local storage images.

6. [docker run](https://docs.docker.com/engine/reference/run/)  Run a docker container based on an image, i.e. **docker run myimage -it bash**. If no local image can be found docker run automatically tries to download the image from Docker hub.

7. [docker logs](https://docs.docker.com/engine/reference/commandline/logs/) display the logs of a container, you specified. To continue showing log updates just use **docker logs -f mycontainer**

8. [docker volume ls](https://docs.docker.com/engine/reference/commandline/volume_ls/)lists the [volumes](https://docs.docker.com/storage/volumes/), which are commonly used for persisting data of Docker containers.

9. [docker network ls](https://docs.docker.com/engine/reference/commandline/network/) - list all networks available for docker container.

10. **docker network connect** adds the container to the given container network. That enables container communication by simple container name instead of IP.

11. [docker rm](https://docs.docker.com/engine/reference/commandline/rm/) removes one or more containers. **docker rm mycontainer**, but make sure the container is not running.

12. [docker rmi](https://docs.docker.com/engine/reference/commandline/rmi/) removes one or more images. **docker rmi myimage**, but make sure no running container is based on that image. Before doing this we need to stop and delete all dependent containers.

13. [docker stop](https://docs.docker.com/engine/reference/commandline/stop/) stops one or more containers. **docker stop mycontainer** stops one container, while **docker stop $(docker ps -a -q)** stops all running containers.

14. [docker start](https://docs.docker.com/engine/reference/commandline/start/) - starts a stopped container using the last state.

15. [docker update](https://docs.docker.com/engine/reference/commandline/update/) --restart=no updates container policies, that is especially helpful when your container is stuck in a crash loop.

16. [docker cp](https://docs.docker.com/engine/reference/commandline/cp/) to copy files from a running container to the host or the way around. **docker cp :/etc/file .** to copy /etc/file to your current directory.

## Some combinations that help a lot:

- Kill all running containers with **docker kill $(docker ps -q)**

- Delete all stopped containers with **docker rm $(docker ps -a -q)**

- Delete all images with **docker rmi $(docker images -q)** Remember, you should remove all the containers before removing all the images from which those containers were created.

- Update and stop a container that is in a crash-loop with **docker update --restart=no && docker stop**

- Bash shell into container **docker exec -i -t /bin/bash** - if bash is not available use /bin/sh

- Bash shell with root if container is running in a different user context **docker exec -i -t -u root /bin/bash**

## What about resource usage?

Get docker container including size: **docker ps -s**

Get docker container disk utilization: **docker system df**

## What about wasted resources?

The first command is used to remove local container images that are not used by any container and are not tagged. Its a pretty safe command to clean up your local filesystem

[docker image prune](https://docs.docker.com/config/pruning/)

If you want to clean up and delete all unused container images, just add -a

**docker image prune -a**

only clean up container images that have been created over 24 hours ago run

**docker image prune -a --filter "until=24h"**

same can be done with container, that are not running anymore

**docker container prune**

---

### RUN - STDIN

- **docker run -i -t <image>** Runs in an interactive mode.

### RUN - Port Mapping/Publishing

- **docker run -p 80:5000 <image>** maps port 5000 of the application running in the container to the port 80 of docker host.

### RUN - Volume Mapping

- Data will be stored in the /var/lib/mysql in docker container

- **docker run -v /opt/datadir:/var/lib/mysql mysql** maps /var/lib/mysql directory of the database running in the container to the external location /opt/datadir. Now the data will remain even if we delete the docker container.

### Inspect container:

**docker inspect <container name/id>**

### Environment variables:

To see the env variables of a running container use docker inspect.

**docker run -e variable_name=value container-name**

**Ex:** docker run -e APP_COLOR=blue simple-webapp-color

---

### Create new image:

Sample file

```
FROM Ubuntu

RUN apt-get update
RUN apt-get install python

RUN pip install flask
RUN pip install flask-mysql

COPY . /opt/source-code  <- Copy the source code to the specified location of docker container from local system

ENTRYPOINT FLASK_APP=/opt/source-code/app.py flask run
```

It builds in a layered architecture.

Then run **docker build .**

**Ex:** docker build Dockerfile -t username/container-name

### Specify a command in the docker file

```
CMD <command> <arguements>
or
CMD ["command", "arg1", "arg2"]
```

**Ex:** CMD sleep 5 or CMD ["sleep", "5"]

ENTRYPOINT ["sleep"]

To specify a default value for the command
ENTRYPOINT ["sleep"]
CMD ["5"]

If the value is specified then 5 will be overwritten with that value.

We can also override the command in entrypoint during run time using "--entrypoint <command>" during docker run

Ex: docker run --entrypoint sleep2 ubuntu-sleeper 10

---

### Networking:

- **docker network ls** command to list all the networks.
- **docker inspect <container-name>** to find the network settings.

When we install docker it creates 3 networks by default.

1. bridge
2. none
3. host

Bridge network:

- bridge is the default network a container gets attached to. If we would like to associate any other network with the container, you specify the network information using the network command line parameter "--network=none".

- bridge n/w is a private internal n/w created by docker host. All containers get attached to this network and usually in the range 170.2.17 series.

- The containers can access each other using this internal IP.

Host network:

- To access any of these containers from the outside world, map the ports of these containers to the ports of docker host.

- Another way to access the containers externally is to associate the containers to the host network. This takes out any network isolation between the docker host and the containers meaning if we want to run a web server on port 5000 in a web app container it is automatically as accessible on the same port externally without requring any port mapping as the webapp container uses the hosts network. This would also mean unlike before you will not be able to run multiple web containers on the same host on the same port as the ports are now common to all containers in the host network.

None network:

- With the none network the containers are not attached to any network and doesn't have any access to the external network or other containers. They run in an isolated network.

---

### Embedded DNS:

All containers in a docker host can resolve each other with the name of the container.

Built in DNS server always run at address **127.0.0.11**

Refernces:

- https://www.codenotary.com/blog/extremely-useful-docker-commands/
- https://docker-curriculum.com/
- https://www.udemy.com/course/docker-essentials/

---

## Docker commands:

- `docker run`: Create and start a new container from a Docker image.
- `docker build`: Build a Docker image from a Dockerfile.
- `docker pull`: Pull a Docker image from a container registry.
- `docker push`: Push a Docker image to a container registry.
- `docker images`: List all Docker images on your local machine.
- `docker ps`: List running containers.
- `docker exec`: Execute a command within a running container.
- `docker stop`: Stop a running container.
- `docker rm`: Remove one or more containers.
- `docker rmi`: Remove one or more Docker images.
- `docker network create`: Create a new Docker network.
- `docker network ls`: List Docker networks.
- `docker network inspect`: Display detailed information about a Docker network.
- `docker network connect`: Connect a container to a Docker network.
- `docker network disconnect`: Disconnect a container from a Docker network.
- `docker volume create`: Create a Docker volume.
- `docker volume ls`: List Docker volumes.
- `docker volume inspect`: Display detailed information about a Docker volume.
- `docker volume rm`: Remove a Docker volume.
- `docker-compose up`: Start and run a multi-container Docker application defined in a Docker Compose file.
- `docker-compose down`: Stop and remove containers, networks, and volumes created by `docker-compose up`.
- `docker-compose build`: Build Docker images for services defined in a Docker Compose file.
- `docker-compose logs`: View the logs of services running with `docker-compose`.
- `docker-compose ps`: List containers created by `docker-compose`.
- `docker login`: Log in to a container registry.
- `docker logout`: Log out from a container registry.
- `docker inspect`: Display detailed information about a Docker object (container, image, volume, etc...)
- `docker cp`: Copy files/folders between a container and the host machine.
- `docker attach`: Attach to a running container's STDIN, STDOUT, and STDERR.
- `docker rename`: Rename a Docker container.
- `docker restart`: Restart a Docker container.
- `docker pause`: Pause a running container.
- `docker unpause`: Unpause a paused container.
- `docker top`: Display the running processes of a container.
- `docker stats`: Display real-time usage statistics of containers.
- `docker events`: Stream real-time events from the Docker server.
- `docker port`: List port mappings of a container.
- `docker save`: Save a Docker image to a tar archive.
- `docker load`: Load a Docker image from a tar archive.
- `docker commit`: Create a new image from a container's changes.

---

If you’re reading this, chances are you’re running very large Docker containers in production.
A Container that’s several gigabytes in size slows deployments, increases bandwidth & storage costs and consumes valuable time of developers.

So here’s how you make Docker Images slimmer:

👉 Leverage Multi-stage builds
Multi-stage builds separate the build environment from the final runtime environment. They allow you to compile & package your application in one stage and then copy only the necessary artifacts to the final image, reducing its size significantly.
🔗 doc - https://lnkd.in/eNR28x6h

👉 Build Images from Scratch
If you only need to run a statically-compiled, standalone executable (like a C++ or Go application), pack it inside an empty Image by using “scratch” as the base image.
🔗 I made a small video on how to do this - youtu.be/XSqteQFaHBA

👉 Use fewer Layers
Each instruction like RUN or COPY adds another layer to your image, thus increasing its size. Each layer comes with its own metadata & file system structures. The fewer layers you use, the lesser data overhead your image has.
🔗 https://lnkd.in/eNkvGHAa
