" Fisa-nvim-config
" http://nvim.fisadev.com
" version: 10.0

" ============================================================================
" Vim-plug initialization
" Avoid modify this section, unless you are very sure of what you are doing

let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.config/nvim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.config/nvim/autoload
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

" Obscure hacks done, you can now modify the rest of the .vimrc as you wish :)

" ============================================================================
" Active plugins
" You can disable or add new ones here:

" this needs to be here, so vim-plug knows we are declaring the plugins we
" want to use
call plug#begin('~/.config/nvim/plugged')

" Aesthetics - Main
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/goyo.vim'
" Plug 'junegunn/limelight.vim'
Plug 'junegunn/seoul256.vim'
" Plug 'junegunn/vim-journal'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'zaki/zazen'
Plug 'chriskempson/base16-vim'

" Aethetics - themes
Plug 'mhartington/oceanic-next'
Plug 'joshdick/onedark.vim'
Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim' }
Plug 'rhysd/vim-color-spring-night'
Plug 'tomasr/molokai'
Plug 'sjl/badwolf'
Plug 'liuchengxu/space-vim-dark'
Plug 'neg-serg/neg'
Plug 'jacoborus/tender.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'nightsense/forgotten'
Plug 'dracula/vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'KeitaNakamura/neodark.vim'

" Close buffers but keep splits
Plug 'moll/vim-bbye'
" Override configs by directory
Plug 'arielrossanigo/dir-configs-override.vim'
" Code commenter
Plug 'scrooloose/nerdcommenter'
" easier terminal Commands
Plug 'kassio/neoterm'
" Class/module browser
Plug 'majutsushi/tagbar'
" Search results counter
Plug 'vim-scripts/IndexedSearch'
" Code and files fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'
" Extension to ctrlp, for fuzzy command finder
Plug 'fisadev/vim-ctrlp-cmdpalette'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Pending tasks list
Plug 'fisadev/FixedTaskList.vim'
" Async autocompletion
Plug 'Shougo/echodoc.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}                       " Autocompletion using LSP
" Completion from other opened files
Plug 'Shougo/context_filetype.vim'
""  Python 
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins', 'for': 'python'}
" Plug 'zchee/deoplete-jedi', { 'do': ':UpdateRemotePlugins' }
Plug 'davidhalter/jedi-vim'
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
Plug 'mattn/emmet-vim', {'for': 'html'}
" Git integration
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' " hub extension for fugitive
Plug 'sodapopcan/vim-twiggy'
" TODO: Switch to vim-gitgutter???
Plug 'mhinz/vim-signify'  " Git diff icons on the side of the file lines
" Surround
Plug 'tpope/vim-surround'
" Session
Plug 'tpope/vim-obsession'
" Yank history navigation
Plug 'vim-scripts/YankRing.vim'
" Relative numbering of lines (0 is the current line)
Plug 'myusuf3/numbers.vim'
" For R, RScript, Rscript, r, rscript
Plug 'jalvesaq/Nvim-R', {'for': 'Rscript'} " R Console inside neovim
" Plug 'gaalcaras/ncm-R', {'for': 'Rscript'} " R automatic code completion (RStudio style)
" Latex, latex, Latex
" Plug 'donRaphaco/neotex', {'for': 'tex'}
Plug 'lervag/vimtex', {'for': 'tex'}
" Snippets
" Plug 'Shougo/neosnippet'
" Plug 'Shougo/neosnippet-snippets'   " shougo's snippet collection
" Plug 'honza/vim-snippets'           " honza's snippet collection
" Tell vim-plug we finished declaring plugins, so it can load them
Plug 'ryanoasis/vim-devicons'
" If you have nodejs and yarn
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  , 'for': ['markdown', 'vim-plug']}
" Improved php syntax
Plug 'StanAngeloff/php.vim', {'for': 'inc'}

" support for --remote and 'friends'
Plug 'mhinz/neovim-remote'

call plug#end()

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

" ============================================================================
" Vim settings and mappings

colorscheme OceanicNext
let g:airline_theme='oceanicnext'

let mapleader=","                           " set Mapleader

" if has('mouse')
"     set mouse=a
" endif

set encoding=utf-8                          " standard encoding

set clipboard+=unnamedplus                  " use system clipboard

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

set nu                                      " show line numbers
set ignorecase                              " ignore case of letter in search
set smartcase                               " override ignorecase if capital letter is typed
set hlsearch                                " highlight search results
set incsearch                               " set incremental search, like modern browsers
set noerrorbells                            " turn off error sound notification
set visualbell                              " visual error notification

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
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>em :e ~/.config/nvim/_machine_specific.vim<CR>
nnoremap <leader>eg :e ~/.gitconfig<CR>
nnoremap <leader>eb :e ~/.bashrc<CR>
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
" Navigation

" window and tab navigation
nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprevious<CR>

" Alt-<key> split movement in all modes (no terminal)
map <A-h> <Esc><c-w>h
map <A-j> <Esc><c-w>j
map <A-k> <Esc><c-w>k
map <A-l> <Esc><c-w>l
" Alt-<key> split movement in terminal mode
tnoremap <A-h> <c-\><c-n><c-w>h
tnoremap <A-j> <c-\><c-n><c-w>j
tnoremap <A-k> <c-\><c-n><c-w>k
tnoremap <A-l> <c-\><c-n><c-w>l

" terminal mappings
tmap <Esc> <C-\><C-n>
tmap <C-w> <Esc><C-w>
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

" tab navigation mappings
map tt :tabnew
map <M-Right> :tabn<CR>
imap <M-Right> <ESC>:tabn<CR>
map <M-Left> :tabp<CR>
imap <M-Left> <ESC>:tabp<CR>

" ============================================================================
" Filetype specific commands
" Execute line in python3
autocmd FileType python nmap <leader>x :0,$!python3 -m yapf<CR>

" clear empty spaces at the end of lines on save of python files
autocmd BufWritePre *.py :%s/\s\+$//e

" ============================================================================
" Plugins settings and mappings

" ack -----------------------------

" Tagbar -----------------------------
map <F4> :TagbarToggle<CR>                  " toggle tagbar display
let g:tagbar_autofocus = 1                  " autofocus on tagbar open

" Tasklist ------------------------------
" show pending tasks list
map <F2> :TaskList<CR>

" Neomake ------------------------------

" Run linter on write
" autocmd! BufWritePost * Neomake
" let g:neomake_verbose=1
" let g:neomake_open_list = 1

" Check code as python3 by default
" let g:neomake_python_enabled_makers = ['pyflakes']
" let g:neomake_python_python_maker = neomake#makers#ft#python#python()
" let g:neomake_python_flake8_maker = neomake#makers#ft#python#flake8()
" let g:neomake_python_python_maker.exe = 'python3 -m py_compile'
" let g:neomake_python_flake8_maker.exe = 'python3 -m flake8'

" call neomake#configure#automake('w', 1000)

" Fzf ------------------------------

" file finder mapping
nmap <leader>ff :Files<CR>
" tags (symbols) in current file finder mapping
" nmap <leader>fT :BTag<CR>
" tags (symbols) in all files finder mapping
nmap <leader>ft :Tag<CR>
" general code finder in current file mapping
nmap <leader>fL :BLines<CR>
" general code finder in all files mapping
nmap <leader>fl :Lines<CR>
" commands finder mapping
nmap <leader>fc :Commands<CR>

augroup fzfbindings
  autocmd! fzfbindings
  autocmd FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler | unmap! <ESC>
  autocmd FileType fzf map <buffer> <silent> <ESC> <ESC>:bd!<CR>
augroup end

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


" Deoplete -----------------------------

" let g:deoplete#enable_at_startup = 0
" let g:context_filetype#same_filetypes = {}
" let g:context_filetype#same_filetypes._ = '_'
" call deoplete#custom#option({
"             \'auto_complete_delay': 200,
"             \'refresh_always': v:false,
"             \})
" call deoplete#initialize()

" Jedi-vim ------------------------------

" " Disable autocompletion (using deoplete instead)
" let g:jedi#completions_enabled = 0

" " All these mappings work only for python code:
" " Go to definition
" let g:jedi#goto_command = ',d'
" " Find ocurrences
" let g:jedi#usages_command = ',o'
" " Find assignments
" let g:jedi#goto_assignments_command = ',a'
" " Go to definition in new tab
" nmap ,D :tab split<CR>:call jedi#goto()<CR>

" let g:jedi#auto_vim_configuration = 0           " no auto vim configuration

" fzf.vim ------------------------------


let g:fzf_layout = {'down': '40%'}
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
if has('nvim') && !exists('g:fzf_layout')
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
endif

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
"" FZF

nnoremap <C-p> :FZF<CR>

"=====================================================
"" NERDComment Settings

let g:NERDSpaceDelims = 1                       " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1                   " Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left'                 " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDAltDelims_java = 1                    " Set a language to use its alternate delimiters by default
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }   " Add your own custom formats or override the defaults
let g:NERDCommentEmptyLines = 0                 " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1            " Enable trimming of trailing whitespace when uncommenting

"=====================================================
"" Vim-isort

let g:vim_isort_python_version = 'python3'
let g:vim_isort_map = '<C-i>'

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

" let g:tex_flavor = 'latex'
let g:vimtex_compiler_progname = 'nvr'
call coc#config('list.source.bibtex', {
  \  'files': [
  \    '~/documents/bibtex/library.bib'
  \  ]
  \})
call coc#config('list.source.bibtex.citation', {
    \ 'before': '\cite{',
    \ 'after': '}'
    \ })

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

" Dracula Mode (Dark)
function! ColorBadwolf()
    let g:airline_theme='badwolf'
    colorscheme badwolf
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

" switch aesthetics
" nmap <leader>g :Goyo<CR>
nmap <leader>ee :Colors<CR>
nmap <leader>ea :AirlineTheme
nmap <leader>e1 :call ColorSolarized_low()<CR>
nmap <leader>e2 :call ColorSeoul256()<CR>
nmap <leader>e3 :call ColorTender()<CR>
nmap <leader>e4 :call ColorZazen()<CR>
nmap <leader>e5 :call ColorBadwolf()<CR>
nmap <leader>e6 :call ColorOceanicNext()<CR>
nmap <leader>e7 :call ColorOnedark()<CR>
nmap <leader>e8 :call ColorPalenight()<CR>
nmap <leader>e9 :call ColorNeodark()<CR>
nmap <leader>rv :w<CR> :so ~/.config/nvim/init.vim<CR>
nmap <leader>rb :w<CR> :so ~/.bashrc<CR>
nmap <leader>tw :call TrimWhitespace()<CR>


"=====================================================
"" Neoterm
let g:neoterm_default_mod='botright'        " open terminals with mod
let g:neoterm_use_relative_path=1           " expand % to file path
" mappings to send stuff to REPL
vmap <leader>x <Plug>(neoterm-repl-send)           
nmap <leader>xx <Plug>(neoterm-repl-send-line)
nmap <leader>xf <Plug>(neoterm-repl-send-file)
xmap <leader>x <Plug>(neoterm-repl-send)

"=====================================================
""
" fugitive
nmap <leader>gs :Gstatus<cr>
nmap <leader>ge :Gedit<cr>
nmap <leader>gcf :Gcommit %<cr>
nmap <leader>gcm :Gcommit %
nmap <leader>gp :Gpush<cr>
nmap <leader>gP :Gpull<cr>
nmap <leader>gr :Gread<cr>
nmap <leader>gb :Gblame<cr>
" rhubarb
nmap <leader>ghb :Gbrowse<cr>
" coc-git
nmap <leader>gj <Plug>(coc-git-prevchunk)
nmap <leader>gk <Plug>(coc-git-nextchunk)
nmap <leader>gi <Plug>(coc-git-chunkinfo)
nmap <leader>gu :CocCommand git.chunkUndo<cr>
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

let g:coc_global_extensions = [
            \ 'coc-bibtex',
            \ 'coc-calc',
            \ 'coc-css',
            \ 'coc-dictionary',
            \ 'coc-emmet',
            \ 'coc-eslint',
            \ 'coc-explorer',
            \ 'coc-git',
            \ 'coc-gitignore',
            \ 'coc-highlight',
            \ 'coc-html',
            \ 'coc-json',
            \ 'coc-lists',
            \ 'coc-pairs', 
            \ 'coc-prettier',
            \ 'coc-python',
            \ 'coc-r-lsp',
            \ 'coc-snippets',
            \ 'coc-terminal',
            \ 'coc-texlab', 
            \ 'coc-todolist',
            \ 'coc-tsserver',
            \ 'coc-vetur',
            \ 'coc-vimlsp',
            \ 'coc-vimtex',
            \ 'coc-yank'
            \ ]

" if hidden is not set, TextEdit might fail.
set hidden

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

nmap <space>ue :CocCommand extensions.forceUpdateAll<CR>
" Use `(g` and `)g` to navigate diagnostics
nmap <silent> (g <Plug>(coc-diagnostic-prev)
nmap <silent> )g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

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
nmap <space>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <space>f  <Plug>(coc-format-selected)
nmap <space>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocAction('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <space>a  <Plug>(coc-codeaction-selected)
nmap <space>a  <Plug>(coc-codeaction-selected)

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

" use `:Org` for organize import of current buffer
command! -nargs=0 Org   :call CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{ObsessionStatus()}%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>ld  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>le  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>lc  :<C-u>CocList commands<cr>
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

"" coc-snippet

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" coc-python

nmap <space>pi :CocCommand python.setInterpreter<CR>
" Coc-Calc, coc-calc
"
" append result on current expression
map <space>ca <Plug>(coc-calc-result-append)
" replace result on current expression
map <space>cr <Plug>(coc-calc-result-replace)

" Coc-todolist, coc-todolist
"
nnoremap <space>tc :CocCommand todolist.create<CR>
nnoremap <space>tu :CocCommand todolist.upload<CR>
nnoremap <space>td :CocCommand todolist.download<CR>
nnoremap <space>te :CocCommand todolist.export<CR>
nnoremap <space>t0 :CocCommand todolist.clearNotice<CR>
nnoremap <space>tl :CocList todolist<CR>

" coc-terminal

nmap <space>tt <Plug>(coc-terminal-toggle)
nmap <space>tr :CocCommand terminal.REPL<CR>
nmap <space>tq :CocCommand terminal.Destroy<CR>
