#!/bin/bash
set -ex
sudo apk add -U python2
mkdir -p $HOME/gcloud
curl -L https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz | tar -C $HOME/gcloud -xz
$HOME/gcloud/google-cloud-sdk/install.sh -q
