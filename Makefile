#!/bin/bash


export GOPATH=$(shell pwd):$(shell pwd)/vendors

default: harbour

harbour:
	cd src && go build -gcflags "-N -l" -o ../$@ .

-include .deps

dep:
	echo -n "$(OBJ):" > .deps
	find src -name '*.go' | awk '{print $$0 " \\"}' >> .deps

clean:
	rm -fr harbour

