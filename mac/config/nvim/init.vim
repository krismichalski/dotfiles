" Use the space key as a leader
let mapleader = "\<Space>"

" Plugins
call plug#begin()
  Plug 'tpope/vim-surround'                      " Quoting/Parenthesizing made simple
  Plug 'tpope/vim-repeat'                        " Supercharge Vim's dot command
  Plug 'tpope/vim-rails'                         " Ruby on Rails power tools
  Plug 'tpope/vim-commentary'                    " Comment stuff out
  Plug 'tpope/vim-endwise'                       " Wisely add various 'ends'
  Plug 'tpope/vim-eunuch'                        " Unix commands
  Plug 'morhetz/gruvbox'                         " Color scheme
  Plug 'joshdick/onedark.vim'                    " One dark color scheme
  Plug 'rakr/vim-one'                            " One color scheme
  Plug 'sheerun/vim-polyglot'                    " Solid language pack
  Plug 'alexlafroscia/postcss-syntax.vim'        " PostCSS syntax
  Plug 'stephenway/postcss.vim'                  " Missing postcss language pack
  Plug 'vim-airline/vim-airline'                 " Lean & mean status/tabline
  Plug 'vim-airline/vim-airline-themes'          " Themes for vim-airline
  Plug 'scrooloose/nerdtree'                     " Tree explorer
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " Colorful icons in NERDTree
  Plug 'easymotion/vim-easymotion'               " Move inside file with ease
  Plug 'airblade/vim-gitgutter'                  " Git diff in buffer
  Plug 'mbbill/undotree'                         " Visualize undo branches
  Plug 'kana/vim-textobj-entire'                 " Text objects for entire buffers
  Plug 'kana/vim-textobj-user'                   " Create your own text objects
  Plug 'nelstrom/vim-textobj-rubyblock'          " Ruby text objects
  Plug 'godlygeek/tabular'                       " Alignment
  Plug 'janko/vim-test'                          " Run tests from vim
  Plug 'christoomey/vim-tmux-navigator'          " Seamless navigation between tmux panes and vim splits
  Plug 'tmux-plugins/vim-tmux-focus-events'      " Make autoread work inside tmux
  Plug 'benmills/vimux'                          " Integrate tmux with vim
  Plug 'haya14busa/incsearch.vim'                " Auto disable highlight
  Plug 'Raimondi/delimitMate'                    " Auto-insert quotes, brackets, etc.
  Plug 'chaoren/vim-wordmotion'                  " More useful word motions
  Plug 'simeji/winresizer'                       " Resize windows easily

" Plugins with additional instalation steps

  " Auto-complete, linting, language server and more
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }

  " File search
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " Cool icons, must be last
  Plug 'ryanoasis/vim-devicons'
call plug#end()

" Boolean settings
set number         " Display line numbers beside buffer
set hidden         " Allow buffer change w/o saving
set lazyredraw     " Don't update while executing macros
set showcmd        " Display incomplete commands
set autowrite      " Automatically :write before running commands
set ignorecase     " Ignore case during searches
set hlsearch       " Highlight all search matches
set nowrap         " Do not wrap lines
set nostartofline  " Do not jump to start of the line after buffer switch
set confirm

" No backups and swaps
set nobackup
set nowritebackup
set noswapfile

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Keep margin while scrolling
set scrolloff=5
set sidescrolloff=10

" Use one space, not two, after punctuation
set nojoinspaces

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Give more space for displaying messages.
set cmdheight=2

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Persistent undo
if has("persistent_undo")
  set undodir=~/.undodir/
  set undofile
endif

" Note that remapping C-s requires flow control to be disabled
" (e.g. in .bashrc or .zshrc)
map <silent> <C-s> <esc>:w<CR>
imap <silent> <C-s> <esc>:w<CR>

" Edit rc files
nmap <silent> <leader>er :edit $HOME/code/dotfiles/config/nvim/init.vim<cr>
nmap <silent> <leader>ez :edit $HOME/code/dotfiles/dotfiles/zshrc<cr>
nmap <silent> <leader>et :edit $HOME/code/dotfiles/dotfiles/tmux.conf<cr>

" Source (reload) nvim config
nmap <silent> <leader>so :source ~/.config/nvim/init.vim<cr>

" Easy copy & pasting
nnoremap <silent> <leader>p "+p
nnoremap <silent> <leader>P o<esc>"+p
nnoremap <silent> P "0p
vnoremap <silent> <leader><leader> "+y
cnoremap <silent> <C-v> <C-R>+

" Move up and down by visible lines if current line is wrapped
nmap j gj
nmap k gk

" Quickly switch between buffers
nnoremap <silent> ( :bp<CR>
nnoremap <silent> ) :bn<CR>
nnoremap <silent> <leader><leader> <C-^>
nmap <silent> <C-w> :bd<CR>

" Make new line under current line and stay
nnoremap <silent> <CR> o<esc>k

" Overwrite common typo
nmap q: :q

" Execute macro in q
map Q @q

" Remap VIM 0 to first non-blank character
map 0 ^

" Partial text search in command mode
cmap <C-P> <Up>
cmap <C-N> <Down>

" Command aliases for typoed commands (accidentally holding shift too long)
command! Q q " Bind :Q to :q
command! Qall qall
command! QA qall
command! E e
command! W w
command! Wq wq

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" == to re-balance windows
nnoremap == :wincmd =<CR>

" automatically create missing directories
function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

""""" PLUGIN CONFIG BELOW

" Gruvbox
" set termguicolors
" set background=dark
" let g:gruvbox_italic=1
" let g:gruvbox_contrast_dark='hard'
" let g:gruvbox_hls_cursor='blue'
" colorscheme gruvbox
" highlight Normal ctermbg=NONE guibg=NONE

" onedark
set termguicolors
set background=dark
let g:onedark_terminal_italics=1
let g:airline_theme='onedark'
syntax on
colorscheme onedark
highlight Normal ctermbg=NONE guibg=NONE

" vim-one
" set termguicolors
" set background=dark
" let g:one_allow_italics = 1
" let g:airline_theme='one'
" colorscheme one
" highlight Normal ctermbg=NONE guibg=NONE

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" NERDTree
nnoremap <C-N> :NERDTreeToggle<cr>
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git$', '\.idea$', '\.vscode$', '\.history$']

" EasyMotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
nmap s <Plug>(easymotion-overwin-f2)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" UndoTree
nnoremap <C-U> :UndotreeToggle<cr>

" vim-test
let test#strategy = 'vimux'
nmap <Leader>s :TestNearest<CR>
nmap <Leader>t :TestFile<CR>
nmap <Leader>l :TestLast<CR>
nmap <Leader>v :TestVisit<CR>

" vim-livedown
nmap gm :LivedownToggle<CR>

" vimux
function! VimuxSlime()
  call VimuxOpenRunner()
  call VimuxSendText(@v)
  if @v[strlen(@v)-1] != "\n"
    call VimuxSendKeys("Enter")
  endif
 endfunction
vmap <Leader>x "vy :call VimuxSlime()<CR>
let g:VimuxOrientation = "h"
let g:VimuxHeight = "40"

" incsearch.vim
let g:incsearch#auto_nohlsearch = 1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" fzf.vim
nnoremap <silent> <C-p> :Files<CR>

if executable('rg')
  " set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
  " command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
  " nnoremap <silent> <Leader>f :Rg<CR>'

  function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
  endfunction

  command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
  nnoremap <silent> <Leader>f :RG<CR>'
endif

if has('nvim') && !exists('g:fzf_layout')
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
endif

" vim-rails
cnoremap <expr> <C-A> rails#buffer().alternate_candidates()[0]
cnoremap <C-X> <C-R>%

" vim-endwise
" disable mapping to not break coc.nvim (I don't even use them anyways)
let g:endwise_no_mappings = 1

" read vimrc.local if you trust the repository
if filereadable(".git/safe/../../.vimrc.local")
  source .git/safe/../../.vimrc.local
endif

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

autocmd BufNewFile,BufRead *.pcss setlocal filetype=css
autocmd BufEnter *.pcss :syntax sync fromstart
