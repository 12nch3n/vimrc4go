# vim4go

# Description

A vim configured plugins for golang development with:
1. Workspace tree view with `F2`
2. Tagbar for current file `F3`
3. Auto complete code with YCM
4. Code segment predefine with ultisnap `Tab`
5. Golang development support:
    * Go to definition
    * Code auto check, import and formatting when saving
    * Go vet failure list window
6. File search by name with `Ctrl+P>`, File content search `ack` by `F4`
7. Support friendly tmux window shortcut keys
8. Git information check
9. Json, Yaml, Toml, Markdown file enhanced preview
10. Eslint
11. Code indents enhanced display via highlight, auto paired brackets and quota
12. Spelling check for english language with go through spelling errors with `]s` & `[s`

# Dependency
1. vim 7.4+
2. Python3
3. Powerline `pip3 install powerline` https://github.com/powerline/powerline
4. Poverline fonts https://github.com/powerline/fonts

## Install
1. install vim-plug
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
2. copy configure
```
cp vimrc ~/.vimrc
```
3. open vim and `:PlugInstall`
4. install YCM completer: `cd ~/.vim/plugged/YouCompleteMe/ && ./install.py --clang-completer  --go-completer`
