set nocompatible                      " Don't maintain compatibilty with Vi

" Use the space key as a leader
let mapleader = "\<Space>"

" Vim-plug plugin manager
call plug#begin()
Plug 'tpope/vim-sensible'             " Defaults everyone can agree on
Plug 'tpope/vim-surround'             " Quoting/Parenthesizing made simple
Plug 'tpope/vim-repeat'               " Supercharge Vim's dot command
Plug 'tpope/vim-rails'                " Ruby on Rails power tools
Plug 'tpope/vim-commentary'           " Comment stuff out
Plug 'tpope/vim-dispatch'             " Asynchronous build and test dispatcher
Plug 'tpope/vim-bundler'              " Lightweight support for Ruby's Bundler
Plug 'tpope/vim-endwise'              " Wisely add various 'ends'
Plug 'tpope/vim-fugitive'             " Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-unimpaired'           " Pairs of handy bracket mappings
Plug 'ctrlpvim/ctrlp.vim'             " Fuzzy file, buffer, mru, tag, etc finder
Plug 'thoughtbot/vim-rspec'           " Run Rspec specs from Vim
Plug 'nanotech/jellybeans.vim'        " Color scheme
Plug 'vim-airline/vim-airline'        " Lean & mean status/tabline
Plug 'vim-airline/vim-airline-themes' " Themes for vim-airline
Plug 'airblade/vim-gitgutter'         " Git diff in buffer
Plug 'amerlyq/vim-focus-autocmd'      " Focus events for vim in terminal
Plug 'sheerun/vim-polyglot'           " Solid language pack
Plug 'scrooloose/syntastic'           " Syntax checker
Plug 'mbbill/undotree'                " Visualize undo branches
call plug#end()

" Use the colorscheme from above
colorscheme jellybeans

" Boolean settings
set number                            " Display line numbers beside buffer
set relativenumber                    " Relavive number of lines from the current one
set hidden                            " Allow buffer change w/o saving
set lazyredraw                        " Don't update while executing macros
set showcmd                           " display incomplete commands
set autowrite                         " Automatically :write before running commands

" No backups and swaps
set nobackup
set nowritebackup
set noswapfile

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation
set nojoinspaces

" Use PowerLine fonts in airline
let g:airline_powerline_fonts = 1

" Syntastic recommended settings for beginners
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

" Make it obvious where 100 characters is
set textwidth=100
set colorcolumn=+1

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Persistent undo
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

" Edit vimrc in new tab
nmap <leader>vr :tabedit $HOME/code/dotfiles/vimrc<cr>

" Source (reload) vimrc
nmap <leader>so :source $HOME/code/dotfiles/vimrc<cr>

" Easy pasting
nmap <leader>p o<esc>"+P
nmap <leader>P o<cr><esc>k"+P

" Move up and down by visible lines if current line is wrapped
nmap j gj
nmap k gk

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" UndoTree
nnoremap <F5> :UndotreeToggle<cr>

" Overwrite common typo
nmap q: :q

" Execute macro in q
map Q @q

" Disable K looking stuff up
map K <Nop>

" Note that remapping C-s requires flow control to be disabled
" (e.g. in .bashrc or .zshrc)
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

" Partial text search in command mode with CTRL-P instead of arrow keys
cmap <C-P> <Up>
cmap <C-N> <Down>

" Bind `q` to close the buffer for help files
autocmd Filetype help nnoremap <buffer> q :q<CR>

" Command aliases for typoed commands (accidentally holding shift too long)
command! Q q " Bind :Q to :q
command! Qall qall
command! QA qall
command! E e
command! W w
command! Wq wq
