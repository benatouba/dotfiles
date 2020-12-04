" benatouba (n)vim config
" heavily inspired by:
" Fisa-nvim-config
" http://nvim.fisadev.com
" version: 12.0.1

if v:progname == 'vi'
  set noloadplugins
  set nocompatible
endif

" Some variables 
set encoding=utf-8
let using_neovim = has('nvim')
let using_vim = !using_neovim

" ============================================================================
" Vim-plug initialization
" Avoid modify this section, unless you are very sure of what you are doing

let vim_plug_just_installed = 0
if using_neovim
    let vim_plug_path = expand('~/.config/nvim/autoload/plug.vim')
else
    let vim_plug_path = expand('~/.vim/autoload/plug.vim')
endif

if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    if using_neovim
        silent !mkdir -p ~/.config/nvim/autoload
        silent !curl -fLo ~/nguag.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    else
        silent !mkdir -p ~/.vim/autoload
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    endif
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

" ============================================================================
" Active plugins
" You can disable or add new ones here:

" this needs to be here, so vim-plug knows we are declaring the plugins we
" want to use
if using_neovim
    call plug#begin('~/.config/nvim/plugged')
else
    call plug#begin("~/.vim/plugged")
endif

" Aesthetics - Main
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/goyo.vim'
" Plug 'junegunn/limelight.vim'
Plug 'junegunn/seoul256.vim'
" Plug 'junegunn/vim-journal'
Plug 'junegunn/rainbow_parentheses.vim'

" Aethetics - themes
Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim' }
Plug 'dracula/vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'jacoborus/tender.vim'
Plug 'joshdick/onedark.vim'
Plug 'KeitaNakamura/neodark.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'liuchengxu/space-vim-dark'
Plug 'mhartington/oceanic-next'
Plug 'neg-serg/neg'
Plug 'nightsense/forgotten'
Plug 'rhysd/vim-color-spring-night'
Plug 'sjl/badwolf'
Plug 'tomasr/molokai'
Plug 'zaki/zazen'
Plug 'chriskempson/base16-vim'
Plug 'flazz/vim-colorschemes'
Plug 'phanviet/vim-monokai-pro'
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'tjdevries/colorbuddy.nvim'
Plug 'tjdevries/gruvbuddy.nvim'
Plug 'colepeters/spacemacs-theme.vim'

" Maximize pane toggle
Plug 'szw/vim-maximizer'
" view man pages and grep from them
Plug 'vim-utils/vim-man' " TODO: Learn and test

Plug 'jackguo380/vim-lsp-cxx-highlight'

" Firenvim neovim in the browser
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
" Nvim  Treesitter
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/playground'
" Close buffers but keep splits
Plug 'moll/vim-bbye'
" Override configs by directory
Plug 'arielrossanigo/dir-configs-override.vim'
" Code commenter
Plug 'scrooloose/nerdcommenter'
" easier terminal Commands
Plug 'kassio/neoterm'
" Search results counter
Plug 'vim-scripts/IndexedSearch'
" Code and files fuzzy finder
" Plug 'ctrlpvim/ctrlp.vim'
" Extension to ctrlp, for fuzzy command finder
Plug 'fisadev/vim-ctrlp-cmdpalette'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim' " TODO: Learn and test 
" Pending tasks list
Plug 'fisadev/FixedTaskList.vim'
" Async autocompletion
" Plug 'Shougo/echodoc.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" View and search LSP symbols and tags
Plug 'liuchengxu/vista.vim'
" Completion from other opened files
Plug 'Shougo/context_filetype.vim'
" Testing
Plug 'janko/vim-test'
""  Python 
" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins', 'for': 'python'}
" Plug 'zchee/deoplete-jedi', { 'do': ':UpdateRemotePlugins' }
" Plug 'davidhalter/jedi-vim'
" Plug 'heavenshell/vim-pydocstring'
Plug 'vim-scripts/django.vim'
" Indent text object
Plug 'michaeljsmith/vim-indent-object'
" Indentation based movements
Plug 'jeetsukumaran/vim-indentwise'
" Better language packs
Plug 'sheerun/vim-polyglot'
" Paint css colors with the real color
Plug 'lilydjwg/colorizer'
" Highlight matching html tags
Plug 'valloric/MatchTagAlways', {'for': 'html'}
" Generate html in a simple way
" Plug 'mattn/emmet-vim', {'for': 'html'}
" Git integration
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' " hub extension for fugitive
Plug 'sodapopcan/vim-twiggy'
" TODO: Switch to vim-gitgutter???
Plug 'mhinz/vim-signify'  " diff icons on the side of the file lines
" switch values (e.g. true/false)
Plug 'AndrewRadev/switch.vim'
" Surround
Plug 'tpope/vim-surround'
Plug 'andymass/vim-matchup'
" Session
Plug 'tpope/vim-obsession'
Plug 'mhinz/vim-startify'
" For R, RScript, Rscript, r, rscript
" Plug 'jalvesaq/Nvim-R', {'for': 'Rscript'} " R Console inside neovim
" Plug 'gaalcaras/ncm-R', {'for': 'Rscript'} " R automatic code completion (RStudio style)
" Latex, latex, Latex
" Plug 'donRaphaco/neotex', {'for': 'tex'}
Plug 'lervag/vimtex', {'for': 'tex'}
" Snippets
" Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'   " shougo's snippet collection
Plug 'honza/vim-snippets'           " honza's snippet collection
" Tell vim-plug we finished declaring plugins, so it can load them
Plug 'ryanoasis/vim-devicons'
" markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  , 'for': ['markdown', 'vim-plug']}
" Improved php syntax
Plug 'StanAngeloff/php.vim', {'for': 'inc'}

" Multilanguage debug
Plug 'vim-vdebug/vdebug'
Plug 'puremourning/vimspector'
" support for --remote and 'friends'
Plug 'mhinz/neovim-remote'
Plug 'tpope/vim-dispatch'

" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'

call plug#end()

nmap <F5> <Plug>VimspectorContinue

" ============================================================================
" Install plugins the first time vim runs

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

" ============================================================================
" Host dependent paths

function! IsOnSomeParticularMachine(hostname)
    return match(system("echo -n $HOST"), a:hostname) >= 0
endfunction

source ~/.config/nvim/_machine_specific.vim
" let g:neomake_logfile='/home/schmidt/.config/nvim/log/neomake.log'

" let g:echodoc#enable_at_startup = 1
" ============================================================================
" provider paths

let g:perl_host_prog = '/home/ben/.programs/anaconda3/envs/neovim3/bin/perl'
" ============================================================================
" Vim settings and mappings

let g:gruvbox_italic=1
let g:gruvbox_contrast_dark = 'medium'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'
colorscheme gruvbox-material
let g:airline_theme='gruvbox_material'
lua require("colorbuddy").colorscheme("gruvbuddy")

let mapleader=","                           " set Mapleader
" let maplocalleader="-"                           " set Maplocalleader

" if has('mouse')
"     set mouse=a
" endif

set encoding=utf-8                          " standard encoding

set clipboard+=unnamedplus                  " use system clipboard
set tags=./.git/tags,tags;                  " tag file path env

" FIXME:
set scrolloff=7                             " let 10 lines before/after cursor during scroll
set showmatch                               " shows matching part of bracket pairs (), [], {}

" tabs and spaces handling
set expandtab                               " use spaces for tab
set tabstop=4                               " number of spaces of tab
set softtabstop=4                           " number of spaces of tab in insert mode
set shiftwidth=4                            " number of spaces of autoindent
set expandtab                               " expand tabs into spaces
set backspace=indent,eol,start              " make backspace behave in a sane manner
set splitright                              " open split window on right side
set splitbelow                              " open split window on right side
 
" set number relativenumber                   " turn hybrid line numbers on
set nu rnu                                  " show line numbers
" toggle relativenumber/number when window gains/looses focus
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
set ignorecase                              " ignore case of letter in search
set smartcase                               " override ignorecase if capital letter is typed
set hlsearch                                " highlight search results
set incsearch                               " set incremental search, like modern browsers
set noerrorbells                            " turn off error sound notification
set visualbell                              " visual error notification
set background=dark
set t_Co=256
"
" set spellchecking
autocmd BufRead,BufNewFile *.md *.txt *.tex setlocal spell
set spelllang=en_us,de_de                  " set language dicts

set fillchars+=vert:\                       " remove vertical lines on window division

set completeopt+=menu,preview               " autocompletion menu mode
set wildmode=list:longest                   " complete like shell

set shell=/bin/bash                         " set shell used for commands (neomake, ..)

" if (has("termguicolors"))
set termguicolors                           " set colorspace (important for most colorschemes)
" endif
let base16colorspace=256                    " set base16 colorspace (importatn for base16 colorschemes)
syntax enable

nnoremap <silent> // :noh<CR>               " clear search results
ca w!! w !sudo tee "%"                      " save as sudo

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y

" Paste from clipboard
" nnoremap <leader>p "+p
" nnoremap <leader>P "+P
" vnoremap <leader>p "+p
" vnoremap <leader>P "+P

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>ef :e $VIMRUNTIME/ftdetect/mine.vim<CR>
nnoremap <leader>et :e ~/.tmux.conf.local<CR>
nnoremap <leader>ed :e ~/<CR>
nnoremap <leader>em :e ~/.config/nvim/_machine_specific.vim<CR>
nnoremap <leader>eg :e ~/.gitconfig<CR>
nnoremap <leader>ei :e ~/.gitignore<CR>
nnoremap <leader>eb :e ~/.bashrc<CR>
nnoremap <leader>ec :CocConfig<CR>
nnoremap <leader>ch :checkhealth<CR>

" Update Plugins
function! UpdatePlugins()
    PlugUpgrade
    PlugUpdate
    sleep 4
    UpdateRemotePlugins
endfunction
nnoremap <leader>up :call UpdatePlugins()<CR>

" ============================================================================
" FileType specifications

au BufRead,BufNewFile *.pro set filetype=idlang
au BufRead,BufNewFile bash* set filetype=bash


" ============================================================================
" Navigation

" Ctrl-<key> split movement in all modes (no terminal)
noremap <C-j> <Esc>:tabn<CR>
noremap <C-l> <Esc>:bnext<CR>
noremap <C-h> <Esc>:bprev<CR>
noremap <C-k> <Esc>:tabp<CR>
" Ctrl-<key> split movement in terminal mode
tnoremap <C-j> <c-\><c-n>:tabn<CR>
tnoremap <C-l> <c-\><c-n>:bnext<CR>
tnoremap <C-h> <c-\><c-n>:bprev<CR>
tnoremap <C-k> <c-\><c-n>:tabp<CR>

" terminal mappings
tmap <Esc> <C-\><C-n>
tmap <C-w> <Esc><C-w>
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

" tab navigation mappings
map <C-n> :tabnew<CR>
map <C-Right> :tabn<CR>
map <C-Right> <ESC>:tabn<CR>
map <C-Left> :tabp<CR>
map <C-Left> <ESC>:tabp<CR>

" Session options and navigation
"
let g:startify_session_dir = '~/.dotfiles/vim/sessions/'

" vim-maximizer
nnoremap <silent><leader>m :MaximizerToggle<CR>
vnoremap <silent><leader>m :MaximizerToggle<CR>gv
" ============================================================================
" Plugins settings and mappings
"
" Firenvim -----------------------------
let g:firenvim_config = {
    \ 'globalSettings': {
        \ 'alt': 'all',
    \  },
    \ 'localSettings': {
        \ '.*': {
            \ 'cmdline': 'neovim',
            \ 'priority': 0,
            \ 'selector': 'textarea',
            \ 'takeover': 'always',
        \ },
    \ }
\ }
let fc = g:firenvim_config['localSettings']
let fc['https?://www.overleaf.com/'] = { 'takeover': 'never', 'priority': 1 }

nnoremap <Esc><Esc> :call firenvim#focus_page()<CR>
nnoremap <C-z> :call firenvim#hide_frame()<CR>

" Rainbow parentheses -----------------------------
autocmd VimEnter * RainbowParentheses

" Switch ------------------------------
let g:switch_mapping="<F8>"

nnoremap <leader>- :call switch#Switch()<CR>

" Tasklist ------------------------------
" show pending tasks list
map <F3> :TaskList<CR>

" Fzf ------------------------------
nnoremap <C-p> :Files<CR>
" file finder mapping
nmap <leader>ff :Files<CR>
"  git file finder mapping
nmap <leader>fg :GFiles<CR>
" Riggrep
nmap <leader>fr :Rg<CR>
" find snippets (UltiSnips)
nmap <leader>fs :Snippets<CR>
" tags (symbols) in current file finder mapping
nmap <leader>fT :BTag<CR>
" tags (symbols) in all files finder mapping
nmap <leader>ft :Tag<CR>
" general code finder in current file mapping
nmap <leader>fL :BLines<CR>
" general code finder in all files mapping
nmap <leader>fl :Lines<CR>
" commands finder mapping
nmap <leader>fc :Commands<CR>

if exists('$TMUX')
  " let g:fzf_layout = { 'tmux': '-p90%,60%' }
  let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
else
  let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
endif

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_branch_actions = {
      \ 'rebase': {
      \   'prompt': 'Rebase> ',
      \   'execute': 'echo system("{git} rebase {branch}")',
      \   'multiple': v:false,
      \   'keymap': 'ctrl-r',
      \   'required': ['branch'],
      \   'confirm': v:false,
      \ },
      \ 'track': {
      \   'prompt': 'Track> ',
      \   'execute': 'echo system("{git} checkout --track {branch}")',
      \   'multiple': v:false,
      \   'keymap': 'ctrl-t',
      \   'required': ['branch'],
      \   'confirm': v:false,
      \ },
      \}

if using_neovim && !exists('g:fzf_layout')
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
endif

" to be able to call CtrlP with default search text
function! CtrlPWithSearchText(search_text, ctrlp_command_end)
execute ':CtrlP' . a:ctrlp_command_end
call feedkeys(a:search_text)
endfunction
" same as previous mappings, but calling with current word as default text
nmap <leader>wT :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
nmap <leader>wt :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
nmap <leader>wl :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
nmap <leader>we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
nmap <leader>pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
nmap <leader>wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
nmap <leader>wc :call CtrlPWithSearchText(expand('<cword>'), 'CmdPalette')<CR>

" Jedi-vim ------------------------------

" Disable autocompletion (using deoplete instead)
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0           " no auto vim configuration
let g:jedi#auto_initialization = 0

" Autoclose ------------------------------

" Fix to let ESC work as espected with Autoclose plugin
" (without this, when showing an autocompletion window, ESC won't leave insert
"  mode)
" let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

" Yankring -------------------------------

" Fix for yankring and neovim problem when system has non-text things copied
" in clipboard
let g:yankring_clipboard_monitor = 0
let g:yankring_history_dir = '~/.config/nvim/'

" Airline ------------------------------

let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" to use fancy symbols for airline, uncomment the following lines and use a
" patched font (more info on docs/fancy_symbols.rst)
" if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
" endif
" let g:airline_left_sep = '⮀'
" let g:airline_left_alt_sep = '⮁'
" let g:airline_right_sep = '⮂'
" let g:airline_right_alt_sep = '⮃'
" let g:airline_symbols.branch = '⭠'
" let g:airline_symbols.readonly = '⭤'
" let g:airline_symbols.linenr = '⭡'

"=====================================================
"" NERDTree settings

" let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']     " Ignore files in NERDTree
" let NERDTreeWinSize=40
" autocmd VimEnter * if !argc() | NERDTree | endif  " Load NERDTree only if vim is run without arguments
" nmap " :NERDTreeToggle<CR>
" nmap ,t :NERDTreeFind<CR>

"=====================================================
"" NERDComment Settings

let g:NERDSpaceDelims = 1                       " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1                   " Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left'                 " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDAltDelims_java = 1                    " Set a language to use its alternate delimiters by default
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }   " Add your own custom formats or override the defaults
let g:NERDCommentEmptyLines = 1                 " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1            " Enable trimming of trailing whitespace when uncommenting

"=====================================================
"" NVim-R, Nvim-R, nvim-r, nvimr, R, r
" Start R
nmap <leader>rs <Plug>RStart
imap <leader>rs <Plug>RStart
vmap <leader>rs <Plug>RStart
map <leader>rxx <Plug>RSendLine
map <leader>rxb <Plug>RSendAboveLines

"=====================================================
"" DevIcon Settings

" loading the plugin
let g:webdevicons_enable = 1

" adding the flags to NERDTree
let g:webdevicons_enable_nerdtree = 1

" adding to vim-airline's tabline
let g:webdevicons_enable_airline_tabline = 1

" adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline = 1

" turn on/off file node glyph decorations (not particularly useful)
let g:WebDevIconsUnicodeDecorateFileNodes = 1

" use double-width(1) or single-width(0) glyphs
" only manipulates padding, has no effect on terminal or set(guifont) font
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1

" whether or not to show the nerdtree brackets around flags
let g:webdevicons_conceal_nerdtree_brackets = 0

" the amount of space to use after the glyph character (default ' ')
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

" Force extra padding in NERDTree so that the filetype icons line up vertically
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1

" change the default character when no match found
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = 'ƛ'

" set a byte character marker (BOM) utf-8 symbol when retrieving file encoding
" disabled by default with no value
let g:WebDevIconsUnicodeByteOrderMarkerDefaultSymbol = ''

" enable folder/directory glyph flag (disabled by default with 0)
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" enable open and close folder/directory glyph flags (disabled by default with 0)
let g:DevIconsEnableFoldersOpenClose = 1

" enable pattern matching glyphs on folder/directory (enabled by default with 1)
let g:DevIconsEnableFolderPatternMatching = 1

" enable file extension pattern matching glyphs on folder/directory (disabled by default with 0)
let g:DevIconsEnableFolderExtensionPatternMatching = 0


"=====================================================
"" Latex, latex, LaTeX
"=====================================================
" let g:polyglot_disabled = ['latex']  " Disable polyplot for latex, needed for vimtex
let g:vimtex_fold_enabled = 1

" let g:tex_flavor = 'latex'
let g:vimtex_compiler_progname = 'nvr'

"=====================================================
"" Snippets, neosnippet
"=====================================================

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" Folder for vim-snippets by Honza
" (Python-snips manually added to neosnippet file as well)
" let g:neosnippet#snippets_directory='~/.config/nvim/plugged/vim-snippets/snippets/'

"=====================================================
"" Custom Functions

" Trim Whitespaces
function! TrimWhitespace()
    let save = winsaveview()
    %s/\\\@<!\s\+$//e
    call winrestview(save)
endfunction

" Dracula Mode (Dark)
function! ColorSolarized_low()
    let g:airline_theme='solarized'
    colorscheme solarized8_low
    " IndentLinesEnable
endfunction

" Seoul256 Mode (Dark & Light)
function! ColorSeoul256()
    let g:airline_theme='zenburn'
    colorscheme seoul256
    " IndentLinesDisable
endfunction

" Forgotten Mode (Light)
function! ColorTender()
    " Light airline themes: tomorrow, silver, alduin
    " Light colors: forgotten-light, nemo-light
    let g:airline_theme='tender'
    colorscheme tender
    " IndentLinesDisable
endfunction

" Zazen Mode (Black & White)
function! ColorZazen()
    let g:airline_theme='badwolf'
    colorscheme zazen
    " IndentLinesEnable
endfunction

function! ColorBadwolf()
    let g:airline_theme='badwolf'
    colorscheme badwolf
endfunction

function! ColorOceanicNext()
    let g:airline_theme='oceanicnext'
    colorscheme OceanicNext
endfunction

function! ColorOnedark()
    let g:onedark_terminal_italics=1
    let g:airline_theme='onedark'
    colorscheme onedark
endfunction

function! ColorPalenight()
    let g:palenight_terminal_italics=1
    let g:airline_theme='palenight'
    colorscheme palenight
endfunction

function! ColorNeodark()
    let g:airline_theme='palenight'
    colorscheme neodark
endfunction

function! ColorGruvbox()
    let g:airline_theme='gruvbox'
    colorscheme gruvbox
endfunction

" switch aesthetics
" nmap <leader>g :Goyo<CR>
nmap <leader>fct :Colors<CR>
nmap <leader>fat :AirlineTheme
nmap <leader>sct1 :call ColorSolarized_low()<CR>
nmap <leader>sct2 :call ColorSeoul256()<CR>
nmap <leader>sct3 :call ColorTender()<CR>
nmap <leader>sct4 :call ColorZazen()<CR>
nmap <leader>sct5 :call ColorBadwolf()<CR>
nmap <leader>sct6 :call ColorOceanicNext()<CR>
nmap <leader>sct7 :call ColorOnedark()<CR>
nmap <leader>sct8 :call ColorPalenight()<CR>
nmap <leader>sct9 :call ColorNeodark()<CR>
nmap <leader>sct0 :call ColorGruvbox()<CR>
nmap <leader>rv :w<CR> :so ~/.config/nvim/init.vim<CR> 
nmap <leader>ri :w<CR> :so ~/.config/nvim/init.vim<CR> :PlugInstall <CR>
nmap <leader>ru :w<CR> :so ~/.config/nvim/init.vim<CR> :PlugClean <CR>
nmap <leader>rb :w<CR> :so ~/.bashrc<CR>
nmap <leader>tw :call TrimWhitespace()<CR>

"=====================================================
"" vim-test, test
let test#strategy = "neoterm"
let test#python#runner = "pyunit"
let test#neovim#term_position = "topleft"
let g:test#preserve_screen = 1  " No clearing of screen when executing tests"

nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tg :TestVisit<CR>

"=====================================================
"" Neoterm
let g:neoterm_default_mod='botright'        " open terminals with mod
let g:neoterm_use_relative_path=1           " expand % to file path
let g:neoterm_direct_open_repl=1
let g:neoterm_repl_python='/home/ben/.programs/anaconda3/bin/ipython'
let g:neoterm_autoscroll=1
let g:neoterm_keep_term_open=1
let g:neoterm_term_per_tab=1
" mappings to send stuff to REPL
vmap <leader>x <Plug>(neoterm-repl-send)           
nmap <leader>xx <Plug>(neoterm-repl-send-line)
nmap <leader>xf gg<S-v>``G<Plug>(neoterm-repl-send)``
xmap <leader>x <Plug>(neoterm-repl-send)

"=====================================================
"" Neoterm

"=====================================================
"" Git section
" fugitive
nmap <leader>gs :Gstatus<cr>
nmap <leader>gw :Gwrite<cr>
nmap <leader>ge :Gedit<cr>
nmap <leader>gcf :Gcommit %<cr>
nmap <leader>gcm :Gcommit %
nmap <leader>gp :Gpush<cr>
nmap <leader>gP :Gpull<cr>
nmap <leader>gr :Gread<cr>
nmap <leader>gbf :Gblame<cr>
nmap <leader>gbb v :Gblame<cr>
nmap <leader>gm :Gmerge
nmap <leader>gf :GFiles<cr>
vmap <silent>gu <esc>:Gdiff<cr>gv:diffget<cr><c-w><c-w>ZZ
" rhubarb
nmap <leader>ghb :Gbrowse<cr>
" coc-git
nmap gk <Plug>(coc-git-prevchunk)
nmap gj <Plug>(coc-git-nextchunk)
nmap gi <Plug>(coc-git-chunkinfo)
nmap gu :CocCommand git.chunkUndo<cr>
" Twiggy
nmap <leader>gt :Twiggy<CR>
" Signify
let g:signify_vcs_list = [ 'git' ]                  " vcs systems to check (many might slow opening of files)
" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227


"=====================================================
"" Coc, coc
let g:coc_node_path = "/usr/bin/node"

let g:coc_global_extensions = [
            \ 'coc-bibtex',
            \ 'coc-calc',
            \ 'coc-clangd',
            \ 'coc-css',
            \ 'coc-dictionary',
            \ 'coc-emmet',
            \ 'coc-emoji',
            \ 'coc-eslint',
            \ 'coc-explorer',
            \ 'coc-git',
            \ 'coc-gitignore',
            \ 'coc-highlight',
            \ 'coc-html',
            \ 'coc-jedi',
            \ 'coc-json',
            \ 'coc-lists',
            \ 'coc-marketplace',
            \ 'coc-pairs', 
            \ 'coc-phpls',
            \ 'coc-prettier',
            \ 'coc-pyright',
            \ 'coc-r-lsp',
            \ 'coc-sh',
            \ 'coc-smartf',
            \ 'coc-snippets',
            \ 'coc-styled-components',
            \ 'coc-syntax',
            \ 'coc-tag',
            \ 'coc-terminal',
            \ 'coc-texlab', 
            \ 'coc-todolist',
            \ 'coc-tsserver',
            \ 'coc-tslint-plugin',
            \ 'coc-vetur',
            \ 'coc-vimlsp',
            \ 'coc-vimtex',
            \ 'coc-word',
            \ 'coc-yank',
            \ 'coc-yaml'
            \ ]

set hidden              " if hidden is not set, TextEdit might fail.
set nobackup            " Some servers have issues with backup files, see #649
set nowritebackup
set updatetime=300      " You will have bad experience for diagnostic messages when it's default 4000.
set shortmess+=c        " don't give |ins-completion-menu| messages.
set signcolumn=yes      " always show signcolumns

"""" coc keymaps
nmap <leader>ue :CocCommand extensions.forceUpdateAll<CR>
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> dk <Plug>(coc-diagnostic-prev)
nmap <silent> dj <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
" coc-explorer
nmap <leader>e :CocCommand explorer<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
vmap <leader>f  <Plug>(coc-format-selected)
nnoremap <leader>f :<C-u>Format <cr>

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocAction('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <space>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <space>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of
" languageserver.

xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" use `:Sort` for organize import of current buffer
command! -nargs=0 Sort   :call CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" CocList, coc-lists, Lists
" Search buffers
nnoremap <silent> <space>lb  :<C-u>CocList buffers<cr>
" Show commands
nnoremap <silent> <space>lc  :<C-u>CocList commands<cr>
" Show all diagnostics
nnoremap <silent> <space>ld  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>le  :<C-u>CocList extensions<cr>
" Search files
nnoremap <silent> <space>lf  :<C-u>CocList files<cr>
" Search most recently used (mru)
nnoremap <silent> <space>lm  :<C-u>CocList mru<cr>
" Find symbol of current document
nnoremap <silent> <space>lo  :<C-u>CocList outline<cr>
" Search sessions
nnoremap <silent> <space>ls  :<C-u>CocList sessions<cr>
" Search tags
nnoremap <silent> <space>lt  :<C-u>CocList tags<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>h  :<C-u>CocListResume<CR>
" Generate tags for project in cwd
nnoremap <silent> <space>gt  :<C-u>CocCommand tags.generate<CR>
" save session
nnoremap <silent> <space>ss  :<C-u>CocCommand session.save<CR>
" save load
nnoremap <silent> <space>sl  :<C-u>CocCommand session.save<CR>

"" coc-snippet
imap <C-l> <Plug>(coc-snippets-expand)          " Use <C-l> for trigger snippet expand.
vmap <C-j> <Plug>(coc-snippets-select)          " Use <C-j> for select text for visual placeholder of snippet.
let g:coc_snippet_next = '<c-j>'                " Use <C-j> for jump to next placeholder, it's default of coc.nvim 
let g:coc_snippet_prev = '<c-k>'                " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
imap <C-j> <Plug>(coc-snippets-expand-jump)     " Use <C-j> for both expand and jump (make expand higher priority.)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" let g:coc_snippet_next = '<tab>'
let g:python_highlight_all = 1

" python, coc-python
nmap <space>pi :CocCommand python.setInterpreter<CR>
nmap <space>pl :CocCommand python.runLinting<CR>
autocmd BufWritePre *.py :%s/\s\+$//e " trim trailing spaces

" Coc-Calc, coc-calc
"
" append result on current expression
map <space>ca <Plug>(coc-calc-result-append)
" replace result on current expression
map <space>cr <Plug>(coc-calc-result-replace)

" Coc-todolist, coc-todolist
"
nnoremap <space>dtc :CocCommand todolist.create<CR>
nnoremap <space>tdu :CocCommand todolist.upload<CR>
nnoremap <space>tdd :CocCommand todolist.download<CR>
nnoremap <space>tde :CocCommand todolist.export<CR>
nnoremap <space>td0 :CocCommand todolist.clearNotice<CR>
nnoremap <space>ltd :CocList todolist<CR>

" coc-terminal

nmap <space>tt <Plug>(coc-terminal-toggle)
nmap <space>tr :CocCommand terminal.REPL<CR>
nmap <space>tq :CocCommand terminal.Destroy<CR>

" coc-smartf
nmap f <Plug>(coc-smartf-forward)
nmap F <Plug>(coc-smartf-backward)
nmap ; <Plug>(coc-smartf-repeat)
nmap , <Plug>(coc-smartf-repeat-opposite)

augroup Smartf
  autocmd User SmartfEnter :hi Conceal ctermfg=220 guifg=#6638F0
  autocmd User SmartfLeave :hi Conceal ctermfg=239 guifg=#504945
augroup end
