set nocompatible " Don't maintain compatibilty with Vi

" Use the space key as a leader
let mapleader = "\<Space>"

" Vim-plug plugin manager
call plug#begin()
Plug 'tpope/vim-sensible'             " Defaults everyone can agree on
Plug 'tpope/vim-fugitive'             " Awesome git wrapper
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
Plug 'kana/vim-textobj-entire'        " Text objects for entire buffers
Plug 'kana/vim-textobj-user'          " Create your own text objects
Plug 'nelstrom/vim-textobj-rubyblock' " Ruby text objects
Plug 'godlygeek/tabular'              " Alignment
Plug 'dkprice/vim-easygrep'           " Easier find and replace
Plug 'mileszs/ack.vim'                " Run searches with ag
Plug 'scrooloose/nerdtree'            " Tree explorer
Plug 'sirver/ultisnips'               " Snippet engine
Plug 'honza/vim-snippets'             " Snippets
Plug 'tommcdo/vim-exchange'           " Easy text exchange operator
Plug 'Raimondi/delimitMate'           " Auto-insert quotes, brackets, etc.
Plug 'ervandew/supertab'              " Better control over <Tab>
Plug 'pangloss/vim-javascript'        " Improved Javascript
Plug 'ryanoasis/vim-devicons'         " Icons

" Plugins with additional instalation steps
  " CtrlP Matcher
  Plug 'nixprime/cpsm', { 'do': './install.sh' }
  " Fuzzy code completion engine
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --tern-completer' }
call plug#end()

" Use the colorscheme from above
colorscheme jellybeans

" GUI options
set guioptions-=T
set guioptions-=r
set guifont=SauceCodePro\ NF\ 10

" Boolean settings
set number         " Display line numbers beside buffer
set relativenumber " Relavive number of lines from the current one
set hidden         " Allow buffer change w/o saving
set lazyredraw     " Don't update while executing macros
set showcmd        " display incomplete commands
set autowrite      " Automatically :write before running commands
set ignorecase     " Ignore case during searches
set hlsearch       " Highlight all search matches

" No backups and swaps
set nobackup
set nowritebackup
set noswapfile

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

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
  set grepprg=ag\ --nogroup\ --nocolor\ --column

  " Tell Ack to use ag
  let g:ackprg = 'ag --vimgrep'

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -i --nogroup --nocolor --hidden --ignore .git -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

" Use better ctrlP matcher
let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Persistent undo
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

" Edit vimrc in new tab
nmap <leader>er :tabedit $HOME/code/dotfiles/vimrc<cr>

" Source (reload) vimrc
nmap <leader>so :source $HOME/code/dotfiles/vimrc<cr>

" Easy pasting
nmap <leader>p o<esc>"+P
nmap <leader>P o<cr><esc>k"+P

" Move up and down by visible lines if current line is wrapped
nmap j gj
nmap k gk

" Mute highlighting
nnoremap <silent> <leader><leader> :nohlsearch<CR>

" Make new line under current line and stay
nnoremap <CR> o<esc>k

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" UndoTree
nnoremap <F5> :UndotreeToggle<cr>

" NERDTree
nnoremap <F2> :NERDTreeToggle<cr>

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
nmap <C-w> :q<CR>

" Partial text search in command mode with CTRL-P instead of arrow keys
cmap <C-P> <Up>
cmap <C-N> <Down>

" Command aliases for typoed commands (accidentally holding shift too long)
command! Q q " Bind :Q to :q
command! Qall qall
command! QA qall
command! E e
command! W w
command! Wq wq

" close preview window in YCM
let g:SuperTabClosePreviewOnPopupClose = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

function! JSEnter()
  if match(strpart(getline("."), col(".")-1, 3), "})$") >= 0
    return "\<CR>\<C-o>$;\<C-o>O"
  elseif match(strpart(getline("."), col(".")-1, 4), "});$") >= 0
     \|| match(strpart(getline("."), col(".")-1, 2), "}$") >= 0
     \|| match(strpart(getline("."), col(".")-1, 3), "};$") >= 0
    return "\<CR>\<C-o>O"
  else
    return "\<CR>"
  endif
endfunction

autocmd FileType javascript inoremap <buffer> <expr> <CR> JSEnter()
