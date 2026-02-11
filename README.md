# Mullins OBS Pipewire patch

Set env variables:

```sh
export OBS_VERSION='32.0.4'
```

To disable deleting `work` directory after building packages on `Gentoo`:

```sh
echo 'FEATURES="keepwork"' | sudo tee /etc/portage/make.conf
```

Unpack `obs-studio` sources:

```sh
ebuild $(portageq get_repo_path / gentoo)/media-video/obs-studio/obs-studio-$OBS_VERSION.ebuild unpack
```

Create link to the source file with `pipewire` script in obs:

```sh
sudo ln -s $HOME/mullins-obs-pipewire/obs-studio/plugins/linux-pipewire/pipewire.c /var/tmp/portage/media-video/obs-studio-/work/obs-studio-$OBS_VERSION/plugins/linux-pipewire/pipewire.c
```

Compile and install `obs` (see `./obs-studio/install.sh`):

```sh
sudo rm /var/tmp/portage/media-video/obs-studio-$OBS_VERSION/.compiled
sudo ebuild $(portageq get_repo_path / gentoo)/media-video/obs-studio/obs-studio-$OBS_VERSION.ebuild compile
sudo cp $(portageq get_repo_path / gentoo)/media-video/obs-studio-$OBS_VERSION/work/obs-studio-${OBS_VERSION}_build/plugins/linux-pipewire/linux-pipewire.so /usr/lib64/obs-plugins
```
