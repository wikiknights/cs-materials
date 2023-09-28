FROM alpine:3

RUN apk add --no-cache \
	bash \
	coreutils \
	findutils \
	pandoc \
	perl \
	python3

WORKDIR /mnt/project
COPY . .

RUN ./build/build_all.sh

EXPOSE 8080
CMD ["python3", "-m", "http.server", "8080", "-d", "out"]
