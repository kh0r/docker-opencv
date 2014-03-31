# OpenCV
#
# VERSION       1.0

# use the ubuntu base image
FROM	ubuntu:12.10
MAINTAINER Markus Klepp, me@mklepp.com

# make sure the package repository is up to date, install dependencies & fetch and install OpenCV
RUN	apt-get update && \
	apt-get install -y -q wget curl && \
	apt-get install -y -q cmake && \
	curl -L 'http://sourceforge.net/projects/opencvlibrary/files/opencv-unix/2.4.7/opencv-2.4.7.tar.gz/' | tar xvzf - && \
	mkdir -p opencv-2.4.7/release && \
	cd opencv-2.4.7/release && \
	cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local .. && \
	make && make install && \
	cd / && rm -rf opencv-2.4.7