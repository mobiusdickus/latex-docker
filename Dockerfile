FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /data

COPY resume/ .

RUN apt update -qy
RUN apt install -qy texlive-xetex texlive-fonts-recommended texlive-fonts-extra texlive-latex-extra

CMD ["/bin/sh"]
