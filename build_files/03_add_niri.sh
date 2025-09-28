#!/bin/bash

set -ouex pipefail

# Packages for my Niri setup

echo ":Installing Niri and related software"

dnf5 -y copr enable ulysg/xwayland-satellite
dnf5 -y copr enable yalter/niri

dnf5 install -y blueman brightnessctl foot mako network-manager-applet niri pavucontrol swaybg swaylock waybar wlogout wf-recorder squeekboard xwayland-satellite

dnf5 -y copr disable ulysg/xwayland-satellite
dnf5 -y copr disable yalter/niri
