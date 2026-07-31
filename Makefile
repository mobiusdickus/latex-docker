build:
	docker build --pull -t latex-docker .

clean:
	docker stop latex-docker-1
	docker rm latex-docker-1

resume:
	docker exec latex-docker-1 xelatex -jobname=resume PlushCV.tex
	docker cp latex-docker-1:/data/resume.pdf .
	open resume.pdf

resume-em:
	docker exec latex-docker-1 xelatex -jobname=resume-em PlushCV-em.tex
	docker cp latex-docker-1:/data/resume-em.pdf .
	open resume-em.pdf

export:
	cp resume/resume.pdf "$(HOME)/Desktop/colin-chan-resume.pdf"
	cp resume/resume-em.pdf "$(HOME)/Desktop/colin-chan-resume-em.pdf"

run:
	@if docker ps -f name=latex-docker-1 --format '{{.Names}}' | grep -q latex-docker-1; then \
		docker exec latex-docker-1 xelatex -jobname=resume PlushCV.tex; \
		docker cp latex-docker-1:/data/resume.pdf .; \
	else \
		docker run -dit -v ./resume:/data --name latex-docker-1 latex-docker; \
		docker exec latex-docker-1 xelatex -jobname=resume PlushCV.tex; \
		docker cp latex-docker-1:/data/resume.pdf .; \
	fi
	open resume.pdf

stop:
	docker stop latex-docker-1
