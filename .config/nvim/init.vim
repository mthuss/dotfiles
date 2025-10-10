lua require('plugins')
colorscheme gruvbox
set background=light
syntax on
set number
set wildmenu
set wildmode=list:longest
set incsearch
set number relativenumber
set undofile
set undodir=$HOME/.vimundo/
set hlsearch
set ttyfast
set shiftwidth=4 smarttab

"Misc Keymaps
inoremap jj <esc>
noremap <F3> :set hlsearch!<CR>	
noremap <F5> :w<CR>:!gcc % -o %< && ./%<<CR>
noremap <C-e> :NERDTreeToggle<CR>

"Open terminal in specific directions
noremap <C-t>l :rightb vert term<CR>
noremap <C-t>h :vert term<CR>
noremap <C-t>j :below term<CR>
noremap <C-t>k :term<CR>
noremap <C-t>t :botright term<CR>

"Tabs
noremap tn :tabnew<CR>
noremap tk :tabnext<CR>
noremap tj :tabprev<CR>

"Keymaps for managing windows
noremap <C-n> :rightb vert split<CR>
noremap < <C-w><
noremap > <C-w>>
noremap + <C-w>-
noremap _ <C-w>+
"noremap <C-h> <C-w>h
"noremap <C-j> <C-w>j
"noremap <C-k> <C-w>k

"noremap <C-l> <C-w>l

"Functions
function InsertTabWrapper()
let col = col('.') - 1
if !col || getline('.')[col - 1] !~ '\k'
return "\<tab>"
else
return "\<c-p>"
endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" STATUS LINE ------------------------------------------------------------ {{{

" Clear status line when vimrc is reloaded.
"set statusline=

" Status line left side.
"set statusline+=\ %F\ %M\ %R

" Use a divider to separate the left side from the right side.
"set statusline+=%=

" Status line right side.
"set statusline+=\ ascii:\ %b\ row:\ %l\ col:\ %c

" Show the status on the second to last line.
"set laststatus=2

"Statusline color
"hi StatusLine ctermbg=white ctermfg=97
" }}}

"hi Normal guibg=NONE ctermbg=NONE

"Plugin Stuff
call plug#begin()
  Plug 'preservim/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'lervag/vimtex'
  Plug 'sirver/ultisnips'
  Plug 'maxmellon/vim-jsx-pretty'
call plug#end()

filetype plugin indent on
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:vimtex_view_forward_search_on_start=0
let g:vimtex_syntax_conceal = {
    \ 'accents': 1,
    \ 'ligatures': 1,
    \ 'cites': 1,
    \ 'fancy': 1,
    \ 'greek': 1,
    \ 'math_bounds': 1,
    \ 'math_delimiters': 1,
    \ 'math_fracs': 1,
    \ 'math_super_sub': 1,
    \ 'math_symbols': 1,
    \ 'sections': 0,
    \ 'styles': 1,
    \}

" Ultisnips config
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories = ['/home/matheus/.config/nvim/UltiSnips']

" Spelling correction
setlocal spell
set spelllang=pt_br,en_us
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
