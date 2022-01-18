FROM silex/emacs
    MAINTAINER Bachir El Khadir <me@bachir.xyz>


RUN mkdir /root/.emacs.d
COPY emacs.d /root/.emacs.d
RUN ls -h /root
RUN cd /root/.emacs.d && emacs --script init.el
