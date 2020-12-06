build:
	docker build --pull -t latex-docker .

run: build
	docker container run -it latex-docker /bin/bash
