# slickgreeter-pywal
A script to change lightdm-slick-greeter's theme with pywal.

Currently, the slickgreeter-pywal install script will generate a wallpapers directory in `/usr/share` with full
read and write permissions, and it will generate/edit `/etc/lightdm/slick-greeter.conf` so that there is a
`[Greeter]` section and the line `background=/usr/share/wallpapers/wal` within the greeter section. The reTheme
script just calls `wal -i <path-to-image>` and copies the image to the file `/usr/share/wallpapers/wal`.

Once the install script has been run, simply use the command `reTheme <path-to-image>` inplace of
`wal -i <path-to-image>`.

## Installation

```
sudo chmod +x install.sh
sudo ./install.sh
reTheme $(cat $HOME/.cache/wal/wal)
```
Note that on line 3: `(cat $HOME/.cache/wal/wal)` can be replaced with the full path to any image.

## Usage
When the install script is run, the commands `reTheme` and `slick-pywal` can be run from the terminal.

The `reTheme` script works just like the `wal -i <path-to-image>` command would, except it updates the file that
slick-greeter gets it's wallpaper from in addition to calling wal on the image.

#### Example
```
reTheme <path-to-image>
```

The `slick-pywal` script just copies the last image that wal was invoked on to the file that slick-greeter gets
it's wallpaper from.

#### Example
```
slick-pywal
```
