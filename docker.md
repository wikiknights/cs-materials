# CS Materials Build Environment Docker Image

This Docker image provides a consistent build environment without requiring operating system-dependent packages.

For full instructions on getting started with Docker, see [https://docs.docker.com/get-docker/](the official Docker documentation).

To create and run the build environment, open this folder in a command line environment and run the following command:

``` sh
sudo docker build -t csmaterials .
sudo docker run --rm -p 8080:8080 -i csmaterials
```
