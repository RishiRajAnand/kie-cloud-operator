#!/bin/sh

source ./hack/go-mod-env.sh

echo Reset vendor directory

go mod tidy -compat=1.17
go mod vendor

if [[ -n ${CI} ]]; then
    git diff --exit-code
fi
