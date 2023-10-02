# CS Materials Build Environment Docker Image

## Setting Up

This Docker image provides a consistent build environment without requiring operating system-dependent packages.

For full instructions on getting started with Docker, see [https://docs.docker.com/get-docker/](the official Docker documentation).

To create and run the build environment, open this folder in a command line environment and run the following command:

``` sh
# docker compose up --build
```

Once the process is finished, you should see the project being converted to the publishing format (HTML). You can view the site at: http://localhost:8080

To stop the build environment, use Ctrl+C.

To remove the environment, run the following command:

``` sh
# docker compose down --rmi all --volumes
```


## Technical Details

The Docker container is designed to connect to the project's main directory. This allows it to run the build and check scripts created for the project.

Within the container, the project's main directory is mapped to `/mnt/project`. When the build script is used, it will output the result to `/mnt/output`. A simple Python HTTP web server is opened at `/mnt/output`, and is exposed to the container's host environment.
