#!/bin/bash

set -euo pipefail

export OBS_VERSION='32.0.4'

sudo rm /var/tmp/portage/media-video/obs-studio-$OBS_VERSION/.compiled
sudo ebuild $(portageq get_repo_path / gentoo)/media-video/obs-studio/obs-studio-$OBS_VERSION.ebuild compile
sudo cp /var/tmp/portage/media-video/obs-studio-$OBS_VERSION/work/obs-studio-${OBS_VERSION}_build/plugins/linux-pipewire/linux-pipewire.so /usr/lib64/obs-plugins
