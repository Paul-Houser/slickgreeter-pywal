# slickgreeter-pywal
A script to change lightdm-slick-greeter's theme with pywal.

Currently, the slickgreeter-pywal install script will generate a wallpapers directory in `/usr/share` with full read and write permissions, and it will generate/edit `/etc/lightdm/slick-greeter.conf` so that there is a `[Greeter]` section and the line `background=/usr/share/wallpapers/wal` within the greeter section. The reTheme script just calls `wal -i <path-to-image>` and copies the image to the file `/usr/share/wallpapers/wal`.

Once the install script has been run, simply use the command `reTheme <path-to-image>` inplace of `wal -i <path-to-image>`.

# Installation

```
sudo chmod 777 install.sh
sudo ./install.sh
reTheme (cat $HOME/.cache/wal/wal)
```

and in the future, instead of running `wal -i <path-to-image>`, you should run `reTheme <path-to-image>`.
