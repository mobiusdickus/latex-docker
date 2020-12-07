FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive

WORKDIR /data
VOLUME /data

COPY resume/ .

RUN apt-get update -qy
RUN apt-get install -qy texlive-xetex texlive-fonts-recommended texlive-fonts-extra
RUN xelatex resume_cv.tex

CMD ["/bin/bash"]
