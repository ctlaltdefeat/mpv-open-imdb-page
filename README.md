# Description

This script opens the IMDb page that corresponds to the currently playing media file, whether a film or a specific TV episode.

It does this by extracting/guessing the relevant metadata from the file name (using [guessit](https://github.com/guessit-io/guessit)), finding it on IMDb, and then opening the page in a new tab on your default browser.

Scene/release-type file names are supported.

# Requirements

The script is tested on Windows and Linux, and should work on any platform with the dependencies correctly installed.

## Python and Packages

You need Python 3 installed and in path, as well as the modules ```guessit``` and ```imdbpy```. The latest git version of ```imdbpy``` should be used:

```sh
pip install guessit
pip install git+https://github.com/alberanid/imdbpy
```

## mpv

The script won't load for any mpv build below v0.33.1 (Apr 05, 2021). Since that release includes security fixes, you should upgrade to the [newest version](https://mpv.io/installation/) anyways. Note that the default repos of Debian/Ubuntu are often outdated.

# Install

Copy the contents of this repo into a folder inside the ```scripts``` folder of your mpv configuration directory (See [mpv's manual](https://mpv.io/manual/master/#files)).

For example, installing can be done like this:
```sh
# Linux:
git clone --depth=1 https://github.com/ctlaltdefeat/mpv-open-imdb-page ~/.config/mpv/scripts/mpv-open-imdb-page

# Windows:
git clone --depth=1 https://github.com/ctlaltdefeat/mpv-open-imdb-page %APPDATA%/mpv/scripts/mpv-open-imdb-page

# To update (in Linux, Win is analogous):
git -C ~/.config/mpv/scripts/mpv-open-imdb-page pull

# To update dependencies:
pip install --upgrade guessit git+https://github.com/alberanid/imdbpy
```

# Usage

By default, the script binds itself to ```Ctrl+i```.
You can change the binding by editing the last line in the ```main.lua``` script file or in mpv's ```input.conf``` like this:
```
Ctrl+i script-binding open-imdb-page
```
