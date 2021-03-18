" Global vim configuration
" Source : https:"danielmiessler.com/study/vim/

" Map <ESC> on "jk" sequence 
inoremap jk <ESC>
" Remap the beginning of the line shortcut to a bind w/o <Maj>
nnoremap à 0
" Redefine map leader for shortcuts 
let mapleader="ù"

" enable highlight
syntax on
" enable line numbers
set number
" disabling swap file
set noswapfile
" highlight all search results 
set hlsearch
" ignore case in search
set ignorecase
" show search results as i type 
set incsearch
" show existing tab with 4 spaces width
set tabstop=4
" when indenting use 4 spaces width
set shiftwidth=4
" On pressing tab insert 4 spaces
set expandtab
" enable autoindent
set autoindent
" enable filetype detection
filetype on
" enable plugin
filetype plugin on
" enable indent
filetype indent on

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
