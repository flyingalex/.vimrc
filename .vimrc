set nocompatible
set encoding=utf8

"Plugins --------------------------------{{{

call plug#begin('~/.vim/plugged')
" plugin on GitHub repo
Plug 'https://github.com/Townk/vim-autoclose.git'
Plug 'editorconfig/editorconfig-vim'
Plug 'https://github.com/flyingalex/StabFromVimcasts'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'posva/vim-vue'
Plug 'dense-analysis/ale'
Plug 'Shougo/denite.nvim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'easymotion/vim-easymotion'
Plug 'vim-syntastic/syntastic'

"git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'elixir-editors/vim-elixir'
Plug 'carlosgaldino/elixir-snippets'
Plug 'mhinz/vim-mix-format'
Plug 'slashmili/alchemist.vim'

" theme
Plug 'altercation/vim-colors-solarized'
Plug 'flrnd/candid.vim'
Plug 'sainnhe/forest-night'
Plug 'lifepillar/vim-solarized8'
Plug 'morhetz/gruvbox'

Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

" search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'Valloric/YouCompleteMe'
call plug#end()

"}}}

" Vimscript file settings ---------------{{{

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}

filetype off
filetype plugin indent on  " Load plugins according to detected filetype.

syntax on                  " Enable syntax highlighting.
set background=dark
colorscheme gruvbox

" colorscheme forest-night
" let g:solarized_termcolors=256 "fix solarized theme issue
" colorscheme solarized
" colorscheme monokai

" options --------------------------------{{{

set autoindent             " Indent according to previous line.
set pastetoggle=<f5>       " Toggle paste
set expandtab              " Use spaces instead of tabs.
set softtabstop =4         " Tab key indents by 4 spaces.
set shiftwidth  =4         " >> indents by 4 spaces.
set shiftround             " >> indents to next multiple of 'shiftwidth'.

set backspace   =indent,eol,start  " Make backspace work as you would expect.
set hidden                 " Switch between buffers without having to save first.
set laststatus  =2         " Always show statusline.
set display     =lastline  " Show as much as possible of the last line.

set showmode               " Show current mode in command-line.
set showcmd                " Show already typed keys when more are expected.

set incsearch              " Highlight while searching with / or ?.
"set hlsearch               " Keep matches highlighted.

set ttyfast                " Faster redrawing.
set lazyredraw             " Only redraw when necessary.

set splitbelow             " Open new windows below the current window.
set splitright             " Open new windows right of the current window.

set cursorline             " Find the current line quickly.
set wrapscan               " Searches wrap around end-of-file.
set report      =0         " Always report changed lines.
set synmaxcol   =200       " Only highlight the first 200 columns.
set number                 " set  line number
set list                   " Show non-printable characters.
set ignorecase
set smartcase
set wildignorecase
set wildmode=longest,list
hi CursorLine term=bold cterm=bold guibg=Grey40
" Put all temporary files under the same directory.
" https://github.com/mhinz/vim-galore#handling-backup-swap-undo-and-viminfo-files
set backup
set backupdir   =$HOME/.vim/files/backup/
set backupext   =-vimbackup
set backupskip  =
set directory   =$HOME/.vim/files/swap/
set updatecount =100
set undofile
set undodir     =$HOME/.vim/files/undo/
set viminfo     ='100,n$HOME/.vim/files/info/viminfo
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPBuffer'
"}}}

" vim variables --------------------------{{{

let g:plug_timeout = 100000
let mapleader = ","
"set autochdir              " Change current directory automatically
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories=["mycoolsnippets"]
"}}}

" plugin config -------------------------{{{


" Put this in vimrc or a plugin file of your own.
" After this is configured, :ALEFix will try and fix your JS code with ESLint.
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'vue': ['eslint']
\}
" Set this setting in vimrc if you want to fix files automatically on save.
" This is off by default.
let g:ale_fix_on_save = 1

"vue
autocmd FileType vue syntax sync fromstart

" ts config
let g:yats_host_keyword = 1

" vue config
let g:vue_disable_pre_processors = 1

let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
let g:clang_user_options='|| exit 0'
let g:clang_complete_auto = 1
let g:clang_complete_copen = 1
let g:clang_debug = 1


"NERDTree config
nnoremap <C-n> :NERDTreeToggle<CR>

"vim-mix-format
let g:mix_format_on_save = 1


"search
let g:rg_command = 'rg --vimgrep -S'
nmap <C-P> :FZF<CR>
" add blew command to .bash to ignore .gitignore files
" export FZF_DEFAULT_COMMAND='rg --files' 
" dependency
" https://github.com/dandavison/delta
" https://github.com/dandavison/delta

" 'tiagofumo/vim-nerdtree-syntax-highlight' config
let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1
let g:NERDTreeHighlightCursorline = 0

" 'ryanoasis/vim-devicons' config

" 'vim-airline/vim-airline' config
let g:airline#extensions#tabline#enabled = 1

" 'vim-airline/vim-airline-themes' config
let g:airline_theme='base16_atelierforest'

" 'vim-syntastic/syntastic' config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" 'Valloric/YouCompleteMe' config
let g:ycm_autoclose_preview_window_after_completion=1
"}}}



" map config -------------------------------{{{

" Get the current file's path
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
" edit .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" reload .vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" use jk for esc
inoremap jk <esc>
" forbid esc
inoremap <esc> <NOP>

" tab feature
nnoremap <C-j> :tabprevious<cr>
nnoremap <C-k> :tabnext<cr>
nnoremap <leader>n :tabnew<cr>

" nnoremap <C-p> :Denite buffer<CR>
nnoremap gm :LivedownToggle<CR>
"}}}

" if clause-------------------{{{

if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

" The fish shell is not very compatible to other shells and unexpectedly
" breaks things that use 'shell'.
if &shell =~# 'fish$'
  set shell=/bin/bash
endif

"}}}


" vimscript notes --------------------- {{{
"  ==# 大小写敏感
"  ==? 大小写不敏感
"
"  函数需要大写开头
"  调用函数的方法有两种: 1. call, 有副作用时使用,返回值会被丢弃; 2. echom,获取返回值.
"  需要参数的Vimscript函数的时候，你总需要给参数加上前缀a:，来告诉Vim去参数作用域查找
"  function Varg2(foo, ...) // ... 可变参数
"    echom a:foo            // 函数变量
"    echom a:0              // 可变参数的个数
"    echom a:1              // 可变参数第一个值
"    echo a:000             // 可变参数列表
"    let a:foo = 'Nope'     // 函数变量赋值
"  endfunction
"  call Varg2('a', 'b', 'c')

"
"}}}

