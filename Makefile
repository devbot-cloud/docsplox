.PHONY: build run interactive

build:
	docker buildx build  --platform linux/amd64 -t docsplox:v0.0.0 ./book

interactive: 
	docker run --rm -it -p 3000:3000 docsplox:v0.0.0 /bin/ash

kill:
	docker kill docsplox

serve:
	docker run -d --rm --name docsplox -p  3000:3000 docsplox:v0.0.0 


