#!/bin/bash
set -ex
doas apk add --force-broken-world -U python3
mkdir -p $HOME/gcloud
curl -L https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz | tar -C $HOME/gcloud -xz
$HOME/gcloud/google-cloud-sdk/install.sh \
	--additional-components beta \
	--bash-completion=true \
	--path-update=true \
	--quiet
