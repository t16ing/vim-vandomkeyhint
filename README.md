# vim-vandomkeyhint
Vandomkeyhint, Vim __hint__ plugin for user defined hotkeys.

* User can add hints for each user-defined hotkey in .vimrc.
* Showing hints automatically while idle.

## Installation

1. Recommend to install by vundle.

2. Add this before any VkhAdd command:

```vim
let vkh_readme=expand('~/.vim/bundle/vim-vandomkeyhint/README.md')
if !filereadable(vkh_readme)
	echo "Installing vandomkeyhint.."
	echo ""
	silent !mkdir -p ~/.vim/bundle/vim-vandomkeyhint
	silent !git clone https://github.com/t16ing/vim-vandomkeyhint ~/.vim/bundle/vim-vandomkeyhint
endif
set rtp+=~/.vim/bundle/vim-vandomkeyhint/
call vandomkeyhint#rc()
```

3. Install hotkeys-hints in your vimrc file, like this:

```vim
VkhAdd '<leader><f1> show random hotkey hints.'
```

## Example

You can add below vim scripts in your .vimrc.

```vim
map <f5> <ESC>:call MY_PROC_COMPILE_AND_RUN()<CR>
VkhAdd '<f5> compile and run.'
```

Effects:

1. While `<f5>` is pressed, the source will be compiled and run.
2. While idle, a hint will be displayed `<f5> compile and run`.
