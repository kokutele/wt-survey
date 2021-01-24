# (base: https://github.com/nodejs/node/blob/1ae0511b942c01c6e0adff98643d350a395bf101/.travis.yml)


# LABEL maintainer="Ryo Ota <nwtgck@nwtgck.org>"
# 
# RUN apt update && \
#     apt install -y software-properties-common && \
#     add-apt-repository ppa:ubuntu-toolchain-r/test && \
#     apt update && \
#     apt install -y \
#       g++ \
#       python \
#       ccache \
#       build-essential \
#       git \
#       python3-distutils && \
#     apt-get clean && \
#     rm -rf /var/lib/apt/lists/*
# 
# ENV NODE_QUIC_REVISION=cee2e5d079ca2b55e421d81df1ad131c1bfeecc6
# 
# RUN mkdir -p build && \
#     cd build && \
#     git clone https://github.com/nodejs/quic.git && \
#     cd quic && \
#     git reset --hard $NODE_QUIC_REVISION && \
#     # Build Node.js with QUIC
#     ./configure --experimental-quic && \
#     CC='ccache gcc' CXX='ccache g++' make -j2 && \
#     # Install
#     make install PREFIX=/usr/local && \
#     rm -rf /build
# 
# CMD [ "node" ]

#FROM ubuntu:16.04
FROM ubuntu:18.04

LABEL maintainer="Kensaku Komatsu <komasshu@kokutele.com>"

#RUN apt update && \
#    apt install -y software-properties-common && \
#    add-apt-repository ppa:ubuntu-toolchain-r/test && \
#    apt update && \
#    apt install -y \
#      g++ \
#      python \
#      ccache \
#      build-essential \
#      git \
#      python3-distutils && \
#    apt-get clean && \
#    rm -rf /var/lib/apt/lists/*
RUN apt update && \
    apt -y upgrade && \
    apt install -y software-properties-common && \
    add-apt-repository ppa:ubuntu-toolchain-r/test && \
    apt update && \
    apt install -y \
      python \
      g++ \
      make \
      git \
      build-essential \
      ccache \
      python3-distutils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
 

ENV NODE_BRANCH=v15.6.0
 
RUN mkdir -p build && \
    cd build && \
    git clone https://github.com/nodejs/node.git -b ${NODE_BRANCH} && \
    cd node && \
    ./configure --experimental-quic && \
    #./configure && \
    CC='ccache gcc' CXX='ccache g++' make -j4 && \
    # make -j4 && \
    make install PREFIX=/usr/local && \
    rm -rf /build
 
CMD [ "node" ]