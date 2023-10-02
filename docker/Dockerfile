ARG SERVER_PORT

FROM alpine:3

RUN apk add --no-cache \
	bash \
	coreutils \
	findutils \
	pandoc \
	perl \
	python3

WORKDIR /mnt/project

EXPOSE ${SERVER_PORT}
CMD ["/bin/bash", "./build/auto_build_server.sh"]
