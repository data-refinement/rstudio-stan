FROM rocker/rstudio:latest
LABEL maintainer="Yusuke Saito <ysaito8015@gmail.com>"

RUN apt-get update && apt-get -y upgrade

# install V8
RUN apt-get install -y libv8-dev

# install clang for Rstan
RUN apt-get install -y build-essential clang make \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

# install R packages
COPY install_packages.R install_packages.R
RUN ["r", "install_packages.R"]
