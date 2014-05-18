"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "

set nocompatible " No reason to limit ourselves to vi compatibility
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
set autoread " Reload files changed outside vim
set hidden " The current buffer can be put to the background without writing to disk;

" Turns off swap files
set nobackup
set nowritebackup
set noswapfile

" Persistent Undo
" Keep undo history across sessions, by storing in file.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif
"
" Set encoding
set encoding=utf-8

" When vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

" make `-` and `_` work like `o` and `O` without leaving you stuck in insert
nnoremap - o<esc>
nnoremap _ O<esc>

" Turn off the christmas lights
nnoremap <Leader><cr> :nohlsearch<cr>

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

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" Fast saving
map <leader>w :w<cr>

" Remove whitespace
nnoremap <Leader>rtw :%s/\s\+$//e<CR>

" Convert 1.8 Ruby hashes to 1.9+
nnoremap <F12> :%s/:\([^ ]*\)\(\s*\)=>/\1:/g<return>

au FileType go nmap <Leader>g :w\|:!go run %<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle && Plugin Specific Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setting up Vundle
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/Vundle.vim ~/.vim/bundle/Vundle.vim
  let iCanHazVundle=0
endif

" Declare bundles are handled via Vundle
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin(expand('~/.vim/bundle/'))

" Let Vundle manage itself
Plugin 'gmarik/Vundle.vim'

" Languages
Plugin 'guns/vim-clojure-static'
Plugin 'kchmck/vim-coffee-script'
Plugin 'elixir-lang/vim-elixir'
Plugin 'vim-scripts/fish-syntax'
Plugin 'tpope/vim-git'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-haml'
Plugin 'wlangstroth/vim-haskell'
Plugin 'xenoterracide/html.vim'
Plugin 'vim-scripts/HTML-AutoCloseTag'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'itspriddle/vim-jquery'
Plugin 'leshill/vim-json'
Plugin 'groenewege/vim-less.git'
Plugin 'tpope/vim-markdown'
Plugin 'jtratner/vim-flavored-markdown.git'
Plugin 'b4winckler/vim-objc'
Plugin 'rodjek/vim-puppet'
Plugin 'wlangstroth/vim-racket'
Plugin 'aaronjensen/vim-sass-status.git'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'amdt/vim-niji'
Plugin 'tpope/vim-jdaddy'
Plugin 'jby/tmux.vim'
Plugin 'mustache/vim-mustache-handlebars'

" Ruby
Plugin 'vim-ruby/vim-ruby'
Plugin 'sunaku/vim-ruby-minitest'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-cucumber'
Plugin 'Keithbsmiley/rspec.vim'
Plugin 'tpope/vim-bundler'

" Tools
Plugin 'rking/ag.vim'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'tpope/vim-abolish'
Plugin 'vim-scripts/ctags.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-speeddating'
" Adds automatic closing of quotes
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/greplace.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'benmills/vimux'
Plugin 'danro/rename.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vinegar'
Plugin 'terryma/vim-multiple-cursors'

" Text Objects
Plugin 'kana/vim-textobj-user'
Plugin 'bootleq/vim-textobj-rubysymbol'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'coderifous/textobj-word-column.vim'

Plugin 'godlygeek/tabular'
Plugin 'tomtom/tcomment_vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tolecnal/vim-matchit'
Plugin 'mattboehm/vim-unstack'
Plugin 'rizzatti/funcoo.vim'
Plugin 'tpope/vim-repeat'
Plugin 'majutsushi/tagbar'
Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jaxbot/github-issues.vim'
Plugin 'AndrewRadev/splitjoin.vim'

" Colors
Plugin 'skwp/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'chrisbra/Colorizer'

" Linters
Plugin 'marijnh/tern_for_vim'
Plugin 'scrooloose/syntastic'

" Notification message
if iCanHazVundle == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  :PluginInstall
endif

call vundle#end()
filetype plugin indent on


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

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" SplitJoin
nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>

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
set autoindent
set smartindent
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
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s --files-with-matches -g "" --ignore "\.git$\|\.hg$\|\.svn$"'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Generate ctags
nmap <silent> <leader>rt :!ctags -R --exclude=".git\|.svn\|log\|tmp\|db\|pkg" --extra=+f<CR>

" Source custom Solarized settings
source ~/.vim/settings/solarized.vim
