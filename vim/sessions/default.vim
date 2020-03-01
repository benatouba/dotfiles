let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/.dotfiles
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 bash_logout
badd +1 bashrc
badd +1 dotbot
badd +0 gitconfig
badd +0 gitignore
badd +0 git_template
badd +0 init.vim
badd +0 install
badd +0 install.conf.yaml
badd +0 profile
badd +0 ssh
badd +1 vim
badd +1 Xresources
badd +1 zshrc
argglobal
%argdel
$argadd bash_aliases
$argadd bash_logout
$argadd bashrc
$argadd dotbot
$argadd gitconfig
$argadd gitignore
$argadd git_template
$argadd init.vim
$argadd install
$argadd install.conf.yaml
$argadd profile
$argadd ssh
$argadd vim
$argadd Xresources
$argadd zshrc
set splitbelow splitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
enew
file __Tagbar__.1
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
tabnext 1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToOFc
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
