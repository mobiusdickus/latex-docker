FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive

WORKDIR /src

COPY resume/ resume/

RUN apt-get update -y
RUN apt-get install -y texlive-xetex

CMD ["bash"]
