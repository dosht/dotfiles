set nocompatible

" ============== Neobundle plugin =============
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

let g:make = 'gmake'
if system('uname -o') =~ '^GNU/'
        let g:make = 'make'
endif

" >>>> plugins:
NeoBundle 'Shougo/vimproc.vim', {'build': {'unix': g:make}}
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'benmills/vimux'
NeoBundle 'tpope/vim-tbone'
NeoBundle 'tcarette/vim-sparkShell'
NeoBundle 'xuhdev/SingleCompile'
NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundle 'ekalinin/Dockerfile.vim'
NeoBundle 'octol/vim-cpp-enhanced-highlight' " Sytax Check
NeoBundle 'scrooloose/syntastic' " C++
NeoBundle 'L9'
NeoBundle 'ctrlpvim/ctrlp.vim' " Fuzzy file search

call neobundle#end()

NeoBundleCheck

" =============== General Settings =============
set mouse=a
set number                      "Line numbers
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
"set visualbell                  "No sounds
set autoread                    "Reload files changed outside vimu
syntax on
set autoread
"runtime autoload.vim
"let autoreadargs={'autoread':1}
"execute WatchForChanges("*",autoreadargs)
set noswapfile
"add Ctrl+c to copy to system clipboard
vnoremap <C-c> "+y

" =============== Search Settings ==============
set hlsearch    "Find next on typing
set incsearch   "Hilight matches  
set ic

" ============== Indentaion Settings ===========
set ai
set si
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
autocmd Filetype scala setlocal ts=2 sts=2 sw=2
autocmd Filetype java setlocal ts=4 sts=4 sw=4
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4
autocmd Filetype python setlocal ts=4 sts=4 sw=4
autocmd Filetype cpp setlocal ts=4 sts=4 sw=4
autocmd Filetype c setlocal ts=4 sts=4 sw=4
autocmd Filetype cu setlocal ts=4 sts=4 sw=4

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

" Autocomplete
" let g:ycm_filetype_whitelist = { 'cpp': 1, 'c': 1, 'python': 1, 'vim': 1, 'scala': 1 }

" ============== Filetype plugin =============
filetype plugin on
filetype indent on

" ============== NerdTree plugin =============
map <C-n> :NERDTreeToggle<CR>

" ============== SparkShell plugin ===========
let g:sparkShellPath = "$SPARK_HOME/bin/spark-shell"
let g:inTmux = 1
let g:pysparkMode = 0
command StartSpark execute 'call StartSparkShell("")'
map <startMap>                  :call StartSparkShell("")<CR>
map <enter paste>               :call SparkShellEnterPasteEnv()<CR>
"map <C-p>                       :call SparkShellSendMultiLine() <CR>
"imap <C-p>                      <ESC> :call SparkShellSendMultiLine() <CR>
map <sendAll>                   :silent 1,$ call SparkShellSendMultiLine() <CR>

nmap <exit paste>               :call SparkShellExitPasteEnv()<CR>
nmap <killMap>                  :call StopSparkShell()<CR>
nmap <sendWordUnderCursor>      :call SparkShellSendKey("<C-R><C-W>\r")<CR> 

vmap <sendSelectionPerChar>    y:call SparkShellSendKey(substitute('<C-R>0',"\"","\\\"","")."\r")<CR>
vmap <sendSelectionPerLine>     :call SparkShellSendMultiLine() <CR>

nmap <countObjectUnderCursor>   :call SparkShellSendKey("<C-R><C-W>.count()\r")<CR><Esc>
nmap <seeObjectUnderCursor>     :call SparkShellSendKey("<C-R><C-W>\r")<CR><Esc>
vmap <seeObjectUnderCursor>    y:call SparkShellSendKey(substitute('<C-R>0',"\"","\\\"","")."\r")<CR>

