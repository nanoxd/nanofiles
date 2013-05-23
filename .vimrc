"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" No reason to limit ourselves to vi compatibility
set nocompatible
set ruler
set laststatus=2

" Set encoding
set encoding=utf-8

" When vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

" Remember command line entries
set history=300

nnoremap <leader>ev :edit ~/.vimrc<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Look, Style, and Feel
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set t_Co=256
set background=dark
colorscheme solarized
let g:Powerline_symbols = 'fancy'
let g:Powerline_colorscheme = 'solarized' " https://raw.github.com/gist/2003862/e245d6d9b60b16ea38d384107401ef9ad04fbb47/solarized.vim


" Whitespace defaults
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

function! s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction

""""Language specific whitespace

" make uses real tabs
au FileType make set noexpandtab

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}  set ft=ruby

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

au BufRead,BufNewFile *.txt call s:setupWrapping()

" make Python follow PEP8
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" % to bounce from do to end etc.
runtime! macros/matchit.vim

set ffs=unix,dos,mac "Default file types

" Disable beeps and flashes
set noeb vb t_vb=

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Show the damn dotfiles
let g:ctrlp_show_hidden = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Bundles
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Declare bundles are handled via Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Define bundles via Github repos
" Bundle 'croaky/vim-colors-github'
Bundle 'danro/rename.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'nanki/treetop.vim'
Bundle 'skwp/vim-rspec'
Bundle 'timcharper/textile.vim'
Bundle 'tomasr/molokai'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'
Bundle 'tsaleh/vim-matchit'
Bundle 'vim-scripts/ctags.vim'
Bundle 'vim-scripts/greplace.vim'
Bundle 'vim-scripts/tComment'
Bundle 'xenoterracide/html.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vim-scripts/HTML-AutoCloseTag'
Bundle 'xolox/vim-notes'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Adds ; as the Ctrl+P fuzzy search
nmap ; :CtrlPBuffer<CR>

nmap \e :NERDTreeToggle<CR>
