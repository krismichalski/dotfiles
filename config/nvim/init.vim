call plug#begin('~/.local/share/nvim/site/')
  Plug 'morhetz/gruvbox'                    " Color scheme
call plug#end()

" Use the colorscheme from above
let g:gruvbox_italic=1
set background=dark
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
highlight Normal ctermbg=NONE
nnoremap <silent> [oh :call gruvbox#hls_show()<CR>
nnoremap <silent> ]oh :call gruvbox#hls_hide()<CR>
nnoremap <silent> coh :call gruvbox#hls_toggle()<CR>
nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?
