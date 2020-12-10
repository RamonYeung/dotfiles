
"  __  __        __     _____ __  __ ____   ____
" |  \/  |_   _  \ \   / /_ _|  \/  |  _ \ / ___|
" | |\/| | | | |  \ \ / / | || |\/| | |_) | |
" | |  | | |_| |   \ V /  | || |  | |  _ <| |___
" |_|  |_|\__, |    \_/  |___|_|  |_|_| \_\\____|
"         |___/

" TODO high-light search

" === Auto load for first time uses
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Forget about VI
set nocompatible


" => General Settings --------------------------------------------------------
set number
set relativenumber
set expandtab
set history=1000
set encoding=utf-8
syntax on
set backspace=indent,eol,start
set smarttab
set shiftwidth=4
" show a visual line under the cursor's current line
set cursorline
" Show the 80th char column
set colorcolumn=80
highlight ColorColumn ctermbg=3
" Minimal number of screen lines to keep above and below the cursor
set scrolloff=5
set splitright
set splitbelow
" set clipboard=unnamed
set showcmd
set wildmenu
" Searching options
set ignorecase
set smartcase
" enable true colors support
set termguicolors     
filetype plugin indent on 


" => Personal Settings -------------------------------------------------------
" Copy to system clipboard
vnoremap Y :w !xclip -i -sel c<CR>
" Neovim stuff
let g:neoterm_autoscroll = 1
" Faster navigation
nmap J 5j
nmap K 5k
" Press ` to change case (instead of ~)
nmap ` ~
" indent and unindent for NORMAL mode
nmap <Tab> >>
nmap <S-Tab> <<
" Saving Things More Naturally
nmap <C-S> :w<CR>:echo "Changes Saved !!"<CR>


" => Customize Python Utils --------------------------------------------------
nmap <leader>r :call CompileAndRun()<CR>
nmap <leader>s :AsyncStop<CR>

func! CompileAndRun()
        exec "w"
        if &filetype == 'python'
                if search("@profile")
                        exec "AsyncRun kernprof -l -v %"
                        exec "copen"
                        exec "wincmd p"
                elseif search("set_trace()")
                        exec "!python3 %"
                else
                        exec "AsyncRun -raw python3 %"
                        exec "copen"
                        exec "wincmd p"
                endif
        endif
endfunc

" => Plugin -------- ---------------------------------------------------------
call plug#begin('~/.config/nvim/plugins')

" Pretty Dress
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Auto Complete
Plug 'jiangmiao/auto-pairs'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-github'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-match-highlight'
" ncm2 dependency
Plug 'roxma/nvim-yarp'
" Snippets
" Plug 'SirVer/ultisnips'
" Python Plugins
Plug 'tmhedberg/SimpylFold'
Plug 'skywind3000/asyncrun.vim'
Plug 'nvie/vim-flake8'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'terryma/vim-multiple-cursors'
Plug 'kassio/neoterm'
call plug#end()


" => Plugin Settings ---------------------------------------------------------
" SimplyFold Settings
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za
let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_docstring = 0
" NerdTree Settings
nnoremap <leader>n :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" Airline Settings
set laststatus=2
set t_Co=256
set noshowmode
" Airline Theme Settings
let g:airline_theme = 'bubblegum'
" indentLine Settings
let g:indentLine_char = '|'
let g:indentLine_showFirstIndentLevel = 1
" UltiSnips Settings
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
let g:ultisnips_python_style = "google"
" Airline Theme Settings
let g:airline_theme='dracula'
let g:lightline = {
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     }
  \ }
" NCM2
let g:python3_host_prog = '/home/chensir/workspace/haihong/app/anaconda3/bin/python3'
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>": "\<CR>")
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
let ncm2#popup_delay = 5
let g:ncm2#matcher = "substrfuzzy"
let g:ncm2_jedi#python_version = 3
let g:ncm2#match_highlight = 'sans-serif'

" semshi settings
let g:semshi#error_sign = v:false


" vim-multiple-cursor
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_start_word_key      = '<c-k>'
let g:multi_cursor_select_all_word_key = '<a-k>'
let g:multi_cursor_start_key           = 'g<c-k>'
let g:multi_cursor_select_all_key      = 'g<a-k>'
let g:multi_cursor_next_key            = '<c-k>'
let g:multi_cursor_prev_key            = '<c-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'



