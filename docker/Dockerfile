ARG SERVER_PORT

FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
	coreutils \
	curl \
	findutils \
	perl \
	python3

RUN curl --output-dir /tmp --remote-name --location "https://github.com/jgm/pandoc/releases/download/3.1.12.3/pandoc-3.1.12.3-1-amd64.deb" && dpkg -i /tmp/pandoc-3.1.12.3-1-amd64.deb

WORKDIR /mnt/project

EXPOSE ${SERVER_PORT}
CMD ["/bin/bash", "./build/auto_build_server.sh"]
