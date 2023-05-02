build:
	docker build --pull -t latex-docker .

clean:
	docker stop latex-docker-1
	docker rm latex-docker-1

resume:
	docker exec latex-docker-1 xelatex resume_cv.tex
	docker cp latex-docker-1:/data/resume_cv.pdf .
	open resume_cv.pdf

run:
	@if docker ps -f name=latex-docker-1 --format '{{.Names}}' | grep -q latex-docker-1; then \
		docker exec latex-docker-1 xelatex resume_cv.tex; \
		docker cp latex-docker-1:/data/resume_cv.pdf .; \
	else \
		docker run -dit -v ./resume:/data --name latex-docker-1 latex-docker; \
		docker exec latex-docker-1 xelatex resume_cv.tex; \
		docker cp latex-docker-1:/data/resume_cv.pdf .; \
	fi
	open resume_cv.pdf

stop:
	docker stop latex-docker-1
