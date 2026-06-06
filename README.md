# latex-docker
My latex resume built in a docker container and saved to your local machine.

## Prerequisites
Install `docker`

## Usage
Run `make run` to build the default resume.

To build the EM variant:
```
docker exec latex-docker-1 xelatex -jobname=resume-em PlushCV-em.tex
```

After running the command, a copy of the final pdf will be placed in the current directory.
