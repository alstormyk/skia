#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install packages
curl -LsS https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo | tee /etc/yum.repos.d/brave-browser.repo
curl -LsS https://brave-browser-rpm-release.s3.brave.com/brave-core.asc | tee /etc/pki/rpm-gpg/brave-core.asc

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
rpm-ostree install screen vlc brave-browser

#### Example for enabling a System Unit File

systemctl enable podman.socket
