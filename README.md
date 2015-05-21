My dotfiles
===========

This is my collection of dotfiles. This repository only contains all the user
application configurations that are acceptable to post publicly on the
internet.

Use at your own risk. I like my system well configured, so blindly copying
files from this repo may leave your computer in an impossible to use state.

Usage instruction
-----------------

Run the install.sh script in the install directory.

Application Configurations (highlights of various configs)
----------------------------------------------------------

### vim

Besides containing all the plugins I like (it uses vim-plug to maintain them),
it also contains some worthwhile mapping.
(Use vim-plug's `:PlugInstall` to install the plugins on a fresh install)

- `imap kj <Esc>`
	- easier escape
- `L` and `H` mapped to `$` and `_`
	- makes jumping to the beginning and end of lines much easier
- `Q` mapped to `@q`
	- easier replay of macros
- `Y` mapped to `y$`
	- makes vim more consistent
- Tolerant `:W` and `:Q` mappings to save and quit in a hurry
- Remapped arrow keys in normal mode

My custom Ultisnips snippets are also included with this installation

### tmux

Right off the bat, we already have a curveball. The prefix is `C-s`. I find
this much better than `C-a`, which I use too much in vim to give up. In order
to use this config, you must have `stty -ixon` set in the shell. That frees up
the `C-s` and `C-q` keys to do useful things instead of tty flow control.

This config also takes advantage of the tmux plugin manager. Code for
initializing it is included in the main install script.

### i3

First thing's first. `jkl;` are no longer used to navigate and move windows.
That is replaced by `hjkl`. I find this much more consistent and easier to use.
Next, my prefix is "Mod4", the windows key, which might be different from what
you're expecting.

I also provide an i3blocks config, which prints things like how many tasks I
have due and what task is due next (that functionality is provided by
taskwarrior). It also prints the time.
