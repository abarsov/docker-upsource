NAME = alonsodomin/upsource
VERSION = 3.0

all: build

build:
	docker build . -t $(NAME):$(VERSION)
