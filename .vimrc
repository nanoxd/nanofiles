"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "

set nocompatible " No reason to limit ourselves to vi compatibility
set nobackup
set nowritebackup
set noswapfile
set ruler
set history=3000
set showcmd       " display incomplete commands
set laststatus=2
set incsearch " Do incremental searching
set noshowmode " Hide the default mode text
set rnu
set hls
set relativenumber
set number

" Set encoding
set encoding=utf-8

" When vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

nnoremap <leader>ev :edit ~/.vimrc<cr>

" make `-` and `_` work like `o` and `O` without leaving you stuck in insert
nnoremap - o<esc>
nnoremap _ O<esc>

" Turn off the christmas lights
nnoremap <cr> :nohlsearch<cr>

" Expand %% into the directory of the current file
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Save with sudo
cmap w!! %!sudo tee > /dev/null %

if exists('$TMUX')
    set clipboard=
  else
    set clipboard=unnamed                             "sync with OS clipboard
endif

" Yank text to the OS X clipboard
noremap <leader>y "*y
noremap <leader>yy "*Y

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" Fast saving
map <leader>w :w<cr>

" Remove whitespace
nnoremap <Leader>rtw :%s/\s\+$//e<CR>

" Convert 1.8 Ruby hashes to 1.9+
nnoremap <F12> :%s/:\([^ ]*\)\(\s*\)=>/\1:/g<return>

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
" set wildmode=list:longest,list:full
" set complete=.,w,t
" function! InsertTabWrapper()
"     let col = col('.') - 1
"     if !col || getline('.')[col - 1] !~ '\k'
"         return "\<tab>"
"     else
"         return "\<c-p>"
"     endif
" endfunction
" inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NeoBundles && Bundle Specific Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setting up NeoBundle
let iCanHazNeoBundle=1
let neobundle_readme=expand('~/.vim/bundle/neobundle.vim/README.md')
if !filereadable(neobundle_readme)
  echo "Installing NeoBundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
  let iCanHazNeoBundle=0
endif

" Declare bundles are handled via NeoBundle
set rtp+=~/.vim/bundle/neobundle.vim/
call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage itself
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'mac' : 'make -f make_mac.mak'
  \ },
\ }

" Languages
NeoBundle 'guns/vim-clojure-static'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'tpope/vim-cucumber'
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'vim-scripts/fish-syntax'
NeoBundle 'tpope/vim-git'
NeoBundle 'jnwhiteh/vim-golang'
NeoBundle 'tpope/vim-haml'
NeoBundle 'wlangstroth/vim-haskell'
NeoBundle 'xenoterracide/html.vim'
NeoBundle 'vim-scripts/HTML-AutoCloseTag'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'leshill/vim-json'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'b4winckler/vim-objc'
NeoBundle 'ajf/puppet-vim'
NeoBundle 'tpope/vim-rails'
NeoBundle 'wlangstroth/vim-racket'
NeoBundle 'tpope/vim-rake'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'sunaku/vim-ruby-minitest'
NeoBundle "aaronjensen/vim-sass-status.git"
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'amdt/vim-niji'
NeoBundle 'tpope/vim-jdaddy'

" Tools
NeoBundle 'tpope/vim-abolish'
NeoBundle 'vim-scripts/ctags.vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'thoughtbot/vim-rspec'
NeoBundle 'tpope/vim-speeddating'
" Adds automatic closing of quotes
NeoBundle "Raimondi/delimitMate"
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'vim-scripts/greplace.vim'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'benmills/vimux'
" File Management
NeoBundle 'danro/rename.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-vinegar'
" Text filtering and alignment
NeoBundle 'godlygeek/tabular'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'nelstrom/vim-textobj-rubyblock'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'tolecnal/vim-matchit'
NeoBundle 'mattboehm/vim-unstack'
NeoBundle 'mattboehm/vim-accordion'
NeoBundle 'rizzatti/funcoo.vim'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'Valloric/YouCompleteMe', {
      \ 'build' : {
      \   'mac' : './install.sh'
      \ },
\ }
NeoBundle 'jaxbot/github-issues.vim'

" Colors
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'd11wtq/tomorrow-theme-vim'
NeoBundle 'bling/vim-airline'

" Linters
NeoBundle 'marijnh/tern_for_vim'
NeoBundle 'scrooloose/syntastic'

" Notification message
if iCanHazNeoBundle == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  :NeoBundleInstall
endif

"" CtrlP
" Adds ; as the Ctrl+P fuzzy search
nmap ; :CtrlPBuffer<CR>
" Show the damn dotfiles
let g:ctrlp_show_hidden = 1

let g:rspec_command = "!rspec {spec}"
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Change default keys for UltiSnips
let g:UltiSnipsExpandTrigger="<F1>"
let g:UltiSnipsJumpForwardTrigger="<F2>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Look, Style, and Feel
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable
colorscheme solarized
set background=dark
call togglebg#map("<F5>")
let g:airline_powerline_fonts = 1
let g:airline_theme = 'solarized'
let g:airline#extensions#tabline#enabled = 1

set guifont=Ubuntu\ Mono\ Derivative\ Powerline:h18

" Whitespace defaults
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
" Show “invisible” characters
set list
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_

function! s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=78
endfunction

highlight ColorColumn ctermbg=red
call matchadd('ColorColumn', '\%81v', 100)

""""Language specific whitespace

" make uses real tabs
au FileType make set noexpandtab

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Procfile,Thorfile,config.ru}  set ft=ruby

" Set Sass files as sass
autocmd BufRead,BufNewFile *.scss set filetype=scss

au BufRead,BufNewFile *.txt call s:setupWrapping()

" make Python follow PEP8
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Markdown files end in .md
au BufRead,BufNewFile *.md set filetype=markdown
" Enable spellchecking for Markdown
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd FileType gitcommit setlocal spell

" Set syntax for Go
au BufRead,BufNewFile *.go set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

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

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" The Silver Searcher
if executable('ag')
  " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

" Generate ctags
nmap <silent> <leader>rt :!ctags -R --exclude=".git\|.svn\|log\|tmp\|db\|pkg" --extra=+f<CR>
