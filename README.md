# Dependencies
1. vim
2. tmux
3. apache spark
4. cmake
5. python-dev [for ubuntu]

# Installation

```bash
cd Documents
git clone git@github.com:dosht/dotfiles.git
./install
```

## Mac
First install [macvim](https://github.com/macvim-dev/macvim/releases) to get **CompleteMe** working,
then install [CompleteMe](https://github.com/Valloric/YouCompleteMe#mac-os-x-super-quick-installation) manually:

### Install MacVim using home brew:

```bash
brew install macvim --override-system-vim
brew linkapps
```

```bash
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
```

Finally install vimproc manually:

```bash
cd ~/.vim/bundle/vimproc.vim
make -f make_mac.mak
```


