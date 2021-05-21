# What is this?

This is a Dockerfile that I'm keeping for my personal/professional use with interesting tooling for cloud / dev work. 

So far:
* Python3
* git
* wget
* unzip
* jq
* Terraform
* AWS cli
* Azure cli
* GCP cli
* Go tooling
* Helm
* Kubectl cli
* CF cli (version 7)
* tmux
* spacevim
* oh-my-zsh
* nano
* ansible
* MySQL Client
* PSQL Client
* MSSQL Client (sqlcmd)

I've uploaded the latest build of the image [here on Dockerhub](https://hub.docker.com/repository/docker/ahplummer/og_platform_eng).

# How to use this via Dockerhub? (The gettin' jiggy with it option)

Take a look at [Dockerfile.og_platform_eng](./Dockerfile.og_platform_eng), feel free to copy it by itself into a clean working directory.

Then just do a 
```	
docker build -t og_platform_eng -f Dockerfile.og_platform_eng .
```
Then run like a beast...
```
docker run -it og_platform_eng:latest bash
```
If you'd rather the Oh-my-zsh prompt:
```
docker run -it og_platform_eng:latest /bin/zsh
```

## To build on your own, b/c you like these things:

Clone this repo:
```
git clone https://github.com/ahplummer/og_platform_eng.git
```
Build the image from original Dockerfile:
```
make build
```
Run things:
```
make run
```
NOTE: take a peek at the [Makefile](./Makefile) to see what it's doing...among other things, it's connecting up some volumes on your local host. Feel free to change this behavior.



