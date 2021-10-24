" ====================================================================

" Use vim-plug for plugin managing
" https://github.com/junegunn/vim-plug
" ====================================================================

" Automatically install vim-plug if it does not exists
" Curl is required!

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" For manual installation read the docs
" https://github.com/junegunn/vim-plug#installation
"
" or run the following command:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" Specify a directory for plugins
" Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" The plugin provides mappings to easily dele
" surroundings in pairs.
Plug 'tpope/vim-surround'

" It automatically prints number of match #N out of M matches in search
" The plagin is DEPRECATED. Use shortmess-=S instead.
" Plug 'henrik/vim-indexed-search'

" Smooth scrolling
" I've not decided which plugin i like more
" Plug 'vim-scripts/Smooth-Scroll'
" Plug 'yuttie/comfortable-motion.vim'
" Related to use_local_scrolloff variable
Plug 'karb94/neoscroll.nvim'

" Nerd commenter
Plug 'scrooloose/nerdcommenter'

" Better-whitespace
Plug 'ntpeters/vim-better-whitespace'

" Vim fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" ----------------------
" Pluins added to neovim

" If you don't have nodejs and yarn
" use pre build, add 'vim-plug' to the filetype list so vim-plug can update this plugin
" see: https://github.com/iamcco/markdown-preview.nvim/issues/50
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Vim markdown syntax
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Neovim which-key.nvim
Plug 'folke/which-key.nvim'


" vim-which-key
" Plug 'liuchengxu/vim-which-key'
" nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'

" Easy search
" Plug 'justinmk/vim-sneak'

" Auto close brackets
"Plug 'jiangmiao/auto-pairs'
Plug 'windwp/nvim-autopairs'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" FIX: deside which colorize rainbow plugin to use
" TODO: enable tree sitter syntax highlight versus main highlight? Shoul all
" the languages be compiled separately?
" TODO: groovy auto pair
" TODO: autocmd goory/Jenkinsfile filetype
" Colorize parances
Plug 'p00f/nvim-ts-rainbow' "Tree sitter
" Plug 'luochen1990/rainbow'
" let g:rainbow_active = 1

" Color hex codes
Plug 'norcalli/nvim-colorizer.lua'

" File tree
Plug 'preservim/nerdtree'

" Format a file
Plug 'sbdchd/neoformat'

" Show indent lines
Plug 'lukas-reineke/indent-blankline.nvim'

" Add a Nord theme
Plug 'arcticicestudio/nord-vim'

" Emacs-like narrowing
Plug 'chrisbra/NrrwRgn'

" Expand selected area
Plug 'terryma/vim-expand-region'

" Undo-tree
Plug 'mbbill/undotree'

" TODO: Remove/change the ctrl-p
" TODO: add appearance of ":" symbol in the TODO: and others
" Ctrl-p finder
" Plug 'ctrlpvim/ctrlp.vim'

" telescope.nvim
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Run commands quickly
Plug 'thinca/vim-quickrun'

" Magit
" Plug 'TimUntersberger/neogit'

" Easymotion/acejump/easyjomp/ivy for neovim
Plug 'phaazon/hop.nvim'

" TODO: File tree written in Lua
Plug 'kyazdani42/nvim-web-devicons' " for file icons
" Plug 'kyazdani42/nvim-tree.lua'

" Check nvim-compe: completion Lua based extension
Plug 'hrsh7th/nvim-compe'

" TODO-commends:
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/todo-comments.nvim'

" Add pictograms in completion
Plug 'onsails/lspkind-nvim'

" Zen-mode
Plug 'folke/zen-mode.nvim'
Plug 'Pocco81/TrueZen.nvim'

" Grub buddy theme by tj
" https://github.com/tjdevries/gruvbuddy.nvim
Plug 'tjdevries/colorbuddy.vim'
Plug 'tjdevries/gruvbuddy.nvim'

" Default grubbox theme
Plug 'rktjmp/lush.nvim'
Plug 'npxbr/gruvbox.nvim'

" Telescope projectile
Plug 'nvim-telescope/telescope-project.nvim'

" nvim-lspinstall
" TODO: Windows doesn't work (/usr/bin/env not found)
Plug 'kabouzeid/nvim-lspinstall'

" Add sane commands to manipulate files (Delete,Rename,Move)
Plug 'tpope/vim-eunuch'

" Add lua REPL
" TODO: do I need this?
Plug 'bfredl/nvim-luadev'
"
" " Add lua runner
" Plug 'tjdevries/nlua.nvim'

" Add lua pad
" Plug 'rafcamlet/nvim-luapad'

"Add csv support
Plug 'chrisbra/csv.vim'

" Initialize plugin system
call plug#end()

" ====================================================================
" General settings
" ====================================================================

set number                     " show number of line
set relativenumber             " show relative numbers
set numberwidth=4              " set width of numbers 4 spaces
set colorcolumn=80             " show vertical line
syntax on                      " use syntax highlight
set mouse=a                    " use mouse
colorscheme nord                " color scheme
set clipboard=unnamedplus      " use system clipboard by default

" Tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab                  " use spaces, not tabs
set smarttab                   " make <tab> and <backspace> smarter
set scrolloff=4                " keep at least 5 lines above/below cursor
set sidescrolloff=4            " keep at least 5 columns left/right of cursor

set autoindent smartindent     " Set autoindent from one line to the next
" set cursorline                 " Set cursorline

" Get the nice 2-space YAML as the default when hitting "Enter" after the colon
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Set Groovy syntax if filename=Jenkinsfile
autocmd BufNewFile,BufRead Jenkinsfile set filetype=groovy

" Show the line and column number of the cursor position, separated by a comma
set ruler

" Make Vim deal with case-sensitive search intelligently.
" If you search for an all-lowercase string your search will be
" case-insensitive, but if one or more characters is uppercase the search will
" be case-sensitive.
set ignorecase
set smartcase

" Searching
set hlsearch                   " enable search highlight globally
set incsearch                  " show matches as soon as possible
set showmatch                  " show matching brackets when typing
set matchtime=10               " show the matching paren during 1 second

set showcmd                    " show partial command in status line

" When on, lines longer than the width of the window will wrap and display in
" continues on the next line.
set wrap


" ==============================
" Plugin settings
" ==============================

" -----------------------------------------------------------------------------

" NERD commenter

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" -----------------------------------------------------------------------------

" Vim-better-whitespace

" use green color for showing whitespaces
highlight ExtraWhitespace ctermbg=green

" not to show trailing whitespaces for these filetypes
let g:better_whitespace_filetypes_blacklist=
                                 \ ['diff', 'gitcommit', 'unite', 'qf', 'help']

" -----------------------------------------------------------------------------


" ==============================
" Mappings
" ==============================

" set leader key to the <Space>
let mapleader = " "
let maplocalleader = '\'

" inverse word letters
nnoremap <leader>u viw~e

" open .vimrc for edit in vertical split
nnoremap <leader>vo :vsplit $MYVIMRC<CR>:noh<CR>

" read (source) .vimrc file and apply changes right now
" :noh need for not highlighting the last searched results
nnoremap <leader>vs :source $MYVIMRC<CR>:noh<CR>

" open ~/.ssh/config for edit in vertical split
nnoremap <leader>vc :vsplit $HOME/.ssh/config<CR>:noh<CR>

" moving in wrap lines
nnoremap j gj
nnoremap k gk

" exit from insert mode
inoremap jk <ESC>

" remove characters without yanking to clipboard
nnoremap x "_x
nnoremap X "_X

" using modern regex patterns
" Update: Do wee need it while using 'set ignorecase' ?
" nnoremap / /\v
" vnoremap / /\v

" disable arrow keys in normal and insert modes
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" show error message to force using hjkl instead of arrow keys
noremap <Up>       :echoerr "Use k instead!"<CR>$
noremap <Down>     :echoerr "Use j instead!"<CR>$
noremap <Left>     :echoerr "Use l instead!"<CR>$
noremap <Right>    :echoerr "Use h instead!"<CR>$

" moving at split windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" changing tabs
nnoremap <F7> :tabprevious <CR>
nnoremap <F8> :tabnext <CR>

" abbreviations
iabbrev adn and
iabbrev whlie while
iabbrev waht what
iabbrev fro for
" iabbrev @@ <my_email>

" Execute python script
nnoremap <buffer> <F9> :exec '!clear; python' shellescape(@%, 1)<cr>

" New configuration
set termguicolors

" Move selected blocks
vnoremap > >gv
vnoremap < <gv

let g:indent_blankline_char = '│'
let g:indent_blankline_filetype_exclude = ['help', 'txt', 'md']

set hidden
set autochdir

nnoremap <leader>r :QuickRun<cr>
nnoremap <leader>hh :HopChar2<cr>
nnoremap <leader>hl :HopLine<cr>

" Go to definition with coc
" nnoremap <silent> gd :call CocAction('jumpDefinition', 'drop')<cr>
nnoremap gd :lua vim.lsp.buf.definition()<CR>

" ====== TODO: remove compe settins

set completeopt=menuone,noselect
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true
let g:compe.source.luasnip = v:true
let g:compe.source.emoji = v:true

" DO: remove this
" ====== TODO: remove compe settins

" TODO: remove this
nnoremap <silent> gs :e ~/.vimrc<CR>
nnoremap <silent> gc :e ~/git/university/programming/lab2-2/matrix.cc<CR>
" TODO: remove this

" TODO: Rewrite to packer
" TODO: remove duplicates if exist
" TODO: learn grep current buffer / all buffers

" Show diff between the buffer and the file
" Thank you https://stackoverflow.com/a/749320
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

" Arrange help pages vertically
autocmd FileType help wincmd L

" Show changes between the buffer and the file
nnoremap <leader>d :DiffSaved<cr>
" Disable highlight after a search
nnoremap <silent> <F3> :noh<cr>

" LSP config (the mappings used in the default file don't quite work right)
" https://www.chrisatmachine.com/Neovim/27-native-lsp/
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>

" Emacs-like quickfix keybindings
autocmd FileType qf nnoremap <buffer> <C-n> <cmd>cnext<cr><C-w><C-p>
autocmd FileType qf nnoremap <buffer> <C-p> <cmd>cprev<cr><C-w><C-p>
autocmd FileType qf nnoremap <buffer> <cr> <cr><C-w><C-p>

" Russian insert mode
" moving in wrap lines
nnoremap л gk
nnoremap о gj
nnoremap р h
nnoremap д l

" exit from insert mode
inoremap ол <ESC>

" Open window in a new tab
nnoremap <C-w>t <cmd>tabedit %<cr><C-o>

" Delete buffer without affectiong the window
nnoremap <leader>bd <cmd>bn<cr><cmd>bd! # <cr>

" Open telescope projectile
nnoremap <leader>tp <cmd>Telescope project<cr>

" Autocompleteon for command-line
set wildmode=longest:full

command Hexmode execute "%!xxd"

nnoremap <F12> <cmd>NERDTreeToggle<cr>
