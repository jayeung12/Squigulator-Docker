FROM ubuntu:18.04


COPY FASTA .
RUN apt-get update && apt-get install -y \
  zlib1g-dev \
  wget \
  libhdf5-dev \
  build-essential \
  git \
  && rm -rf /var/lib/apt/lists/*


RUN git clone https://github.com/hasindu2008/squigulator && \
	cd squigulator && \
	make && cp squigulator /usr/local/bin/squigulator

ENV PATH="${PATH}:/usr/local/bin/squigulator"

