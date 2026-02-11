# Mullins OBS Pipewire patch

To disable deleting `work` directory after building packages on `Gentoo`:

```sh
echo 'FEATURES="keepwork"' | sudo tee /etc/portage/make.conf
```
