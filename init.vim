" Appearance
set nocompatible " don't try to be compatible with V
filetype plugin on
lua require('plugins')
set expandtab
set hidden
set tabstop=2
set softtabstop=2
set shiftwidth=2
setlocal textwidth=79
setlocal foldmethod=expr
filetype plugin indent on

syntax on
	set t_Co=256
set mouse=a
if &shell =~# 'fish$'
    set shell=sh
endif
compiler fish
" </essentials>
" Airline
set nowrap
set number
set textwidth=0
set background=dark

set noshowmode
set laststatus=2
let g:loaded_perl_provider = 0
let g:airline#extensions#ale#enabled=1
let g:airline#extensions#whitespace#mixed_indent_algo=1
let g:python_host_prog = '/Users/maryamabdoli/.virtualenvs/demo/bin/python'
" let g:ruby_host_prog = '/home/chris/.gem/ruby/2.4.0/bin/neovim-ruby-host.ruby2.4'
" COC

set cmdheight=2
set updatetime=300
set shortmess+=c

if has("nvim-0.5.0") || has("patch-8.1.1564")
	set signcolumn=number
else
	set signcolumn=yes
endif

inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()

inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"
inoremap <silent><expr> <cr> "\<c-g>u\<CR>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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

nmap <leader>rn <Plug>(coc-rename)

xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call CocAction('fold', <f-args>)
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" ALE

let g:ale_fixers={}
let g:ale_fix_on_save=1
let g:ale_set_highlights=0
let g:ale_linters = {
  \ 'go': ['gopls'],
  \}
" NERDTree

let g:NERDTreeWinSize=27
let g:NERDTreeGitStatusPorcelainVersion=1

" jedi-vim
let g:jedi#use_tabs_not_buffers = 1

nnoremap <TAB> :NERDTreeToggle<CR>
autocmd VimEnter * if &modifiable | NERDTreeFind | wincmd p | endif
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

call plug#begin('~/.config/nvim/plugged')
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'morhetz/gruvbox'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'vim-syntastic/syntastic'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'dense-analysis/ale'
Plug 'vim-test/vim-test'
Plug 'davidhalter/jedi-vim'
Plug 'duane9/nvim-rg'
call plug#end()
set background=dark
colorscheme gruvbox


" Terraform

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

nnoremap <silent> <C-Left> :call WinMove('h')<CR>
nnoremap <silent> <C-Down> :call WinMove('j')<CR>
nnoremap <silent> <C-Up> :call WinMove('k')<CR>
nnoremap <silent> <C-Right> :call WinMove('l')<CR>
nnoremap <A-Down> :m .+1<CR>==
nnoremap <A-Up> :m .-2<CR>==
inoremap <A-Down> <Esc>:m .+1<CR>==gi
inoremap <A-Up> <Esc>:m .-2<CR>==gi
vnoremap <A-Down> :m '>+1<CR>gv=gv
vnoremap <A-Up> :m '<-2<CR>gv=gv
autocmd VimEnter * NERDTree | wincmd p
nnoremap <C-S> :bnext<CR>
nnoremap <C-A> :bprev<CR>
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nmap     <C-F>f <Plug>CtrlSFPrompt
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
