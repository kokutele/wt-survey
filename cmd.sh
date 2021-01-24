#!/bin/bash

#docker run --rm -it --mount type=bind,src=$(pwd),dst=/home/komasshu node:15.6.0-buster-slim /bin/bash
docker run --rm -it --mount type=bind,src=$(pwd),dst=/home/komasshu ubuntu:18.04 /bin/bash
