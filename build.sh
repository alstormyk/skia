#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"
FEDORA_VERSION='40'


### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
curl -Lo "https://copr.fedorainfracloud.org/coprs/yalter/niri/repo/fedora-40/yalter-niri-fedora-40.repo" > /etc/yum.repos.d/yalter-niri-fedora-40.repo
rpm-ostree install niri
# this would install a package from rpmfusion
# rpm-ostree install vlc


#### Example for enabling a System Unit File

systemctl enable podman.socket
