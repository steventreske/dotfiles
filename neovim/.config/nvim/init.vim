set nocompatible
set showmatch
set ignorecase
set hlsearch
set incsearch
set tabstop=4
set autoindent
set shiftwidth=4
set number
set relativenumber
set cc=80
set cursorline
set ttyfast
set path+=**
set smartindent
set nowrap
set scrolloff=8
set colorcolumn=0
set tags=./tags,tags
syntax on

call plug#begin('~/.local/share/nvim/plugged')
	Plug 'dracula/vim'
	Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'
	Plug 'sheerun/vim-polyglot'
	Plug 'vim-airline/vim-airline'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'ludovicchabant/vim-gutentags'
    Plug 'vimwiki/vimwiki'
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'} " this is for auto complete, prettier and tslinting
    let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier']  " list of CoC extensions needed
    Plug 'jiangmiao/auto-pairs' "this will auto close ( [ {
    " these two plugins will add highlighting and indenting to JSX and TSX files.
    Plug 'yuezk/vim-js'
    Plug 'HerringtonDarkholme/yats.vim'
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'dhruvasagar/vim-table-mode'
call plug#end()

"copy paste
set clipboard+=unnamedplus
let g:clipboard = {
          \   'name': 'win32yank-wsl',
          \   'copy': {
          \      '+': 'win32yank.exe -i --crlf',
          \      '*': 'win32yank.exe -i --crlf',
          \    },
          \   'paste': {
          \      '+': 'win32yank.exe -o --lf',
          \      '*': 'win32yank.exe -o --lf',
          \   },
          \   'cache_enabled': 0,
          \ }

"snippets
let g:UltiSnipsExpandTrigger="<tab>"
" list all snippets for current filetype
let g:UltiSnipsListSnippets="<c-l>"

"leader
nnoremap <SPACE> <Nop>
let mapleader=" "


" fzf
nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<CR>"
nnoremap <Leader>b :Buffers<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>t :BTags<CR>
nnoremap <Leader>T :Tags<CR>

"netwr
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" Vim wiki
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

let g:markdown_fenced_languages = ['json', 'sql', 'java']

" Table mode
nnoremap <Leader>tme :TableModeEnable<cr>

" execute visual selected as command
xnoremap <leader>c <esc>:read !'<,'><CR>

nnoremap <Leader><Enter> :silent! nohls<cr>
noremap <Leader>sv :source $MYVIMRC<cr>

" Skeleton files

if has("autocmd")
  augroup templates
    autocmd BufNewFile *.sh 0r ~/.vim/templates/skeleton.sh
  augroup END
endif
