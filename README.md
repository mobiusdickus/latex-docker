# latex-docker

Colin Chan's LaTeX resumes, built with XeLaTeX in Docker.

## Prerequisites

Install `docker`

## Usage

Build the Docker image once:

```sh
make build
```

Build the default software and platform engineer resume:

```sh
make run
```

This starts the `latex-docker-1` container when necessary, compiles
`resume/PlushCV.tex`, writes `resume/resume.pdf` through the mounted directory,
copies the PDF to the repository root, and opens it.

To build the EM variant:

```sh
make resume-em
```

This compiles `resume/PlushCV-em.tex`, writes `resume/resume-em.pdf`, copies the
PDF to the repository root, and opens it. The container must already be running;
run `make run` first if necessary.

After building both variants, export copies to the Desktop with their standard
filenames:

```sh
make export
```

The exported files are:

- `~/Desktop/colin-chan-resume.pdf`
- `~/Desktop/colin-chan-resume-em.pdf`

Stop or remove the build container with `make stop` or `make clean`,
respectively.
