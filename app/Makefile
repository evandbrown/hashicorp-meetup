default: bin

# Builds the app binary
bin:
	mkdir -p out
	docker run --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp golang:1.6 go get -u ; go build
	mv app out/

clean:
	rm -rf out
