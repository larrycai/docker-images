FROM ubuntu:focal as builder

ENV DEBIAN_FRONTEND=noninteractive
ENV cc=gcc

RUN apt-get update  && apt-get install -y \
        libglib2.0-dev git make cmake g++ imagemagick \
    && git clone https://github.com/fletcher/MultiMarkdown-6.git \
    && cd MultiMarkdown-6 \
    && git checkout master \
#    && ./update_git_modules \
#    && ./link_git_modules \
    && make && cd build && make \
    && cp multimarkdown /bin
    
FROM ubuntu:focal

LABEL maintainer="larry.caiyu@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive
ENV cc=gcc

COPY --from=builder /bin/multimarkdown /bin 
RUN apt-get update  && apt-get install -y \
    texlive-xetex texlive-latex-recommended texlive-latex-extra \
    latex-cjk-chinese fonts-arphic-gbsn00lp fonts-wqy-microhei fonts-wqy-zenhei texlive-fonts-recommended \
    imagemagick \
    && rm -rf /var/lib/apt/lists/*
