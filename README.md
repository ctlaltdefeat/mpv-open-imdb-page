# Description
This script opens the IMDb page that corresponds to the currently playing media file, whether a film or a specific TV episode.

It does this by extracting/guessing the relevant metadata from the file name (using [guessit](https://github.com/guessit-io/guessit)), finding it on IMDb, and then opening the page in a new tab on your default browser.

Scene/release-type file names are supported.

# Requirements
The script should be multi-platform, as far as I'm aware.

You need Python 3 installed and in path, as well as the modules ```guessit``` and ```imdbpy```. The latest git version of ```imdbpy``` should be used:

```pip install guessit```

```pip install git+https://github.com/alberanid/imdbpy```

# Install
Copy the ```.lua``` and ```.py``` files to your mpv scripts folder (if you're unfamiliar with its location, check the mpv documentation).

# Usage
By default, the script binds itself to ```Ctrl+i```. You can change the binding by editing the last line in the ```.lua``` script file.
