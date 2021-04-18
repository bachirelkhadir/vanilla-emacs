##
# Emacs docker
#
# @file
# @version 0.1


build:
	 docker build -t maroxe/vanilla-emacs:1.0 .

build-no-cache:
	 docker build --no-cache -t maroxe/vanilla-emacs:1.0 .
run:
	docker run -ti --rm --name vanilla-emacs maroxe/vanilla-emacs:1.0 sh

stop:
	docker container kill vanilla-emacs

term:
	docker exec -it vanilla-emacs bash

emacs:
	docker run -ti --rm --name vanilla-emacs maroxe/vanilla-emacs:1.0 sh -c "cd /root/.emacs.d/ && git pull && emacs"
# end
