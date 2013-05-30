"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


set nocompatible " No reason to limit ourselves to vi compatibility
set nobackup
set nowritebackup
set noswapfile
set ruler
set laststatus=2
set incsearch " Do incremental searching
set noshowmode " Hide the default mode text

" Set encoding
set encoding=utf-8

" When vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

" Remember command line entries
set history=300

nnoremap <leader>ev :edit ~/.vimrc<cr>

if $SHELL =~ 'bin/fish'
  sets shell=/bin/zsh
endif


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

" Set Sass files as sass
 au BufRead,BufNewFile *.scss set filetype=scss

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

au BufRead,BufNewFile *.txt call s:setupWrapping()

" make Python follow PEP8
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Markdown files end in .md
au BufRead,BufNewFile *.md set filetype=markdown
" Enable spellchecking for Markdown
au BufRead,BufNewFile *.md setlocal spell

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


" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Bundles && Bundle Specific Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Declare bundles are handled via Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Define bundles via Github repos

" Languages
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-cucumber'
Bundle 'elixir-lang/vim-elixir'
Bundle 'vim-scripts/fish-syntax'
Bundle 'tpope/vim-git'
Bundle 'jnwhiteh/vim-golang'
Bundle 'tpope/vim-haml'
Bundle 'wlangstroth/vim-haskell'
Bundle 'xenoterracide/html.vim'
Bundle 'vim-scripts/HTML-AutoCloseTag'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'tpope/vim-markdown'
Bundle 'thiderman/nginx-vim-syntax'
Bundle 'b4winckler/vim-objc'
Bundle 'ajf/puppet-vim'
Bundle 'tpope/vim-rails'
Bundle 'skwp/vim-rspec'
Bundle 'vim-ruby/vim-ruby'
Bundle 'sunaku/vim-ruby-minitest'
Bundle "aaronjensen/vim-sass-status.git"
Bundle 'cakebaker/scss-syntax.vim'

"Tools
Bundle 'vim-scripts/ctags.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'raimondi/delimitmate' " Adds automatic closing of quotes, parenthesis, brackts, etc.
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-scripts/greplace.vim'
Bundle 'tsaleh/vim-matchit'
Bundle 'scrooloose/nerdtree' " File Management
Bundle 'danro/rename.vim'
Bundle 'tristen/vim-sparkup' " Zen Coding for VIM
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/syntastic' " VIM Syntax Linter
Bundle 'godlygeek/tabular' " Text filtering and alignment
Bundle 'vim-scripts/tComment'
Bundle 'timcharper/textile.vim'
Bundle 'nanki/treetop.vim'

"Colors
Bundle 'tomasr/molokai'
Bundle 'altercation/vim-colors-solarized'
Bundle 'd11wtq/tomorrow-theme-vim'



"" CtrlP
" Adds ; as the Ctrl+P fuzzy search
nmap ; :CtrlPBuffer<CR>
" Show the damn dotfiles
let g:ctrlp_show_hidden = 1

"" NERDTree
nmap \e :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



" Use Ag (https://github.com/ggreer/the_silver_searcher) instead of Grep when
" available
if executable("ag")
  set grepprg=ag\ --noheading\ --nogroup\ --nocolor
endif
