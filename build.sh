#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
curl "https://copr.fedorainfracloud.org/coprs/yalter/niri/repo/fedora-$RELEASE/yalter-niri-fedora-$RELEASE.repo" > /etc/yum.repos.d/yalter-niri-fedora-$RELEASE.repo
rpm-ostree install niri qtile-wayland
rpm-ostree override remove alacritty mako
# this would install a package from rpmfusion
# rpm-ostree install vlc


#### Example for enabling a System Unit File

systemctl enable podman.socket
