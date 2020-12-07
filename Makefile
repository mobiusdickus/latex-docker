build:
	docker build --pull -t latex-docker .

clean:
	docker stop latex-docker-1
	docker rm latex-docker-1

run: build
	docker run -dit --name latex-docker-1 latex-docker
	docker cp latex-docker-1:/data/resume_cv.pdf .
	open resume_cv.pdf
