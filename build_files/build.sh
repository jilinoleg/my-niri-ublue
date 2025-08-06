#!/bin/bash

set -ouex pipefail

### Copy system files

echo ":Adding dx-groups script and service"

rsync -rvK /ctx/system_files/ /

chmod +x /usr/libexec/aurora-dx-groups

systemctl enable aurora-dx-groups.service

### Install packages


# Packages for my Niri setup

echo ":Installing Niri and related software"

dnf5 -y copr enable ulysg/xwayland-satellite
dnf5 -y copr enable yalter/niri

dnf5 install -y blueman brightnessctl foot mako network-manager-applet niri pavucontrol swaybg swaylock waybar wlogout wf-recorder squeekboard xwayland-satellite

dnf5 -y copr disable ulysg/xwayland-satellite
dnf5 -y copr disable yalter/niri

# Replacing doas with sudo

echo ":Installing Doas instead of sudo"

dnf5 install -y opendoas
dnf5 remove -y sudo

ln -s /usr/bin/sudo /usr/bin/doas


# Stuff from DX version but without VSCode and Cockpit

echo ":Installing software from DX edition"

#ublue-os staging
dnf5 -y copr enable ublue-os/staging
#ublue-os packages
dnf5 -y copr enable ublue-os/packages
#podman-bootc
dnf5 -y copr enable gmaglione/podman-bootc
# dnf5 -y copr enable amneziavpn/amneziawg

dnf5 install -y android-tools libvirt libvirt-nss mozilla-fira-mono-fonts osbuild-selinux p7zip p7zip-plugins podman-bootc podman-compose podman-machine podman-tui podmansh powerline-fonts qemu qemu-char-spice  qemu-device-display-virtio-gpu qemu-device-display-virtio-vga qemu-device-usb-redirect qemu-img qemu-system-x86-core qemu-user-binfmt qemu-user-static ublue-os-libvirt-workarounds virt-manager ydotool virt-viewer virt-v2v google-droid-sans-mono-fonts google-go-mono-fonts ibm-plex-mono-fonts intel-one-mono-fonts genisoimage flatpak-builder
# dnf5 install -y amneziawg-dkms amneziawg-tools

systemctl enable podman.socket
# systemctl enable libvirt-workaround.service

dnf5 -y copr disable ublue-os/staging
dnf5 -y copr disable ublue-os/packages
dnf5 -y copr disable gmaglione/podman-bootc
# dnf5 -y copr disable amneziavpn/amneziawg
