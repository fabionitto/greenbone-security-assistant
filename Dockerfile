FROM 	fabionitto/openvas-base-libraries:8.0.6
MAINTAINER Fabio Nitto "fabio.nitto@gmail.com"

RUN apt-get update && apt-get -y install \
	libmicrohttpd-dev \
	libxml2-dev \
	libxslt1-dev && \
	apt-get clean 

RUN mkdir /src && \
	cd /src && \
	wget http://wald.intevation.org/frs/download.php/2287/greenbone-security-assistant-6.0.9.tar.gz -O gsa.tar.gz 2> /dev/null && \
	tar xvzf gsa.tar.gz && \
	cd /src/greenbone-security-assistant-* && \
	mkdir build && \
	cd build && \
	cmake .. && \
	make && \
	make install && \
	make rebuild_cache && \
	cd / && \
	rm -rf /src 

# ENTRYPOINT ["gsad", "-f", "-R"]

EXPOSE 80 443 

