#!/bin/bash

set -ouex pipefail

# Replacing doas with sudo

echo ":Installing Doas instead of sudo"

dnf5 install -y opendoas

echo ":Not removing sudo because it also removes plasma"
# dnf5 remove -y sudo --setopt protected_packages= # remove despite being protected

# ln -s /usr/bin/doas /usr/bin/sudo
