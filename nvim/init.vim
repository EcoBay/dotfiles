call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'itchyny/lightline.vim'
Plug 'vimwiki/vimwiki'
Plug 'justinmk/vim-syntax-extra'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'junegunn/fzf.vim'
call plug#end()

" General Settings
set number relativenumber
colorscheme gruvbox

set expandtab
set tabstop=4
set shiftwidth=4

set lcs=tab:>-,lead:.
noremap <F5>:set list!<CR>

set splitbelow splitright

noremap <silent> <Up> gk
noremap <silent> <Down> gj

nnoremap <silent> <leader><space> :w! \| !compile  %:p <CR><CR>
nnoremap <silent> <leader><leader> :! open %:p <CR>

" Lightline settings
if !has('gui_running')
    set t_Co=256
endif

let g:gruvbox_contrast_dark='medium'
let g:gruvbox_contrast_light='soft'

let g:lightline = {
    \ 'colorscheme': 'gruvbox',
    \ }

autocmd BufRead,BufNewFile *.ms set filetype=groff
autocmd VimResized * wincmd =
autocmd VimEnter * silent !echo -ne "\1\e[2 q\2"

set laststatus=2
set noshowmode
set background=dark

" Nvim-R settings
let R_assign = 3
let R_nvim_wd = -1

" Vimwiki settings
let g:vimwiki_global_ext = 0
let g:vimwiki_list = [
    \ {'path': $ACAD,
    \ 'syntax': 'markdown',
    \ 'ext': '.md'},
    \ {'path': $XDG_DATA_HOME . '/vimwiki'}
    \ ]

" CoC settings
set encoding=utf-8
set hidden
set updatetime=300
set shortmess+=c
set signcolumn=number

" Coc mappings
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> K :cal <SID>show_documentation()<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)
nmap <leader>e :Files<CR>
