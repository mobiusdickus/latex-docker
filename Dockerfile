FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive

WORKDIR /data

COPY resume/ .

RUN apt-get update -qy
RUN apt-get install -qy texlive-xetex texlive-fonts-recommended texlive-fonts-extra

CMD ["/bin/sh"]
