#!/bin/bash

set -ouex pipefail

# Packages for proxy management

echo ":Installing Throne proxy manager"

curl -o /etc/yum.repos.d/throne.repo https://parhelia512.github.io/throne.repo

dnf5 install -y throne --refresh

rm /etc/yum.repos.d/throne.repo

echo ":Trying to set suid for Throne"

chown root:root
chmod u+s /usr/lib64/Throne/Core

