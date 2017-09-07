default: twig

.PHONY: twig

pwd := $(shell pwd)

contdir := /go/src/github.com/serdmanczyk/twig/
static_build_prefix := GO15VENDOREXPERIMENT=1 docker run \
		-e CGO_ENABLED=0 \
		-e GOOS=linux \
		-v $(pwd):$(contdir)

static_build_args := golang go build -ldflags "-s" -a -installsuffix cgo -o twig

yml := -f docker-compose.yml


twig:
	$(static_build_prefix) -w $(contdir) $(static_build_args)

docker:
	docker-compose $(yml) build

up:
	docker-compose $(yml) up -d

down:
	docker-compose $(yml) down
