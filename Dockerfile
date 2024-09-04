from texlive/texlive:latest

RUN apt-get update && apt-get install -y \
    inkscape \
    openssh-client && \
    apt-get clean

RUN useradd --create-home --uid 1000 writer
USER writer

WORKDIR /home/writer/project

