# syntax=docker/dockerfile:1

# Base development image
FROM debian:bullseye AS base

RUN apt-get update && \
    apt-get -y install -- \
    build-essential \
    capnproto \
    cmake \
    python-dev \
    python3 \
    python3-pip

WORKDIR /pycapnp
COPY . ./

RUN python3 -m pip install --upgrade setuptools pip
RUN python3 -m pip install --upgrade -r requirements.txt

# Development environment
FROM base AS development
CMD ["python3", "-m", "pip", "install", "."]

# Tests
FROM base AS test
RUN ["python3", "-m", "pip", "install", "."]
RUN ["pytest" , "-v"]
