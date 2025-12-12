#!/bin/bash

set -ouex pipefail

# Packages for my Niri setup

echo ":Installing Niri, Dank Material Shell and related software"

dnf5 -y copr enable ulysg/xwayland-satellite
dnf5 -y copr enable yalter/niri
dnf5 -y copr enable avengemedia/dms

dnf5 install -y niri dms brightnessctl foot pavucontrol wf-recorder xwayland-satellite qt6ct adw-gtk3-theme

dnf5 remove mako # explicitly remove mako because something installs it as dependency

dnf5 -y copr disable ulysg/xwayland-satellite
dnf5 -y copr disable yalter/niri
dnf5 -y copr disable avengemedia/dms

