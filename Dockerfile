FROM public.ecr.aws/docker/library/node:22.12.0-bookworm AS builder

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y vim

# strategy 1: LD_LIBRARY_PATH - results in xl.Book is not a constructor
ENV LD_LIBRARY_PATH=/app/node_modules/libxl/deps/libxl/lib64/
# strategy 2: file into /etc/ld.so.conf.d/ and run ldconfig - still didn't work

WORKDIR /app

COPY ./lib /app/lib

COPY ./package.json /app/
COPY ./demo.js /app/
COPY ./specs /app/specs

RUN npm install

# next jump into bash in the newly generated image
#
#   docker run --rm -i -t $(docker image ls --quiet | head -1) bash
#
#  Then run:
#
#    env NODE_LIBXL_PATH=./ node demo.js