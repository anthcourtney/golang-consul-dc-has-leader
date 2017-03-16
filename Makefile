PACKAGE	= dc-has-leader
GOPATH	= $(CURDIR)/.gopath
BASE	= $(GOPATH)/src/$(PACKAGE)
WORKDIR = /go/src/${PACKAGE}

$(BASE):
	@mkdir -p $(dir $@)
	@ln -sf $(CURDIR) $@

.PHONY: clean
clean:
	rm -rf $(GOPATH)

.PHONY: go
go: | $(BASE)
	cd $(BASE) && go build -o bin/$(PACKAGE) main.go

.PHONY: alpine
alpine: | $(BASE)
	docker run --rm \
	  -v $(CURDIR):$(WORKDIR) \
	  -w $(WORKDIR) \
	  golang:alpine go build -v -o bin/alpine/$(PACKAGE) main.go

