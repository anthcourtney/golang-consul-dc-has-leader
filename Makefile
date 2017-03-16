PACKAGE	= dc-has-leader
GOPATH	= $(CURDIR)/.gopath
BASE	= $(GOPATH)/src/$(PACKAGE)

$(BASE):
	@mkdir -p $(dir $@)
	@ln -sf $(CURDIR) $@

.PHONY: clean
clean:
	rm -rf $(GOPATH)

.PHONY: all
all: | $(BASE)
	cd $(BASE) && go build -o bin/$(PACKAGE) main.go
