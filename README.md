# System Configuration Files

Files for configuring my personal workstations.

## Dotfiles

Dotfiles are stored in the directory `dotfiles/` and are typically
installed with [GNU Stow](https://www.gnu.org/software/stow/), as
described
[here](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html). Dotfiles
can be selectively inserted into the home directory by chaging to the
above directory and executing `stow -t ~ <subdir>`. For example,
executing `stow -t ~ emacs` will create symlinks to all emacs-related
dotfiles in the home directory. Similarly, links can later be removed
with `stow -t ~ -D <subdir>`.

### X setup

To set the desktop background to a given image, set up a symlink to
 the image as `$HOME/xbackground`. The X configuration file
 `.xprofile` will set the background to this image, where it exists.
