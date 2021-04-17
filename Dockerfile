FROM silex/emacs
    MAINTAINER Bachir El Khadir <me@bachir.xyz>

# Install git
RUN apt update && \
    apt install -y git

# Copy emacs repo
RUN git clone https://github.com/bachirelkhadir/vanilla-emacs.git  git-tmp &&\
    mv git-tmp/.git git-tmp/* /root/.emacs.d/ &&\
    rm -rf git-tmp
RUN cd /root/.emacs.d git config credential.helper cache &&\
    emacs --script init.el
