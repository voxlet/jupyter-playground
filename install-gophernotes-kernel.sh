#/usr/bin/env zsh

set -euxo pipefail

echo $(poetry env info --path)
echo $(go env GOPATH)

kernel_path="$(poetry env info --path)/share/jupyter/kernels/gophernotes"

mkdir -p ${kernel_path}
cd ${kernel_path}
cp "$(go env GOPATH)"/pkg/mod/github.com/gopherdata/gophernotes@v0.7.4/kernel/*  .
chmod +w ./kernel.json
sed "s|gophernotes|$(go env GOPATH)/bin/gophernotes|" < kernel.json.in > kernel.json
