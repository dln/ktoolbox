#!/bin/sh
set -ex
curl -L -o /tmp/vault.zip https://releases.hashicorp.com/vault/1.6.0/vault_1.6.0_linux_amd64.zip
sudo unzip /tmp/vault.zip -d /usr/local/bin
rm /tmp/vault.zip
