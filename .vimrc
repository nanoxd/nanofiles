"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "

set nocompatible " No reason to limit ourselves to vi compatibility
set nobackup
set nowritebackup
set noswapfile
set ruler
set history=300
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

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
set complete=.,w,t
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Bundles && Bundle Specific Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Declare bundles are handled via Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

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
Bundle 'pangloss/vim-javascript'
Bundle 'leshill/vim-json'
Bundle 'tpope/vim-markdown'
Bundle 'thiderman/nginx-vim-syntax'
Bundle 'b4winckler/vim-objc'
Bundle 'ajf/puppet-vim'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'vim-ruby/vim-ruby'
Bundle 'sunaku/vim-ruby-minitest'
Bundle "aaronjensen/vim-sass-status.git"
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'tpope/vim-bundler'

" Tools
Bundle 'vim-scripts/ctags.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'thoughtbot/vim-rspec'
" Adds automatic closing of quotes
Bundle "Raimondi/delimitMate"
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'mattn/gist-vim'
Bundle 'vim-scripts/greplace.vim'
Bundle 'tsaleh/vim-matchit'
Bundle 'SirVer/ultisnips'
Bundle 'benmills/vimux'
" File Management
Bundle 'scrooloose/nerdtree'
Bundle 'danro/rename.vim'
Bundle 'tpope/vim-surround'
" VIM Syntax Linter
Bundle 'scrooloose/syntastic'
" Text filtering and alignment
Bundle 'godlygeek/tabular'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'tomtom/tcomment_vim'
Bundle 'graudeejs/vim-matchit'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'mattboehm/vim-unstack'
Bundle 'mattboehm/vim-accordion'
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-rbenv'
Bundle 'majutsushi/tagbar'
Bundle 'Valloric/YouCompleteMe'

" Colors
Bundle 'altercation/vim-colors-solarized'
Bundle 'd11wtq/tomorrow-theme-vim'
Bundle 'bling/vim-airline'
Bundle 'chriskempson/base16-vim'

"" CtrlP
" Adds ; as the Ctrl+P fuzzy search
nmap ; :CtrlPBuffer<CR>
" Show the damn dotfiles
let g:ctrlp_show_hidden = 1

"" NERDTree
nmap \e :NERDTreeToggle<CR>

let g:rspec_command = "!rspec {spec}"
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Move between buffers
map <Leader>b :bnext<CR>

" Change default keys for UltiSnips
let g:UltiSnipsExpandTrigger="<F1>"
let g:UltiSnipsJumpForwardTrigger="<F2>"

" Change default key for vim-unstack
let g:unstack_mapkey="<F4>"
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

""""Language specific whitespace

" make uses real tabs
au FileType make set noexpandtab

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Procfile,Thorfile,config.ru}  set ft=ruby

" Set Sass files as sass
 au BufRead,BufNewFile *.scss set filetype=scss

au BufRead,BufNewFile *.txt call s:setupWrapping()

" make Python follow PEP8
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Markdown files end in .md
au BufRead,BufNewFile *.md set filetype=markdown
" Enable spellchecking for Markdown
au BufRead,BufNewFile *.md setlocal spell

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
let g:syntastic_quiet_warnings=1

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

" Use Ag (https://github.com/ggreer/the_silver_searcher) instead of Grep when
" available
if executable("ag")
  set grepprg=ag\ --noheading\ --nogroup\ --nocolor
endif

" Generate ctags
nmap <silent> <leader>rt :!ctags -R --exclude=".git\|.svn\|log\|tmp\|db\|pkg" --extra=+f<CR>
